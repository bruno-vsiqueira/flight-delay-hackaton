package com.teya.hackaton.flight_delay.model;

public class DelayPredictionResponse {
    private double delayChance;
    private double confidence;

    public double getDelayChance() {
        return delayChance;
    }

    public void setDelayChance(double delayChance) {
        this.delayChance = delayChance;
    }

    public double getConfidence() {
        return confidence;
    }

    public void setConfidence(double confidence) {
        this.confidence = confidence;
    }
}
