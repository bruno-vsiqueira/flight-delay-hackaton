package com.teya.hackaton.flight_delay.service;

import com.teya.hackaton.flight_delay.model.*;
import com.teya.hackaton.flight_delay.repository.AirportRepository;
import com.teya.hackaton.flight_delay.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import smile.classification.LogisticRegression;

import java.util.List;
import java.util.Random;

@Service
public class FlightDelayService {

    private final AirportRepository airportRepository;
    private final FlightRepository flightRepository;

    public FlightDelayService(AirportRepository airportRepository, FlightRepository flightRepository) {
        this.airportRepository = airportRepository;
        this.flightRepository = flightRepository;
    }

    public DelayPredictionResponse predictDelay(DelayPredictionRequest request) {
        int airportId = Integer.parseInt(request.getAirportId());
        int dayOfWeek = DaysOfTheWeek.valueOf(request.getDayOfWeek()).getValue();
        List<Flight> flights = flightRepository.findByDwAndDestAirportID(dayOfWeek, airportId);

        int n = flights.size();
        double[][] features = new double[n][2];
        int[] labels = new int[n]; // Change type to int[]

        for (int i = 0; i < n; i++) {
            Flight flight = flights.get(i);
            features[i][0] = flight.getDw();
            features[i][1] = flight.getDestAirportID();
            labels[i] = flight.getArrDel15().intValue(); // Assign int directly
        }

        int trainSize = (int) (n * 0.8);
        double[][] trainFeatures = new double[trainSize][2];
        double[][] testFeatures = new double[n - trainSize][2];
        int[] trainLabels = new int[trainSize]; // Change type to int[]
        int[] testLabels = new int[n - trainSize]; // Change type to int[]

        for (int i = 0; i < trainSize; i++) {
            trainFeatures[i] = features[i];
            trainLabels[i] = labels[i];
        }
        for (int i = trainSize; i < n; i++) {
            testFeatures[i - trainSize] = features[i];
            testLabels[i - trainSize] = labels[i];
        }

        // Train the logistic regression model
        LogisticRegression model = LogisticRegression.fit(trainFeatures, trainLabels); // Use the fit method

        // Evaluate the model on the test set
        int correct = 0;
        for (int i = 0; i < testLabels.length; i++) {
            int prediction = model.predict(testFeatures[i]); // Directly returns an integer
            if (prediction == testLabels[i]) { // Comparison is now int vs int
                correct++;
            }
        }

        double accuracy = (double) correct / testLabels.length;
        System.out.println("Model Accuracy: " + accuracy);

        double[] posterior = new double[2]; // Array to store posterior probabilities
        model.predict(new double[]{dayOfWeek, airportId}, posterior); // Use predictProba method
        DelayPredictionResponse response = new DelayPredictionResponse();
        response.setDelayChance(posterior[1]); // Assuming index 1 corresponds to the delay chance (class 1)
        response.setConfidence(posterior[1]); // Confidence is the probability of the predicted class
        return response;
    }

    public List<Airport> getAllAirports() {
        return airportRepository.findAllByOrderByAirportNameAsc();
    }
}
