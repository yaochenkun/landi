package org.ld.model;

import java.util.Date;

public class Invoice {
    private Integer ID;

    private String NUM;

    private Integer PLAN_ID;

    private Double MONEY;

    private Date CTIME;

    private Integer TERM;

    private String OTHERS;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getNUM() {
        return NUM;
    }

    public void setNUM(String NUM) {
        this.NUM = NUM == null ? null : NUM.trim();
    }

    public Integer getPLAN_ID() {
        return PLAN_ID;
    }

    public void setPLAN_ID(Integer PLAN_ID) {
        this.PLAN_ID = PLAN_ID;
    }

    public Double getMONEY() {
        return MONEY;
    }

    public void setMONEY(Double MONEY) {
        this.MONEY = MONEY;
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
    }

    public Integer getTERM() {
        return TERM;
    }

    public void setTERM(Integer TERM) {
        this.TERM = TERM;
    }

    public String getOTHERS() {
        return OTHERS;
    }

    public void setOTHERS(String OTHERS) {
        this.OTHERS = OTHERS == null ? null : OTHERS.trim();
    }
}