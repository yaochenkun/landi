package org.ld.model;

import java.util.Date;

public class Maintain {
	private Integer ID;

	private String ROOM_NUMBER;

    private Integer GUEST_ID;

    private Date STIME;

	private Date FTIME;

	private Date ETIME;

	private Integer LEVEL;

	private String PROBLEM;

	private Integer PRO_TYPE;

	private Integer PRO_CAUSE;

	private String COMMENT;

	private String PIC;

	private Double CHARGE;

	private Integer TIMES;

	private String DEPART;

	private String FOLLOW;

	private Integer STATE;

	private Boolean PAY;

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

	public Date getSTIME() {
		return STIME;
	}

	public void setSTIME(Date STIME) {
		this.STIME = STIME;
	}

	public Date getFTIME() {
		return FTIME;
	}

	public void setFTIME(Date FTIME) {
		this.FTIME = FTIME;
	}

	public Date getETIME() {
		return ETIME;
	}

	public void setETIME(Date ETIME) {
		this.ETIME = ETIME;
	}

	public Integer getLEVEL() {
		return LEVEL;
	}

	public void setLEVEL(Integer LEVEL) {
		this.LEVEL = LEVEL;
	}

	public String getPROBLEM() {
		return PROBLEM;
	}

	public void setPROBLEM(String PROBLEM) {
		this.PROBLEM = PROBLEM == null ? null : PROBLEM.trim();
	}

	public Integer getPRO_TYPE() {
		return PRO_TYPE;
	}

	public void setPRO_TYPE(Integer PRO_TYPE) {
		this.PRO_TYPE = PRO_TYPE;
	}

	public Integer getPRO_CAUSE() {
		return PRO_CAUSE;
	}

	public void setPRO_CAUSE(Integer PRO_CAUSE) {
		this.PRO_CAUSE = PRO_CAUSE;
	}

	public String getCOMMENT() {
		return COMMENT;
	}

	public void setCOMMENT(String COMMENT) {
		this.COMMENT = COMMENT == null ? null : COMMENT.trim();
	}

	public String getPIC() {
		return PIC;
	}

	public void setPIC(String PIC) {
		this.PIC = PIC == null ? null : PIC.trim();
	}

	public Double getCHARGE() {
		return CHARGE;
	}

	public void setCHARGE(Double CHARGE) {
		this.CHARGE = CHARGE;
	}

	public Integer getTIMES() {
		return TIMES;
	}

	public void setTIMES(Integer TIMES) {
		this.TIMES = TIMES;
	}

	public String getDEPART() {
		return DEPART;
	}

	public void setDEPART(String DEPART) {
		this.DEPART = DEPART == null ? null : DEPART.trim();
	}

	public String getFOLLOW() {
		return FOLLOW;
	}

	public void setFOLLOW(String FOLLOW) {
		this.FOLLOW = FOLLOW == null ? null : FOLLOW.trim();
	}

	public Integer getSTATE() {
		return STATE;
	}

	public void setSTATE(Integer STATE) {
		this.STATE = STATE;
	}

	public Boolean getPAY() {
		return PAY;
	}

	public void setPAY(Boolean PAY) {
		this.PAY = PAY;
	}
}