package org.ld.model;

import java.util.Date;

public class RoomMeter {
    private Integer ID;

    private Integer ROOM_ID;

    private Integer TYPE;

    private String METER_NUMBER;

    private Double YEAR_INIT_VAL;

    private Double LAST_MONTH_VAL;

    private Double CUR_VAL;

    private Date CUR_TIME;

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

    public Double getYEAR_INIT_VAL() {
        return YEAR_INIT_VAL;
    }

    public void setYEAR_INIT_VAL(Double YEAR_INIT_VAL) {
        this.YEAR_INIT_VAL = YEAR_INIT_VAL;
    }

    public Double getLAST_MONTH_VAL() {
        return LAST_MONTH_VAL;
    }

    public void setLAST_MONTH_VAL(Double LAST_MONTH_VAL) {
        this.LAST_MONTH_VAL = LAST_MONTH_VAL;
    }

    public Double getCUR_VAL() {
        return CUR_VAL;
    }

    public void setCUR_VAL(Double CUR_VAL) {
        this.CUR_VAL = CUR_VAL;
    }

    public Date getCUR_TIME() {
        return CUR_TIME;
    }

    public void setCUR_TIME(Date CUR_TIME) {
        this.CUR_TIME = CUR_TIME;
    }
}