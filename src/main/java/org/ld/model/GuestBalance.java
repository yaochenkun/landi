package org.ld.model;

import java.util.Date;

public class GuestBalance {
    private Integer ID;

    private Integer GUEST_ID;

    private String ROOM_NUMBER;

    private Date CHARGE_DAY;

    private Integer CHARGE_TURN;

    private String CHARGE_WAY;

    private Date RETURN_DAY;

    private Integer RETURN_TURN;

    private Date INVOICE_DAY;

    private Integer INVOICE_TURN;

    private Integer INVOICE_AHEAD;

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

    public Date getCHARGE_DAY() {
        return CHARGE_DAY;
    }

    public void setCHARGE_DAY(Date CHARGE_DAY) {
        this.CHARGE_DAY = CHARGE_DAY;
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

    public Date getRETURN_DAY() {
        return RETURN_DAY;
    }

    public void setRETURN_DAY(Date RETURN_DAY) {
        this.RETURN_DAY = RETURN_DAY;
    }

    public Integer getRETURN_TURN() {
        return RETURN_TURN;
    }

    public void setRETURN_TURN(Integer RETURN_TURN) {
        this.RETURN_TURN = RETURN_TURN;
    }

    public Date getINVOICE_DAY() {
        return INVOICE_DAY;
    }

    public void setINVOICE_DAY(Date INVOICE_DAY) {
        this.INVOICE_DAY = INVOICE_DAY;
    }

    public Integer getINVOICE_TURN() {
        return INVOICE_TURN;
    }

    public void setINVOICE_TURN(Integer INVOICE_TURN) {
        this.INVOICE_TURN = INVOICE_TURN;
    }

    public Integer getINVOICE_AHEAD() {
        return INVOICE_AHEAD;
    }

    public void setINVOICE_AHEAD(Integer INVOICE_AHEAD) {
        this.INVOICE_AHEAD = INVOICE_AHEAD;
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