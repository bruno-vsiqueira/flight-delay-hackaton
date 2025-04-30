package com.teya.hackaton.flight_delay.repository;

import com.teya.hackaton.flight_delay.model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {
    List<Flight> findByDwAndDestAirportID(Integer dw, Integer destAirportID);
}