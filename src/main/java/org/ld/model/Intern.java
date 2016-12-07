package org.ld.model;

public class Intern {
    private Integer ID;

    private Integer GUEST_ID;

    private Double LE_1;

    private Double LE_2;

    private Double LE_3;

    private Double LE_SERVICE;

    private Double IN_1;

    private Double IN_2;

    private Double IN_3;

    private Double IN_SERVICE;

    private Integer SYS_STATE;

    private String IN_NAME;

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

    public Double getLE_1() {
        return LE_1;
    }

    public void setLE_1(Double LE_1) {
        this.LE_1 = LE_1;
    }

    public Double getLE_2() {
        return LE_2;
    }

    public void setLE_2(Double LE_2) {
        this.LE_2 = LE_2;
    }

    public Double getLE_3() {
        return LE_3;
    }

    public void setLE_3(Double LE_3) {
        this.LE_3 = LE_3;
    }

    public Double getLE_SERVICE() {
        return LE_SERVICE;
    }

    public void setLE_SERVICE(Double LE_SERVICE) {
        this.LE_SERVICE = LE_SERVICE;
    }

    public Double getIN_1() {
        return IN_1;
    }

    public void setIN_1(Double IN_1) {
        this.IN_1 = IN_1;
    }

    public Double getIN_2() {
        return IN_2;
    }

    public void setIN_2(Double IN_2) {
        this.IN_2 = IN_2;
    }

    public Double getIN_3() {
        return IN_3;
    }

    public void setIN_3(Double IN_3) {
        this.IN_3 = IN_3;
    }

    public Double getIN_SERVICE() {
        return IN_SERVICE;
    }

    public void setIN_SERVICE(Double IN_SERVICE) {
        this.IN_SERVICE = IN_SERVICE;
    }

    public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }

    public String getIN_NAME() {
        return IN_NAME;
    }

    public void setIN_NAME(String IN_NAME) {
        this.IN_NAME = IN_NAME == null ? null : IN_NAME.trim();
    }
}