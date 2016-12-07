package org.ld.model;

public class RoomItem {
    private Integer ID;

    private Integer ROOM_ID;

    private Integer ITEM_ID;

    private String TYPE;

    private String TAG;

    private String COMM;

    private Integer STATE;
    
    private String ROOM_NUMBER;

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

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
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

	public String getROOM_NUMBER() {
		return ROOM_NUMBER;
	}

	public void setROOM_NUMBER(String rOOM_NUMBER) {
		ROOM_NUMBER = rOOM_NUMBER;
	}
}