package org.ld.model;

import java.util.Date;

public class Plan {
    private Integer ID;

    private String NAME;

    private Date CTIME;

    private Double MONEY;

    private String STAFF;

    private String COMMENT;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
    }

    public Double getMONEY() {
        return MONEY;
    }

    public void setMONEY(Double MONEY) {
        this.MONEY = MONEY;
    }

    public String getSTAFF() {
        return STAFF;
    }

    public void setSTAFF(String STAFF) {
        this.STAFF = STAFF == null ? null : STAFF.trim();
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }
}