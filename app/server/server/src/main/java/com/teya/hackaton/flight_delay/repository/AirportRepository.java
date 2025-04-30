package com.teya.hackaton.flight_delay.repository;

import com.teya.hackaton.flight_delay.model.Airport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirportRepository extends JpaRepository<Airport, String> {
    
    List<Airport> findAllByOrderByAirportNameAsc();
}
