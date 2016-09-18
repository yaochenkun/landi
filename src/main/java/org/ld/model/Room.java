package org.ld.model;

import java.util.Date;

public class Room {
    private Integer ID;

    private String ROOM_NUMBER;

    private Integer FLOOR;

    private String TYPE;

    private Double AREA;

    private Integer STATE_RENT;

    private Integer STATE_FAC;

    private Date FIRST_CLEAN;

    private String OTHERS;

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

    public Integer getFLOOR() {
        return FLOOR;
    }

    public void setFLOOR(Integer FLOOR) {
        this.FLOOR = FLOOR;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public Double getAREA() {
        return AREA;
    }

    public void setAREA(Double AREA) {
        this.AREA = AREA;
    }

    public Integer getSTATE_RENT() {
        return STATE_RENT;
    }

    public void setSTATE_RENT(Integer STATE_RENT) {
        this.STATE_RENT = STATE_RENT;
    }

    public Integer getSTATE_FAC() {
        return STATE_FAC;
    }

    public void setSTATE_FAC(Integer STATE_FAC) {
        this.STATE_FAC = STATE_FAC;
    }

    public Date getFIRST_CLEAN() {
        return FIRST_CLEAN;
    }

    public void setFIRST_CLEAN(Date FIRST_CLEAN) {
        this.FIRST_CLEAN = FIRST_CLEAN;
    }

    public String getOTHERS() {
        return OTHERS;
    }

    public void setOTHERS(String OTHERS) {
        this.OTHERS = OTHERS == null ? null : OTHERS.trim();
    }
}