package com.teya.hackaton.flight_delay.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "flights")
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer yy;
    private Integer mm;
    private Integer dm;
    private Integer dw;

    @Column(length = 2)
    private String carrier;

    @Column(name = "OriginAirportID")
    private Integer originAirportID;

    @Column(name = "DestAirportID")
    private Integer destAirportID;

    @Column(name = "CRSDepTime")
    private Integer crsDepTime;

    @Column(name = "DepDelay")
    private Integer depDelay;

    @Column(name = "DepDel15", precision = 3, scale = 1)
    private BigDecimal depDel15;

    @Column(name = "CRSArrTime")
    private Integer crsArrTime;

    @Column(name = "ArrDelay")
    private Integer arrDelay;

    @Column(name = "ArrDel15", precision = 3, scale = 1)
    private BigDecimal arrDel15;

    private Integer cancelled;

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getYy() {
        return yy;
    }

    public void setYy(Integer yy) {
        this.yy = yy;
    }

    public Integer getMm() {
        return mm;
    }

    public void setMm(Integer mm) {
        this.mm = mm;
    }

    public Integer getDm() {
        return dm;
    }

    public void setDm(Integer dm) {
        this.dm = dm;
    }

    public Integer getDw() {
        return dw;
    }

    public void setDw(Integer dw) {
        this.dw = dw;
    }

    public String getCarrier() {
        return carrier;
    }

    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }

    public Integer getOriginAirportID() {
        return originAirportID;
    }

    public void setOriginAirportID(Integer originAirportID) {
        this.originAirportID = originAirportID;
    }

    public Integer getDestAirportID() {
        return destAirportID;
    }

    public void setDestAirportID(Integer destAirportID) {
        this.destAirportID = destAirportID;
    }

    public Integer getCrsDepTime() {
        return crsDepTime;
    }

    public void setCrsDepTime(Integer crsDepTime) {
        this.crsDepTime = crsDepTime;
    }

    public Integer getDepDelay() {
        return depDelay;
    }

    public void setDepDelay(Integer depDelay) {
        this.depDelay = depDelay;
    }

    public BigDecimal getDepDel15() {
        return depDel15;
    }

    public void setDepDel15(BigDecimal depDel15) {
        this.depDel15 = depDel15;
    }

    public Integer getCrsArrTime() {
        return crsArrTime;
    }

    public void setCrsArrTime(Integer crsArrTime) {
        this.crsArrTime = crsArrTime;
    }

    public Integer getArrDelay() {
        return arrDelay;
    }

    public void setArrDelay(Integer arrDelay) {
        this.arrDelay = arrDelay;
    }

    public BigDecimal getArrDel15() {
        return arrDel15;
    }

    public void setArrDel15(BigDecimal arrDel15) {
        this.arrDel15 = arrDel15;
    }

    public Integer getCancelled() {
        return cancelled;
    }

    public void setCancelled(Integer cancelled) {
        this.cancelled = cancelled;
    }
}
