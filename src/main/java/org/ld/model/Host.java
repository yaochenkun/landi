package org.ld.model;

public class Host {
    private Integer ID;

    private Integer GUEST_ID;

    private String HOST_NAME;

    private Double RENT_CHARGE;

    private Double SERVICE_CHARGE;

    private Double RETURN_MONEY;

    private Double OTHER_CHARGE;

    private Integer SYS_STATE;

    private String HOST_TYPE;

    private String HOST_IDENTITY;

    private String HOST_ACCOUNT;

    private Double TAX_CHARGE;

    private Double TENET_CHARGE;

    private Double HEATING_CHARGE;

    private Double ACTUAL_CHARGE;

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

    public String getHOST_NAME() {
        return HOST_NAME;
    }

    public void setHOST_NAME(String HOST_NAME) {
        this.HOST_NAME = HOST_NAME == null ? null : HOST_NAME.trim();
    }

    public Double getRENT_CHARGE() {
        return RENT_CHARGE;
    }

    public void setRENT_CHARGE(Double RENT_CHARGE) {
        this.RENT_CHARGE = RENT_CHARGE;
    }

    public Double getSERVICE_CHARGE() {
        return SERVICE_CHARGE;
    }

    public void setSERVICE_CHARGE(Double SERVICE_CHARGE) {
        this.SERVICE_CHARGE = SERVICE_CHARGE;
    }

    public Double getRETURN_MONEY() {
        return RETURN_MONEY;
    }

    public void setRETURN_MONEY(Double RETURN_MONEY) {
        this.RETURN_MONEY = RETURN_MONEY;
    }

    public Double getOTHER_CHARGE() {
        return OTHER_CHARGE;
    }

    public void setOTHER_CHARGE(Double OTHER_CHARGE) {
        this.OTHER_CHARGE = OTHER_CHARGE;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }

    public String getHOST_TYPE() {
        return HOST_TYPE;
    }

    public void setHOST_TYPE(String HOST_TYPE) {
        this.HOST_TYPE = HOST_TYPE == null ? null : HOST_TYPE.trim();
    }

    public String getHOST_IDENTITY() {
        return HOST_IDENTITY;
    }

    public void setHOST_IDENTITY(String HOST_IDENTITY) {
        this.HOST_IDENTITY = HOST_IDENTITY == null ? null : HOST_IDENTITY.trim();
    }

    public String getHOST_ACCOUNT() {
        return HOST_ACCOUNT;
    }

    public void setHOST_ACCOUNT(String HOST_ACCOUNT) {
        this.HOST_ACCOUNT = HOST_ACCOUNT == null ? null : HOST_ACCOUNT.trim();
    }

    public Double getTAX_CHARGE() {
        return TAX_CHARGE;
    }

    public void setTAX_CHARGE(Double TAX_CHARGE) {
        this.TAX_CHARGE = TAX_CHARGE;
    }

    public Double getTENET_CHARGE() {
        return TENET_CHARGE;
    }

    public void setTENET_CHARGE(Double TENET_CHARGE) {
        this.TENET_CHARGE = TENET_CHARGE;
    }

    public Double getHEATING_CHARGE() {
        return HEATING_CHARGE;
    }

    public void setHEATING_CHARGE(Double HEATING_CHARGE) {
        this.HEATING_CHARGE = HEATING_CHARGE;
    }

    public Double getACTUAL_CHARGE() {
        return ACTUAL_CHARGE;
    }

    public void setACTUAL_CHARGE(Double ACTUAL_CHARGE) {
        this.ACTUAL_CHARGE = ACTUAL_CHARGE;
    }
}