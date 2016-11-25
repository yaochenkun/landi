package org.ld.model;

public class Host {
	private Integer ID;

	private Integer GUEST_ID;

	private String HOST_NAME;

	private Double RENT_CHARGE;

	private Double SERVICE_CHARGE;

	private Double RETURN_MONEY;

	private Double OTHER_CHARGE;

	private Integer SYS_STATE;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer ID) {
		this.ID = ID;
	}

	public Integer getGUEST_ID() {
		return GUEST_ID;
	}

	public void setGUEST_ID(Integer GUEST_ID) {
		this.GUEST_ID = GUEST_ID;
	}

	public String getHOST_NAME() {
		return HOST_NAME;
	}

	public void setHOST_NAME(String HOST_NAME) {
		this.HOST_NAME = HOST_NAME == null ? null : HOST_NAME.trim();
	}

	public Double getRENT_CHARGE() {
		return RENT_CHARGE;
	}

	public void setRENT_CHARGE(Double RENT_CHARGE) {
		this.RENT_CHARGE = RENT_CHARGE;
	}

	public Double getSERVICE_CHARGE() {
		return SERVICE_CHARGE;
	}

	public void setSERVICE_CHARGE(Double SERVICE_CHARGE) {
		this.SERVICE_CHARGE = SERVICE_CHARGE;
	}

	public Double getRETURN_MONEY() {
		return RETURN_MONEY;
	}

	public void setRETURN_MONEY(Double RETURN_MONEY) {
		this.RETURN_MONEY = RETURN_MONEY;
	}

	public Double getOTHER_CHARGE() {
		return OTHER_CHARGE;
	}

	public void setOTHER_CHARGE(Double OTHER_CHARGE) {
		this.OTHER_CHARGE = OTHER_CHARGE;
	}

	public Integer getSYS_STATE() {
		return SYS_STATE;
	}

	public void setSYS_STATE(Integer SYS_STATE) {
		this.SYS_STATE = SYS_STATE;
	}
}