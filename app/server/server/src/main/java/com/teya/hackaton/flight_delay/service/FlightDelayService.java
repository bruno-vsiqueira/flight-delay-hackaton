package com.teya.hackaton.flight_delay.service;

import com.teya.hackaton.flight_delay.model.Airport;
import com.teya.hackaton.flight_delay.model.DelayPredictionRequest;
import com.teya.hackaton.flight_delay.model.DelayPredictionResponse;
import com.teya.hackaton.flight_delay.repository.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class FlightDelayService {

    private final AirportRepository airportRepository;

    public FlightDelayService(AirportRepository airportRepository) {
        this.airportRepository = airportRepository;
    }

    public DelayPredictionResponse predictDelay(DelayPredictionRequest request) {

        Random random = new Random();
        double delayChance = random.nextDouble();
        double confidence = 70.0 + (random.nextDouble() * 30.0); // between 70% and 100%

        var delayPredictionResponse = new DelayPredictionResponse();
        delayPredictionResponse.setDelayChance(delayChance);
        delayPredictionResponse.setConfidence(confidence);
        return delayPredictionResponse;
    }

    public List<Airport> getAllAirports() {
        return airportRepository.findAllByOrderByAirportNameAsc();
    }
}
