package org.ld.model;

import java.util.Date;

public class Guest {
    private Integer ID;

    private String GUEST_NAME;

    private String ROOM_NUMBER;

    private String ROOM_TYPE;

    private String CONTRACT_NUMBER;

    private String TEL;

    private String COMPANY;

    private String TITLE;

    private Integer PERSONS;

    private Integer COMING;

    private String PARKING;

    private String CAR;

    private String COMMENT;

    private Double CHARGE;

    private Date TIMEIN;

    private Date TIMEOUT;

    private Integer SYS_STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public String getROOM_NUMBER() {
        return ROOM_NUMBER;
    }

    public void setROOM_NUMBER(String ROOM_NUMBER) {
        this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
    }

    public String getROOM_TYPE() {
        return ROOM_TYPE;
    }

    public void setROOM_TYPE(String ROOM_TYPE) {
        this.ROOM_TYPE = ROOM_TYPE == null ? null : ROOM_TYPE.trim();
    }

    public String getCONTRACT_NUMBER() {
        return CONTRACT_NUMBER;
    }

    public void setCONTRACT_NUMBER(String CONTRACT_NUMBER) {
        this.CONTRACT_NUMBER = CONTRACT_NUMBER == null ? null : CONTRACT_NUMBER.trim();
    }

    public String getTEL() {
        return TEL;
    }

    public void setTEL(String TEL) {
        this.TEL = TEL == null ? null : TEL.trim();
    }

    public String getCOMPANY() {
        return COMPANY;
    }

    public void setCOMPANY(String COMPANY) {
        this.COMPANY = COMPANY == null ? null : COMPANY.trim();
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE == null ? null : TITLE.trim();
    }

    public Integer getPERSONS() {
        return PERSONS;
    }

    public void setPERSONS(Integer PERSONS) {
        this.PERSONS = PERSONS;
    }

    public Integer getCOMING() {
        return COMING;
    }

    public void setCOMING(Integer COMING) {
        this.COMING = COMING;
    }

    public String getPARKING() {
        return PARKING;
    }

    public void setPARKING(String PARKING) {
        this.PARKING = PARKING == null ? null : PARKING.trim();
    }

    public String getCAR() {
        return CAR;
    }

    public void setCAR(String CAR) {
        this.CAR = CAR == null ? null : CAR.trim();
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }

    public Double getCHARGE() {
        return CHARGE;
    }

    public void setCHARGE(Double CHARGE) {
        this.CHARGE = CHARGE;
    }

    public Date getTIMEIN() {
        return TIMEIN;
    }

    public void setTIMEIN(Date TIMEIN) {
        this.TIMEIN = TIMEIN;
    }

    public Date getTIMEOUT() {
        return TIMEOUT;
    }

    public void setTIMEOUT(Date TIMEOUT) {
        this.TIMEOUT = TIMEOUT;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}