package org.ld.model;

import java.util.Date;

public class Sources {
	private Integer ID;

	private String ROOM_NUMBER;

    private Integer GUEST_ID;

    private String GUEST_NAME;

	private Date TIME;

	private Integer TYPE;

	private String METER;

	private Double LAST_DATA;

	private Double CURRENT_DATA;

	private Double COUNT;

	private Double MONEY;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	public String getROOM_NUMBER() {
		return ROOM_NUMBER;
	}

    public void setROOM_NUMBER(String ROOM_NUMBER) {
        this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
    }

    public Integer getGUEST_ID() {
        return GUEST_ID;
    }

    public void setGUEST_ID(Integer GUEST_ID) {
        this.GUEST_ID = GUEST_ID;
    }

	public String getGUEST_NAME() {
		return GUEST_NAME;
	}

	public void setGUEST_NAME(String GUEST_NAME) {
		this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
	}

	public Date getTIME() {
		return TIME;
	}

	public void setTIME(Date TIME) {
		this.TIME = TIME;
	}

	public Integer getTYPE() {
		return TYPE;
	}

	public void setTYPE(Integer TYPE) {
		this.TYPE = TYPE;
	}

	public String getMETER() {
		return METER;
	}

	public void setMETER(String METER) {
		this.METER = METER == null ? null : METER.trim();
	}

	public Double getLAST_DATA() {
		return LAST_DATA;
	}

	public void setLAST_DATA(Double LAST_DATA) {
		this.LAST_DATA = LAST_DATA;
	}

	public Double getCURRENT_DATA() {
		return CURRENT_DATA;
	}

	public void setCURRENT_DATA(Double CURRENT_DATA) {
		this.CURRENT_DATA = CURRENT_DATA;
	}

	public Double getCOUNT() {
		return COUNT;
	}

	public void setCOUNT(Double COUNT) {
		this.COUNT = COUNT;
	}

	public Double getMONEY() {
		return MONEY;
	}

	public void setMONEY(Double MONEY) {
		this.MONEY = MONEY;
	}
}