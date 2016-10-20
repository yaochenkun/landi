package org.ld.model;

public class FacSta {
    private Integer ID;

    private String FAC_NUMBER;

    private String COMMENT;

    private String NAME;

    private String COMPANY;

    private Integer TYPE;

    private Integer CAT;

    private Integer TOTAL;

    private Integer BAD;

    private Integer FREE;

    private Integer WORKING;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getFAC_NUMBER() {
        return FAC_NUMBER;
    }

    public void setFAC_NUMBER(String FAC_NUMBER) {
        this.FAC_NUMBER = FAC_NUMBER == null ? null : FAC_NUMBER.trim();
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getCOMPANY() {
        return COMPANY;
    }

    public void setCOMPANY(String COMPANY) {
        this.COMPANY = COMPANY == null ? null : COMPANY.trim();
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Integer getCAT() {
        return CAT;
    }

    public void setCAT(Integer CAT) {
        this.CAT = CAT;
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Integer getBAD() {
        return BAD;
    }

    public void setBAD(Integer BAD) {
        this.BAD = BAD;
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
}