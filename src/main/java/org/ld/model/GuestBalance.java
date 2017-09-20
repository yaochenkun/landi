package org.ld.model;

import java.util.Date;

public class GuestBalance {
    private Integer ID;

    private Integer GUEST_ID;

    private String ROOM_NUMBER;

    private Integer CHARGE_TURN;

    private String CHARGE_WAY;

    private Integer RETURN_TURN;

    private Integer INVOICE_TURN;

    private Date BEGIN_DAY;

    private Date END_DAY;

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

    public Integer getCHARGE_TURN() {
        return CHARGE_TURN;
    }

    public void setCHARGE_TURN(Integer CHARGE_TURN) {
        this.CHARGE_TURN = CHARGE_TURN;
    }

    public String getCHARGE_WAY() {
        return CHARGE_WAY;
    }

    public void setCHARGE_WAY(String CHARGE_WAY) {
        this.CHARGE_WAY = CHARGE_WAY == null ? null : CHARGE_WAY.trim();
    }

    public Integer getRETURN_TURN() {
        return RETURN_TURN;
    }

    public void setRETURN_TURN(Integer RETURN_TURN) {
        this.RETURN_TURN = RETURN_TURN;
    }

    public Integer getINVOICE_TURN() {
        return INVOICE_TURN;
    }

    public void setINVOICE_TURN(Integer INVOICE_TURN) {
        this.INVOICE_TURN = INVOICE_TURN;
    }

    public Date getBEGIN_DAY() {
        return BEGIN_DAY;
    }

    public void setBEGIN_DAY(Date BEGIN_DAY) {
        this.BEGIN_DAY = BEGIN_DAY;
    }

    public Date getEND_DAY() {
        return END_DAY;
    }

    public void setEND_DAY(Date END_DAY) {
        this.END_DAY = END_DAY;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }
}