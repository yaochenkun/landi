package org.ld.model;

public class Repository {
    private Integer ID;

    private String REPO_NUM;

    private String ADDRESS;

    private Double AREA;

    private Integer MANAGER_ID;

    private String MANAGER_NAME;

    private Byte STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getREPO_NUM() {
        return REPO_NUM;
    }

    public void setREPO_NUM(String REPO_NUM) {
        this.REPO_NUM = REPO_NUM == null ? null : REPO_NUM.trim();
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS == null ? null : ADDRESS.trim();
    }

    public Double getAREA() {
        return AREA;
    }

    public void setAREA(Double AREA) {
        this.AREA = AREA;
    }

    public Integer getMANAGER_ID() {
        return MANAGER_ID;
    }

    public void setMANAGER_ID(Integer MANAGER_ID) {
        this.MANAGER_ID = MANAGER_ID;
    }

    public String getMANAGER_NAME() {
        return MANAGER_NAME;
    }

    public void setMANAGER_NAME(String MANAGER_NAME) {
        this.MANAGER_NAME = MANAGER_NAME == null ? null : MANAGER_NAME.trim();
    }

    public Byte getSTATE() {
        return STATE;
    }

    public void setSTATE(Byte STATE) {
        this.STATE = STATE;
    }
}