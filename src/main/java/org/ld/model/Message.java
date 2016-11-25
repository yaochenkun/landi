package org.ld.model;

import java.util.Date;

public class Message {
	private Integer ID;

	private Date CTIME;

	private Date NTIME;

	private Integer TYPE;

	private Integer USERID;

	private String CONTENT;

	private Integer STATE;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	public Date getCTIME() {
		return CTIME;
	}

	public void setCTIME(Date CTIME) {
		this.CTIME = CTIME;
	}

	public Date getNTIME() {
		return NTIME;
	}

	public void setNTIME(Date NTIME) {
		this.NTIME = NTIME;
	}

	public Integer getTYPE() {
		return TYPE;
	}

	public void setTYPE(Integer TYPE) {
		this.TYPE = TYPE;
	}

	public Integer getUSERID() {
		return USERID;
	}

	public void setUSERID(Integer USERID) {
		this.USERID = USERID;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String CONTENT) {
		this.CONTENT = CONTENT == null ? null : CONTENT.trim();
	}

	public Integer getSTATE() {
		return STATE;
	}

	public void setSTATE(Integer STATE) {
		this.STATE = STATE;
	}
}