package org.ld.model;

import java.util.Date;

public class Sources {
    private Integer ID;

    private String ROOM_NUMBER;

    private String GUEST_NAME;

    private String TYPE;

    private String METER;

    private Double CUR_MONTH_VAL;

    private Double MONEY;

    private Date UPDATE_TIME;

    private Date READING_TIME;

    private Integer MONTH;

    private Integer SYS_STATE;

    private String LOG;

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

    public Date getUPDATE_TIME() {
        return UPDATE_TIME;
    }

    public void setUPDATE_TIME(Date UPDATE_TIME) {
        this.UPDATE_TIME = UPDATE_TIME;
    }

    public Date getREADING_TIME() {
        return READING_TIME;
    }

    public void setREADING_TIME(Date READING_TIME) {
        this.READING_TIME = READING_TIME;
    }

    public Integer getMONTH() {
        return MONTH;
    }

    public void setMONTH(Integer MONTH) {
        this.MONTH = MONTH;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }

    public String getLOG() {
        return LOG;
    }

    public void setLOG(String LOG) {
        this.LOG = LOG == null ? null : LOG.trim();
    }
}