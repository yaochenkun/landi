package org.ld.model;

import java.util.Date;

public class SystemReminder {
    private Integer ID;

    private String TITLE;

    private String CONTENT;

    private Date REMIND_DATE;

    private String STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE == null ? null : TITLE.trim();
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT == null ? null : CONTENT.trim();
    }

    public Date getREMIND_DATE() {
        return REMIND_DATE;
    }

    public void setREMIND_DATE(Date REMIND_DATE) {
        this.REMIND_DATE = REMIND_DATE;
    }

    public String getSTATE() {
        return STATE;
    }

    public void setSTATE(String STATE) {
        this.STATE = STATE == null ? null : STATE.trim();
    }
}