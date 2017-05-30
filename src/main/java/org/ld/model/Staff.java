package org.ld.model;

import java.util.Date;

public class Staff {
    private Integer ID;

    private String NAME;

    private String DUTY;

    private String DEPART;

    private Date JOIN_DATE;

    private Byte STATE;

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

    public String getDUTY() {
        return DUTY;
    }

    public void setDUTY(String DUTY) {
        this.DUTY = DUTY == null ? null : DUTY.trim();
    }

    public String getDEPART() {
        return DEPART;
    }

    public void setDEPART(String DEPART) {
        this.DEPART = DEPART == null ? null : DEPART.trim();
    }

    public Date getJOIN_DATE() {
        return JOIN_DATE;
    }

    public void setJOIN_DATE(Date JOIN_DATE) {
        this.JOIN_DATE = JOIN_DATE;
    }

    public Byte getSTATE() {
        return STATE;
    }

    public void setSTATE(Byte STATE) {
        this.STATE = STATE;
    }
}