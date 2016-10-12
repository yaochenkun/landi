package org.ld.model;

import java.util.Date;

public class RoomPic {
    private Integer ID;

    private Integer ROOM_ID;

    private Integer TYPE;

    private Date CTIME;

    private String NAME;

    private String TAG;

    private String PATH;

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

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
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

    public String getPATH() {
        return PATH;
    }

    public void setPATH(String PATH) {
        this.PATH = PATH == null ? null : PATH.trim();
    }
}