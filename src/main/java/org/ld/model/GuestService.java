package org.ld.model;

public class GuestService {
    private Integer ID;

    private Integer GUEST_ID;

    private String ROOM_NUMBER;

    private String NAME;

    private Integer TYPE;

    private Integer PROVIDER;

    private Integer TURN;

    private String COMMENT;

    private String TAG;

    private Integer FREE;

    private Integer SYS_STATE;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getGUEST_ID() {
        return GUEST_ID;
    }

    public void setGUEST_ID(Integer GUEST_ID) {
        this.GUEST_ID = GUEST_ID;
    }

    public String getROOM_NUMBER() {
        return ROOM_NUMBER;
    }

    public void setROOM_NUMBER(String ROOM_NUMBER) {
        this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Integer getPROVIDER() {
        return PROVIDER;
    }

    public void setPROVIDER(Integer PROVIDER) {
        this.PROVIDER = PROVIDER;
    }

    public Integer getTURN() {
        return TURN;
    }

    public void setTURN(Integer TURN) {
        this.TURN = TURN;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT == null ? null : COMMENT.trim();
    }

    public String getTAG() {
        return TAG;
    }

    public void setTAG(String TAG) {
        this.TAG = TAG == null ? null : TAG.trim();
    }

    public Integer getFREE() {
        return FREE;
    }

    public void setFREE(Integer FREE) {
        this.FREE = FREE;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}