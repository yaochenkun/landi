package org.ld.model;

import java.util.Date;

public class RoomMeter {
	private Integer ID;

	private Integer ROOM_ID;

	private String TYPE;

	private String METER_NUMBER;

	private Double YEAR_INIT_VAL;

	private Double LAST_MONTH_VAL;

	private Double CUR_VAL;

	private Integer MONTH;

	private Integer STEP;

	private Double MONEY;

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

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String TYPE) {
		this.TYPE = TYPE == null ? null : TYPE.trim();
	}

	public String getMETER_NUMBER() {
		return METER_NUMBER;
	}

	public void setMETER_NUMBER(String METER_NUMBER) {
		this.METER_NUMBER = METER_NUMBER == null ? null : METER_NUMBER.trim();
	}

	public Double getYEAR_INIT_VAL() {
		return YEAR_INIT_VAL;
	}

	public void setYEAR_INIT_VAL(Double YEAR_INIT_VAL) {
		this.YEAR_INIT_VAL = YEAR_INIT_VAL;
	}

	public Double getLAST_MONTH_VAL() {
		return LAST_MONTH_VAL;
	}

	public void setLAST_MONTH_VAL(Double LAST_MONTH_VAL) {
		this.LAST_MONTH_VAL = LAST_MONTH_VAL;
	}

	public Double getCUR_VAL() {
		return CUR_VAL;
	}

	public void setCUR_VAL(Double CUR_VAL) {
		this.CUR_VAL = CUR_VAL;
	}

	public Integer getMONTH() {
		return MONTH;
	}

	public void setMONTH(Integer MONTH) {
		this.MONTH = MONTH;
	}

	public Integer getSTEP() {
		return STEP;
	}

	public void setSTEP(Integer STEP) {
		this.STEP = STEP;
	}

	public Double getMONEY() {
		return MONEY;
	}

	public void setMONEY(Double MONEY) {
		this.MONEY = MONEY;
	}
}