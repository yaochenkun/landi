package org.ld.model;

public class Room {
    private Integer ID;

    private String ROOM_NUMBER;

    private String TYPE;

    private Double AREA;

    private Integer RENT;

    private Integer STATE;

    private String COMM;

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

    public Integer getRENT() {
        return RENT;
    }

    public void setRENT(Integer RENT) {
        this.RENT = RENT;
    }

    public Integer getSTATE() {
        return STATE;
    }

    public void setSTATE(Integer STATE) {
        this.STATE = STATE;
    }

    public String getCOMM() {
        return COMM;
    }

    public void setCOMM(String COMM) {
        this.COMM = COMM == null ? null : COMM.trim();
    }
}