package org.ld.model;

import java.util.Date;

public class MailReminder {
    private Integer ID;

    private Integer SENDER_ID;

    private String SENDER_NAME;

    private Integer RECEIVER_ID;

    private String RECEIVER_NAME;

    private String TITLE;

    private String CONTENT;

    private Date REMIND_DATE;

    private Date EDIT_TIME;

    private String STATE;

    private String RECEIVE_STATE;

    private String REPLY;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getSENDER_ID() {
        return SENDER_ID;
    }

    public void setSENDER_ID(Integer SENDER_ID) {
        this.SENDER_ID = SENDER_ID;
    }

    public String getSENDER_NAME() {
        return SENDER_NAME;
    }

    public void setSENDER_NAME(String SENDER_NAME) {
        this.SENDER_NAME = SENDER_NAME == null ? null : SENDER_NAME.trim();
    }

    public Integer getRECEIVER_ID() {
        return RECEIVER_ID;
    }

    public void setRECEIVER_ID(Integer RECEIVER_ID) {
        this.RECEIVER_ID = RECEIVER_ID;
    }

    public String getRECEIVER_NAME() {
        return RECEIVER_NAME;
    }

    public void setRECEIVER_NAME(String RECEIVER_NAME) {
        this.RECEIVER_NAME = RECEIVER_NAME == null ? null : RECEIVER_NAME.trim();
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

    public Date getEDIT_TIME() {
        return EDIT_TIME;
    }

    public void setEDIT_TIME(Date EDIT_TIME) {
        this.EDIT_TIME = EDIT_TIME;
    }

    public String getSTATE() {
        return STATE;
    }

    public void setSTATE(String STATE) {
        this.STATE = STATE == null ? null : STATE.trim();
    }

    public String getRECEIVE_STATE() {
        return RECEIVE_STATE;
    }

    public void setRECEIVE_STATE(String RECEIVE_STATE) {
        this.RECEIVE_STATE = RECEIVE_STATE == null ? null : RECEIVE_STATE.trim();
    }

    public String getREPLY() {
        return REPLY;
    }

    public void setREPLY(String REPLY) {
        this.REPLY = REPLY == null ? null : REPLY.trim();
    }
}