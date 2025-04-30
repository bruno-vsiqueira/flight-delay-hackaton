package com.teya.hackaton.flight_delay.controller;

import com.teya.hackaton.flight_delay.model.Airport;
import com.teya.hackaton.flight_delay.model.DelayPredictionRequest;
import com.teya.hackaton.flight_delay.model.DelayPredictionResponse;
import com.teya.hackaton.flight_delay.service.FlightDelayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class FlightDelayController {

    private final FlightDelayService flightDelayService;

    public FlightDelayController(FlightDelayService flightDelayService) {
        this.flightDelayService = flightDelayService;
    }
    
    @PostMapping("/predict-delay")
    public ResponseEntity<DelayPredictionResponse> predictDelay(@RequestBody DelayPredictionRequest request) {
        DelayPredictionResponse response = flightDelayService.predictDelay(request);
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/airports")
    public ResponseEntity<List<Airport>> getAirports() {
        List<Airport> airports = flightDelayService.getAllAirports();
        return ResponseEntity.ok(airports);
    }
}
