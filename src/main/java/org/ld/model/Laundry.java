package org.ld.model;

import java.util.Date;

public class Laundry {
    private Integer ID;

    private Date DATE;

    private String ROOM_NUM;

    private Integer GUEST_ID;

    private String GUEST_NAME;

    private String CLOTHES;

    private String OTHER;

    private Integer COUNT;

    private Integer TOTAL_PRICE;

    private Date OCCUR_TIME;

    private Date IMPORT_TIME;

    private Date EDIT_TIME;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Date getDATE() {
        return DATE;
    }

    public void setDATE(Date DATE) {
        this.DATE = DATE;
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

    public String getCLOTHES() {
        return CLOTHES;
    }

    public void setCLOTHES(String CLOTHES) {
        this.CLOTHES = CLOTHES == null ? null : CLOTHES.trim();
    }

    public String getOTHER() {
        return OTHER;
    }

    public void setOTHER(String OTHER) {
        this.OTHER = OTHER == null ? null : OTHER.trim();
    }

    public Integer getCOUNT() {
        return COUNT;
    }

    public void setCOUNT(Integer COUNT) {
        this.COUNT = COUNT;
    }

    public Integer getTOTAL_PRICE() {
        return TOTAL_PRICE;
    }

    public void setTOTAL_PRICE(Integer TOTAL_PRICE) {
        this.TOTAL_PRICE = TOTAL_PRICE;
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