package org.ld.model;

public class PlanDetail {
	private Integer ID;

	private Integer PLAN_ID;

	private Integer FAC_ID;

	private String FAC_NUMBER;

	private String FAC_NAME;

	private Integer TOTAL;

	private Double ALL_MONEY;

	private String COMMENT;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	public Integer getPLAN_ID() {
		return PLAN_ID;
	}

	public void setPLAN_ID(Integer PLAN_ID) {
		this.PLAN_ID = PLAN_ID;
	}

	public Integer getFAC_ID() {
		return FAC_ID;
	}

	public void setFAC_ID(Integer FAC_ID) {
		this.FAC_ID = FAC_ID;
	}

	public String getFAC_NUMBER() {
		return FAC_NUMBER;
	}

	public void setFAC_NUMBER(String FAC_NUMBER) {
		this.FAC_NUMBER = FAC_NUMBER == null ? null : FAC_NUMBER.trim();
	}

	public String getFAC_NAME() {
		return FAC_NAME;
	}

	public void setFAC_NAME(String FAC_NAME) {
		this.FAC_NAME = FAC_NAME == null ? null : FAC_NAME.trim();
	}

	public Integer getTOTAL() {
		return TOTAL;
	}

	public void setTOTAL(Integer TOTAL) {
		this.TOTAL = TOTAL;
	}

	public Double getALL_MONEY() {
		return ALL_MONEY;
	}

	public void setALL_MONEY(Double ALL_MONEY) {
		this.ALL_MONEY = ALL_MONEY;
	}

	public String getCOMMENT() {
		return COMMENT;
	}

	public void setCOMMENT(String COMMENT) {
		this.COMMENT = COMMENT == null ? null : COMMENT.trim();
	}
}