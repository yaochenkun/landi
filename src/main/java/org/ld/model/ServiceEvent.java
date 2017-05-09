package org.ld.model;

import java.util.Date;

public class ServiceEvent {
    private Integer ID;

    private Byte SERVICE_TYPE;

    private Integer SERVICE_ID;

    private Date OCCUR_TIME;

    private Date IMPORT_TIME;

    private Date EDIT_TIME;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Byte getSERVICE_TYPE() {
        return SERVICE_TYPE;
    }

    public void setSERVICE_TYPE(Byte SERVICE_TYPE) {
        this.SERVICE_TYPE = SERVICE_TYPE;
    }

    public Integer getSERVICE_ID() {
        return SERVICE_ID;
    }

    public void setSERVICE_ID(Integer SERVICE_ID) {
        this.SERVICE_ID = SERVICE_ID;
    }

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public Date getIMPORT_TIME() {
        return IMPORT_TIME;
    }

    public void setIMPORT_TIME(Date IMPORT_TIME) {
        this.IMPORT_TIME = IMPORT_TIME;
    }

    public Date getEDIT_TIME() {
        return EDIT_TIME;
    }

    public void setEDIT_TIME(Date EDIT_TIME) {
        this.EDIT_TIME = EDIT_TIME;
    }
}