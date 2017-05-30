package org.ld.model;

public class FacSta {
    private Integer ID;

    private String TYPE;

    private String CAT;

    private String BRAND;

    private String NAME;

    private String OWNER;

    private Integer REPO_ID;

    private String REPO_NUM;

    private Integer TOTAL;

    private Integer FREE;

    private Integer WORKING;

    private Integer MAINTAIN;

    private Integer BAD;

    private String COMMENT;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
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

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Integer getFREE() {
        return FREE;
    }

    public void setFREE(Integer FREE) {
        this.FREE = FREE;
    }

    public Integer getWORKING() {
        return WORKING;
    }

    public void setWORKING(Integer WORKING) {
        this.WORKING = WORKING;
    }

    public Integer getMAINTAIN() {
        return MAINTAIN;
    }

    public void setMAINTAIN(Integer MAINTAIN) {
        this.MAINTAIN = MAINTAIN;
    }

    public Integer getBAD() {
        return BAD;
    }

    public void setBAD(Integer BAD) {
        this.BAD = BAD;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }
}