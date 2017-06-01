package org.ld.model;

import java.util.Date;

public class RoomItem {
    private Integer ID;

    private String ROOM_NUM;

    private Integer FAC_ID;

    private String TAG;

    private String ALLOCATE_TYPE;

    private String STATE;

    private Date BORROW_DATE;

    private Date RETURN_DATE;

    private Integer MAINTAIN_DURATION;

    private String COMM;

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

    public Integer getFAC_ID() {
        return FAC_ID;
    }

    public void setFAC_ID(Integer FAC_ID) {
        this.FAC_ID = FAC_ID;
    }

    public String getTAG() {
        return TAG;
    }

    public void setTAG(String TAG) {
        this.TAG = TAG == null ? null : TAG.trim();
    }

    public String getALLOCATE_TYPE() {
        return ALLOCATE_TYPE;
    }

    public void setALLOCATE_TYPE(String ALLOCATE_TYPE) {
        this.ALLOCATE_TYPE = ALLOCATE_TYPE == null ? null : ALLOCATE_TYPE.trim();
    }

    public String getSTATE() {
        return STATE;
    }

    public void setSTATE(String STATE) {
        this.STATE = STATE == null ? null : STATE.trim();
    }

    public Date getBORROW_DATE() {
        return BORROW_DATE;
    }

    public void setBORROW_DATE(Date BORROW_DATE) {
        this.BORROW_DATE = BORROW_DATE;
    }

    public Date getRETURN_DATE() {
        return RETURN_DATE;
    }

    public void setRETURN_DATE(Date RETURN_DATE) {
        this.RETURN_DATE = RETURN_DATE;
    }

    public Integer getMAINTAIN_DURATION() {
        return MAINTAIN_DURATION;
    }

    public void setMAINTAIN_DURATION(Integer MAINTAIN_DURATION) {
        this.MAINTAIN_DURATION = MAINTAIN_DURATION;
    }

    public String getCOMM() {
        return COMM;
    }

    public void setCOMM(String COMM) {
        this.COMM = COMM == null ? null : COMM.trim();
    }
}