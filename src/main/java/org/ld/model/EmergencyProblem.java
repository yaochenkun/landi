package org.ld.model;

import java.util.Date;

public class EmergencyProblem {
    private Integer ID;

    private String ROOM_NUM;

    private String ROOM_STATE;

    private String GUEST_NAME;

    private Date OCCUR_TIME;

    private Date ATTENDANCE_TIME;

    private String DECLARANT;

    private String DEALING;

    private String DAMAGE_DETAIL;

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

    public String getROOM_STATE() {
        return ROOM_STATE;
    }

    public void setROOM_STATE(String ROOM_STATE) {
        this.ROOM_STATE = ROOM_STATE == null ? null : ROOM_STATE.trim();
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public Date getATTENDANCE_TIME() {
        return ATTENDANCE_TIME;
    }

    public void setATTENDANCE_TIME(Date ATTENDANCE_TIME) {
        this.ATTENDANCE_TIME = ATTENDANCE_TIME;
    }

    public String getDECLARANT() {
        return DECLARANT;
    }

    public void setDECLARANT(String DECLARANT) {
        this.DECLARANT = DECLARANT == null ? null : DECLARANT.trim();
    }

    public String getDEALING() {
        return DEALING;
    }

    public void setDEALING(String DEALING) {
        this.DEALING = DEALING == null ? null : DEALING.trim();
    }

    public String getDAMAGE_DETAIL() {
        return DAMAGE_DETAIL;
    }

    public void setDAMAGE_DETAIL(String DAMAGE_DETAIL) {
        this.DAMAGE_DETAIL = DAMAGE_DETAIL == null ? null : DAMAGE_DETAIL.trim();
    }
}