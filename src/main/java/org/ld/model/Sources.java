package org.ld.model;

import java.util.Date;

public class Sources {
    private Integer ID;

    private String ROOM_NUMBER;

    private String GUEST_NAME;

    private Date CUR_TIME;

    private String TYPE;

    private String METER;

    private Double YEAR_INIT_VAL;

    private Double LAST_MONTH_VAL;

    private Double CUR_MONTH_VAL;

    private Double MONEY;

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

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public Date getCUR_TIME() {
        return CUR_TIME;
    }

    public void setCUR_TIME(Date CUR_TIME) {
        this.CUR_TIME = CUR_TIME;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public String getMETER() {
        return METER;
    }

    public void setMETER(String METER) {
        this.METER = METER == null ? null : METER.trim();
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

    public Double getCUR_MONTH_VAL() {
        return CUR_MONTH_VAL;
    }

    public void setCUR_MONTH_VAL(Double CUR_MONTH_VAL) {
        this.CUR_MONTH_VAL = CUR_MONTH_VAL;
    }

    public Double getMONEY() {
        return MONEY;
    }

    public void setMONEY(Double MONEY) {
        this.MONEY = MONEY;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}