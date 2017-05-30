package org.ld.model;

import java.util.Date;

public class PlanDetail {
    private Integer ID;

    private Integer PLAN_ID;

    private Integer FAC_ID;

    private Integer REPO_ID;

    private String REPO_NUM;

    private Integer TOTAL;

    private Integer ALREADY;

    private Double UNITPRICE;

    private Double ALL_MONEY;

    private String PROVIDER;

    private String INVOICE_TYPE;

    private String RECEIVED;

    private Date ORDER_DATE;

    private Date ARRIVAL_DATE;

    private String COMMENT;

    private Integer SYS_STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getPLAN_ID() {
        return PLAN_ID;
    }

    public void setPLAN_ID(Integer PLAN_ID) {
        this.PLAN_ID = PLAN_ID;
    }

    public Integer getFAC_ID() {
        return FAC_ID;
    }

    public void setFAC_ID(Integer FAC_ID) {
        this.FAC_ID = FAC_ID;
    }

    public Integer getREPO_ID() {
        return REPO_ID;
    }

    public void setREPO_ID(Integer REPO_ID) {
        this.REPO_ID = REPO_ID;
    }

    public String getREPO_NUM() {
        return REPO_NUM;
    }

    public void setREPO_NUM(String REPO_NUM) {
        this.REPO_NUM = REPO_NUM == null ? null : REPO_NUM.trim();
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Integer getALREADY() {
        return ALREADY;
    }

    public void setALREADY(Integer ALREADY) {
        this.ALREADY = ALREADY;
    }

    public Double getUNITPRICE() {
        return UNITPRICE;
    }

    public void setUNITPRICE(Double UNITPRICE) {
        this.UNITPRICE = UNITPRICE;
    }

    public Double getALL_MONEY() {
        return ALL_MONEY;
    }

    public void setALL_MONEY(Double ALL_MONEY) {
        this.ALL_MONEY = ALL_MONEY;
    }

    public String getPROVIDER() {
        return PROVIDER;
    }

    public void setPROVIDER(String PROVIDER) {
        this.PROVIDER = PROVIDER == null ? null : PROVIDER.trim();
    }

    public String getINVOICE_TYPE() {
        return INVOICE_TYPE;
    }

    public void setINVOICE_TYPE(String INVOICE_TYPE) {
        this.INVOICE_TYPE = INVOICE_TYPE == null ? null : INVOICE_TYPE.trim();
    }

    public String getRECEIVED() {
        return RECEIVED;
    }

    public void setRECEIVED(String RECEIVED) {
        this.RECEIVED = RECEIVED == null ? null : RECEIVED.trim();
    }

    public Date getORDER_DATE() {
        return ORDER_DATE;
    }

    public void setORDER_DATE(Date ORDER_DATE) {
        this.ORDER_DATE = ORDER_DATE;
    }

    public Date getARRIVAL_DATE() {
        return ARRIVAL_DATE;
    }

    public void setARRIVAL_DATE(Date ARRIVAL_DATE) {
        this.ARRIVAL_DATE = ARRIVAL_DATE;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}