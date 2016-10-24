package org.ld.model;

import java.util.Date;

public class ContractIncome {
    private Integer ID;

    private String ROOM_NUMBER;

    private String GUEST_NAME;

    private Date TIME;

    private Double RECEIVE;

    private Double PAY;

    private Double BENIFIT;

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

    public Double getRECEIVE() {
        return RECEIVE;
    }

    public void setRECEIVE(Double RECEIVE) {
        this.RECEIVE = RECEIVE;
    }

    public Double getPAY() {
        return PAY;
    }

    public void setPAY(Double PAY) {
        this.PAY = PAY;
    }

    public Double getBENIFIT() {
        return BENIFIT;
    }

    public void setBENIFIT(Double BENIFIT) {
        this.BENIFIT = BENIFIT;
    }
}