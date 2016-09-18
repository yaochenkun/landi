package org.ld.model;

import java.util.Date;

public class RoomMeter {
    private Integer ID;

    private Integer ROOM_ID;

    private Integer TYPE;

    private String METER_NUMBER;

    private Integer STATE;

    private Date LTIME;

    private Double LVAL;

    private Date CTIME;

    private Double CVAL;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getROOM_ID() {
        return ROOM_ID;
    }

    public void setROOM_ID(Integer ROOM_ID) {
        this.ROOM_ID = ROOM_ID;
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public String getMETER_NUMBER() {
        return METER_NUMBER;
    }

    public void setMETER_NUMBER(String METER_NUMBER) {
        this.METER_NUMBER = METER_NUMBER == null ? null : METER_NUMBER.trim();
    }

    public Integer getSTATE() {
        return STATE;
    }

    public void setSTATE(Integer STATE) {
        this.STATE = STATE;
    }

    public Date getLTIME() {
        return LTIME;
    }

    public void setLTIME(Date LTIME) {
        this.LTIME = LTIME;
    }

    public Double getLVAL() {
        return LVAL;
    }

    public void setLVAL(Double LVAL) {
        this.LVAL = LVAL;
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
    }

    public Double getCVAL() {
        return CVAL;
    }

    public void setCVAL(Double CVAL) {
        this.CVAL = CVAL;
    }
}