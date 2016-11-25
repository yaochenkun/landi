package org.ld.model;

import java.util.Date;

public class DailyService {
	private Integer ID;

	private Integer TYPE;

	private String ROOM_NUMBER;

	private String GUEST_NAME;

	private String ITEM;

	private Integer COUNT;

	private Double MONEY;

	private String COMMENT;

	private Date RTIME;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	public Integer getTYPE() {
		return TYPE;
	}

	public void setTYPE(Integer TYPE) {
		this.TYPE = TYPE;
	}

	public String getROOM_NUMBER() {
		return ROOM_NUMBER;
	}

	public void setROOM_NUMBER(String ROOM_NUMBER) {
		this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
	}

	public String getGUEST_NAME() {
		return GUEST_NAME;
	}

	public void setGUEST_NAME(String GUEST_NAME) {
		this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
	}

	public String getITEM() {
		return ITEM;
	}

	public void setITEM(String ITEM) {
		this.ITEM = ITEM == null ? null : ITEM.trim();
	}

	public Integer getCOUNT() {
		return COUNT;
	}

	public void setCOUNT(Integer COUNT) {
		this.COUNT = COUNT;
	}

	public Double getMONEY() {
		return MONEY;
	}

	public void setMONEY(Double MONEY) {
		this.MONEY = MONEY;
	}

	public String getCOMMENT() {
		return COMMENT;
	}

	public void setCOMMENT(String COMMENT) {
		this.COMMENT = COMMENT == null ? null : COMMENT.trim();
	}

	public Date getRTIME() {
		return RTIME;
	}

	public void setRTIME(Date RTIME) {
		this.RTIME = RTIME;
	}
}