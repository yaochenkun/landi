package org.ld.model;

public class MaintainFollow {
	private Integer ID;

	private String ROOM_NUMBER;

	private Integer MAIN_ID;

	private String DETAIL;

	private String COMMENT;

	private String DOING;

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

	public Integer getMAIN_ID() {
		return MAIN_ID;
	}

	public void setMAIN_ID(Integer MAIN_ID) {
		this.MAIN_ID = MAIN_ID;
	}

	public String getDETAIL() {
		return DETAIL;
	}

	public void setDETAIL(String DETAIL) {
		this.DETAIL = DETAIL == null ? null : DETAIL.trim();
	}

	public String getCOMMENT() {
		return COMMENT;
	}

	public void setCOMMENT(String COMMENT) {
		this.COMMENT = COMMENT == null ? null : COMMENT.trim();
	}

	public String getDOING() {
		return DOING;
	}

	public void setDOING(String DOING) {
		this.DOING = DOING == null ? null : DOING.trim();
	}
}