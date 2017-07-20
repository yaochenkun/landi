package org.ld.model;

import java.util.Date;

public class CostLe {
    private Integer ID;

    private String ROOM_NUM;

    private String GUEST_NAME;

    private String PROJECT;

    private String CUSTOMER_SERVICE_STAFF;

    private String OPERATION_STAFF;

    private String REASON;

    private Date OCCUR_TIME;

    private Double COST;

    private String TYPE;

    private Integer STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getROOM_NUM() {
        return ROOM_NUM;
    }

    public void setROOM_NUM(String ROOM_NUM) {
        this.ROOM_NUM = ROOM_NUM == null ? null : ROOM_NUM.trim();
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public String getPROJECT() {
        return PROJECT;
    }

    public void setPROJECT(String PROJECT) {
        this.PROJECT = PROJECT == null ? null : PROJECT.trim();
    }

    public String getCUSTOMER_SERVICE_STAFF() {
        return CUSTOMER_SERVICE_STAFF;
    }

    public void setCUSTOMER_SERVICE_STAFF(String CUSTOMER_SERVICE_STAFF) {
        this.CUSTOMER_SERVICE_STAFF = CUSTOMER_SERVICE_STAFF == null ? null : CUSTOMER_SERVICE_STAFF.trim();
    }

    public String getOPERATION_STAFF() {
        return OPERATION_STAFF;
    }

    public void setOPERATION_STAFF(String OPERATION_STAFF) {
        this.OPERATION_STAFF = OPERATION_STAFF == null ? null : OPERATION_STAFF.trim();
    }

    public String getREASON() {
        return REASON;
    }

    public void setREASON(String REASON) {
        this.REASON = REASON == null ? null : REASON.trim();
    }

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public Double getCOST() {
        return COST;
    }

    public void setCOST(Double COST) {
        this.COST = COST;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public Integer getSTATE() {
        return STATE;
    }

    public void setSTATE(Integer STATE) {
        this.STATE = STATE;
    }
}