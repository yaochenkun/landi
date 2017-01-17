package org.ld.model;

import java.util.Date;

public class GroceryRunning {
    private Integer ID;

    private Date CTIME;

    private Integer ITEM_ID;

    private Integer TOTAL;

    private Double PER_MONEY;

    private Double ALL_MONEY;

    private Integer TYPE;

    private Integer SYS_STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
    }

    public Integer getITEM_ID() {
        return ITEM_ID;
    }

    public void setITEM_ID(Integer ITEM_ID) {
        this.ITEM_ID = ITEM_ID;
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Double getPER_MONEY() {
        return PER_MONEY;
    }

    public void setPER_MONEY(Double PER_MONEY) {
        this.PER_MONEY = PER_MONEY;
    }

    public Double getALL_MONEY() {
        return ALL_MONEY;
    }

    public void setALL_MONEY(Double ALL_MONEY) {
        this.ALL_MONEY = ALL_MONEY;
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}