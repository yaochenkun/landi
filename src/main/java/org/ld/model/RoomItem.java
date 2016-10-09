package org.ld.model;

public class RoomItem {
    private Integer ID;

    private Integer ROOM_ID;

    private Integer ITEM_ID;

    private Integer TYPE;

    private Integer CAT;

    private String COMPANY;

    private String NAME;

    private String TAG;

    private String COMM;

    private Integer STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getROOM_ID() {
        return ROOM_ID;
    }

    public void setROOM_ID(Integer ROOM_ID) {
        this.ROOM_ID = ROOM_ID;
    }

    public Integer getITEM_ID() {
        return ITEM_ID;
    }

    public void setITEM_ID(Integer ITEM_ID) {
        this.ITEM_ID = ITEM_ID;
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

    public String getCOMPANY() {
        return COMPANY;
    }

    public void setCOMPANY(String COMPANY) {
        this.COMPANY = COMPANY == null ? null : COMPANY.trim();
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getTAG() {
        return TAG;
    }

    public void setTAG(String TAG) {
        this.TAG = TAG == null ? null : TAG.trim();
    }

    public String getCOMM() {
        return COMM;
    }

    public void setCOMM(String COMM) {
        this.COMM = COMM == null ? null : COMM.trim();
    }

    public Integer getSTATE() {
        return STATE;
    }

    public void setSTATE(Integer STATE) {
        this.STATE = STATE;
    }
}