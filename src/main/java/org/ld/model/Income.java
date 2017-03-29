package org.ld.model;

import java.util.Date;

public class Income {
    private Integer ID;

    private String ROOM_NUMBER;

    private Integer GUEST_ID;

    private String GUEST_NAME;

    private Date TIME;

    private Double CONTRACT_RECEIVE;

    private Double CONTAACT_PAY;

    private Double BENIFIT;

    private Double SOURCE;

    private Double DAILY_SERVICE;

    private Double MAINTAIN;

    private Double SHUTTLE_BUS;

    private Double LAUNDRY;

    private Integer SYS_STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getROOM_NUMBER() {
        return ROOM_NUMBER;
    }

    public void setROOM_NUMBER(String ROOM_NUMBER) {
        this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
    }

    public Integer getGUEST_ID() {
        return GUEST_ID;
    }

    public void setGUEST_ID(Integer GUEST_ID) {
        this.GUEST_ID = GUEST_ID;
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
    }

    public Double getCONTRACT_RECEIVE() {
        return CONTRACT_RECEIVE;
    }

    public void setCONTRACT_RECEIVE(Double CONTRACT_RECEIVE) {
        this.CONTRACT_RECEIVE = CONTRACT_RECEIVE;
    }

    public Double getCONTAACT_PAY() {
        return CONTAACT_PAY;
    }

    public void setCONTAACT_PAY(Double CONTAACT_PAY) {
        this.CONTAACT_PAY = CONTAACT_PAY;
    }

    public Double getBENIFIT() {
        return BENIFIT;
    }

    public void setBENIFIT(Double BENIFIT) {
        this.BENIFIT = BENIFIT;
    }

    public Double getSOURCE() {
        return SOURCE;
    }

    public void setSOURCE(Double SOURCE) {
        this.SOURCE = SOURCE;
    }

    public Double getDAILY_SERVICE() {
        return DAILY_SERVICE;
    }

    public void setDAILY_SERVICE(Double DAILY_SERVICE) {
        this.DAILY_SERVICE = DAILY_SERVICE;
    }

    public Double getMAINTAIN() {
        return MAINTAIN;
    }

    public void setMAINTAIN(Double MAINTAIN) {
        this.MAINTAIN = MAINTAIN;
    }

    public Double getSHUTTLE_BUS() {
        return SHUTTLE_BUS;
    }

    public void setSHUTTLE_BUS(Double SHUTTLE_BUS) {
        this.SHUTTLE_BUS = SHUTTLE_BUS;
    }

    public Double getLAUNDRY() {
        return LAUNDRY;
    }

    public void setLAUNDRY(Double LAUNDRY) {
        this.LAUNDRY = LAUNDRY;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}