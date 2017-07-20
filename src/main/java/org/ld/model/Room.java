package org.ld.model;

import java.util.Date;

public class Room {
	private Integer ID;

	private String ROOM_NUMBER;

	private String TYPE;

	private Double AREA;

	private Integer RENT;

	private Integer STATE;

	private String COMM;

	private String OWNER_NAME;

	private Date RECEIPT_TIME;

	private Date REFUND_TIME;

	private String REPLACE_ROOM;

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

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String TYPE) {
		this.TYPE = TYPE == null ? null : TYPE.trim();
	}

	public Double getAREA() {
		return AREA;
	}

	public void setAREA(Double AREA) {
		this.AREA = AREA;
	}

	public Integer getRENT() {
		return RENT;
	}

	public void setRENT(Integer RENT) {
		this.RENT = RENT;
	}

	public Integer getSTATE() {
		return STATE;
	}

	public void setSTATE(Integer STATE) {
		this.STATE = STATE;
	}

	public String getCOMM() {
		return COMM;
	}

	public void setCOMM(String COMM) {
		this.COMM = COMM == null ? null : COMM.trim();
	}

	public String getOWNER_NAME() {
		return OWNER_NAME;
	}

	public void setOWNER_NAME(String OWNER_NAME) {
		this.OWNER_NAME = OWNER_NAME == null ? null : OWNER_NAME.trim();
	}

	public Date getRECEIPT_TIME() {
		return RECEIPT_TIME;
	}

	public void setRECEIPT_TIME(Date RECEIPT_TIME) {
		this.RECEIPT_TIME = RECEIPT_TIME;
	}

	public Date getREFUND_TIME() {
		return REFUND_TIME;
	}

	public void setREFUND_TIME(Date REFUND_TIME) {
		this.REFUND_TIME = REFUND_TIME;
	}

	public String getREPLACE_ROOM() {
		return REPLACE_ROOM;
	}

	public void setREPLACE_ROOM(String REPLACE_ROOM) {
		this.REPLACE_ROOM = REPLACE_ROOM == null ? null : REPLACE_ROOM.trim();
	}
}