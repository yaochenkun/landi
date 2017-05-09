package org.ld.model;

import java.util.Date;

public class ShoesPolishing {
    private Integer ID;

    private String ROOM_NUM;

    private Integer GUEST_ID;

    private String GUEST_NAME;

    private Integer COUNT;

    private Double TOTAL_PRICE;

    private Byte PAY_MODE;

    private Date OCCUR_TIME;

    private String COMMENT;

    private Integer STAFF_ID;

    private String STAFF_NAME;

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

    public Integer getGUEST_ID() {
        return GUEST_ID;
    }

    public void setGUEST_ID(Integer GUEST_ID) {
        this.GUEST_ID = GUEST_ID;
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public Integer getCOUNT() {
        return COUNT;
    }

    public void setCOUNT(Integer COUNT) {
        this.COUNT = COUNT;
    }

    public Double getTOTAL_PRICE() {
        return TOTAL_PRICE;
    }

    public void setTOTAL_PRICE(Double TOTAL_PRICE) {
        this.TOTAL_PRICE = TOTAL_PRICE;
    }

    public Byte getPAY_MODE() {
        return PAY_MODE;
    }

    public void setPAY_MODE(Byte PAY_MODE) {
        this.PAY_MODE = PAY_MODE;
    }

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }

    public Integer getSTAFF_ID() {
        return STAFF_ID;
    }

    public void setSTAFF_ID(Integer STAFF_ID) {
        this.STAFF_ID = STAFF_ID;
    }

    public String getSTAFF_NAME() {
        return STAFF_NAME;
    }

    public void setSTAFF_NAME(String STAFF_NAME) {
        this.STAFF_NAME = STAFF_NAME == null ? null : STAFF_NAME.trim();
    }
}