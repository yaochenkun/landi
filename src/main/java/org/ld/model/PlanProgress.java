package org.ld.model;

import java.util.Date;

public class PlanProgress {
    private Integer ID;

    private Date TIME;

    private Integer PLAN_ID;

    private Integer FAC_ID;

    private String TERM;

    private Integer TOTAL;

    private String STAFF;

    private Double ALL_MONEY;

    private String COMMENT;

    private Integer SYS_STATE;

    private String TYPE;

    private String CAT;

    private String BRAND;

    private String NAME;

    private String OWNER;

    private Integer REPO_ID;

    private String REPO_NUM;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
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

    public String getTERM() {
        return TERM;
    }

    public void setTERM(String TERM) {
        this.TERM = TERM == null ? null : TERM.trim();
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public String getSTAFF() {
        return STAFF;
    }

    public void setSTAFF(String STAFF) {
        this.STAFF = STAFF == null ? null : STAFF.trim();
    }

    public Double getALL_MONEY() {
        return ALL_MONEY;
    }

    public void setALL_MONEY(Double ALL_MONEY) {
        this.ALL_MONEY = ALL_MONEY;
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

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public String getCAT() {
        return CAT;
    }

    public void setCAT(String CAT) {
        this.CAT = CAT == null ? null : CAT.trim();
    }

    public String getBRAND() {
        return BRAND;
    }

    public void setBRAND(String BRAND) {
        this.BRAND = BRAND == null ? null : BRAND.trim();
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getOWNER() {
        return OWNER;
    }

    public void setOWNER(String OWNER) {
        this.OWNER = OWNER == null ? null : OWNER.trim();
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
}