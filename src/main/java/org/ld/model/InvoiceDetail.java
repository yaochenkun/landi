package org.ld.model;

public class InvoiceDetail {
    private Integer ID;

    private Integer INV_ID;

    private String ITEM;

    private Integer TOTAL;

    private Double ALL_MONEY;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getINV_ID() {
        return INV_ID;
    }

    public void setINV_ID(Integer INV_ID) {
        this.INV_ID = INV_ID;
    }

    public String getITEM() {
        return ITEM;
    }

    public void setITEM(String ITEM) {
        this.ITEM = ITEM == null ? null : ITEM.trim();
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Double getALL_MONEY() {
        return ALL_MONEY;
    }

    public void setALL_MONEY(Double ALL_MONEY) {
        this.ALL_MONEY = ALL_MONEY;
    }
}