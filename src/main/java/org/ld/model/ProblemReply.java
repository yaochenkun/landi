package org.ld.model;

import java.util.Date;

public class ProblemReply {
    private Integer ID;

    private Integer PROBLEM_ID;

    private Date LAST_REPLAY_DATE;

    private String LAST_REPLAY_DESCRIPTION;

    private String DEPARTMENT;

    private Double FARE;

    private String PROBLEM_STATE;

    private String FARE_DETAIL;

    private String FARE_PAY;

    private String INFO_SOURCE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getPROBLEM_ID() {
        return PROBLEM_ID;
    }

    public void setPROBLEM_ID(Integer PROBLEM_ID) {
        this.PROBLEM_ID = PROBLEM_ID;
    }

    public Date getLAST_REPLAY_DATE() {
        return LAST_REPLAY_DATE;
    }

    public void setLAST_REPLAY_DATE(Date LAST_REPLAY_DATE) {
        this.LAST_REPLAY_DATE = LAST_REPLAY_DATE;
    }

    public String getLAST_REPLAY_DESCRIPTION() {
        return LAST_REPLAY_DESCRIPTION;
    }

    public void setLAST_REPLAY_DESCRIPTION(String LAST_REPLAY_DESCRIPTION) {
        this.LAST_REPLAY_DESCRIPTION = LAST_REPLAY_DESCRIPTION == null ? null : LAST_REPLAY_DESCRIPTION.trim();
    }

    public String getDEPARTMENT() {
        return DEPARTMENT;
    }

    public void setDEPARTMENT(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT == null ? null : DEPARTMENT.trim();
    }

    public Double getFARE() {
        return FARE;
    }

    public void setFARE(Double FARE) {
        this.FARE = FARE;
    }

    public String getPROBLEM_STATE() {
        return PROBLEM_STATE;
    }

    public void setPROBLEM_STATE(String PROBLEM_STATE) {
        this.PROBLEM_STATE = PROBLEM_STATE == null ? null : PROBLEM_STATE.trim();
    }

    public String getFARE_DETAIL() {
        return FARE_DETAIL;
    }

    public void setFARE_DETAIL(String FARE_DETAIL) {
        this.FARE_DETAIL = FARE_DETAIL == null ? null : FARE_DETAIL.trim();
    }

    public String getFARE_PAY() {
        return FARE_PAY;
    }

    public void setFARE_PAY(String FARE_PAY) {
        this.FARE_PAY = FARE_PAY == null ? null : FARE_PAY.trim();
    }

    public String getINFO_SOURCE() {
        return INFO_SOURCE;
    }

    public void setINFO_SOURCE(String INFO_SOURCE) {
        this.INFO_SOURCE = INFO_SOURCE == null ? null : INFO_SOURCE.trim();
    }
}