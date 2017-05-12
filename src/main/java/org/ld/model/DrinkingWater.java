package org.ld.model;

import java.util.Date;

public class DrinkingWater {
    private Integer ID;

    private String ROOM_NUM;

    private Integer GUEST_ID;

    private String GUEST_NAME;

    private Integer BARREL_COUNT;

    private Integer BARREL_LIMITCOUNT;

    private Integer BOTTLE_COUNT;

    private Integer BOTTLE_LIMITCOUNT;

    private Double BOTTLE_UNITPRICE;

    private Double EXCESS_PRICE;

    private Byte PAY_MODE;

    private String COMMENT;

    private Integer STAFF_ID;

    private String STAFF_NAME;

    private Date OCCUR_TIME;

    private Date IMPORT_TIME;

    private Date EDIT_TIME;

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

    public Integer getBARREL_COUNT() {
        return BARREL_COUNT;
    }

    public void setBARREL_COUNT(Integer BARREL_COUNT) {
        this.BARREL_COUNT = BARREL_COUNT;
    }

    public Integer getBARREL_LIMITCOUNT() {
        return BARREL_LIMITCOUNT;
    }

    public void setBARREL_LIMITCOUNT(Integer BARREL_LIMITCOUNT) {
        this.BARREL_LIMITCOUNT = BARREL_LIMITCOUNT;
    }

    public Integer getBOTTLE_COUNT() {
        return BOTTLE_COUNT;
    }

    public void setBOTTLE_COUNT(Integer BOTTLE_COUNT) {
        this.BOTTLE_COUNT = BOTTLE_COUNT;
    }

    public Integer getBOTTLE_LIMITCOUNT() {
        return BOTTLE_LIMITCOUNT;
    }

    public void setBOTTLE_LIMITCOUNT(Integer BOTTLE_LIMITCOUNT) {
        this.BOTTLE_LIMITCOUNT = BOTTLE_LIMITCOUNT;
    }

    public Double getBOTTLE_UNITPRICE() {
        return BOTTLE_UNITPRICE;
    }

    public void setBOTTLE_UNITPRICE(Double BOTTLE_UNITPRICE) {
        this.BOTTLE_UNITPRICE = BOTTLE_UNITPRICE;
    }

    public Double getEXCESS_PRICE() {
        return EXCESS_PRICE;
    }

    public void setEXCESS_PRICE(Double EXCESS_PRICE) {
        this.EXCESS_PRICE = EXCESS_PRICE;
    }

    public Byte getPAY_MODE() {
        return PAY_MODE;
    }

    public void setPAY_MODE(Byte PAY_MODE) {
        this.PAY_MODE = PAY_MODE;
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

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public Date getIMPORT_TIME() {
        return IMPORT_TIME;
    }

    public void setIMPORT_TIME(Date IMPORT_TIME) {
        this.IMPORT_TIME = IMPORT_TIME;
    }

    public Date getEDIT_TIME() {
        return EDIT_TIME;
    }

    public void setEDIT_TIME(Date EDIT_TIME) {
        this.EDIT_TIME = EDIT_TIME;
    }
}