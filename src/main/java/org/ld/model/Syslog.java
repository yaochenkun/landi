package org.ld.model;

import java.util.Date;

public class Syslog {
    private Integer ID;

    private Date TIME;

    private Integer TYPE;

    private Integer USERNAME;

    private String DETAIL;

    private String ITEM;

    private Integer TOTAL;

    private Double MONEY;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Integer getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(Integer USERNAME) {
        this.USERNAME = USERNAME;
    }

    public String getDETAIL() {
        return DETAIL;
    }

    public void setDETAIL(String DETAIL) {
        this.DETAIL = DETAIL == null ? null : DETAIL.trim();
    }

    public String getITEM() {
        return ITEM;
    }

    public void setITEM(String ITEM) {
        this.ITEM = ITEM == null ? null : ITEM.trim();
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Double getMONEY() {
        return MONEY;
    }

    public void setMONEY(Double MONEY) {
        this.MONEY = MONEY;
    }
}