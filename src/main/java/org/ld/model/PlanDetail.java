package org.ld.model;

public class PlanDetail {
    private Integer ID;

    private Integer PLAN_ID;

    private Integer FAC_ID;

    private Integer TOTAL;

    private Integer ALREADY;

    private Double ALL_MONEY;

    private String COMMENT;
	
	private Integer SYS_STATE;
    
    private String TYPE;
    
    private String CAT;
    
    private String BAND;
    
    private String NAME;

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

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Integer getALREADY() {
        return ALREADY;
    }

    public void setALREADY(Integer ALREADY) {
        this.ALREADY = ALREADY;
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
	
	public Integer getSYS_STATE() {
        return SYS_STATE;
    }

    public void setSYS_STATE(Integer SYS_STATE) {
        this.SYS_STATE = SYS_STATE;
    }

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getCAT() {
		return CAT;
	}

	public void setCAT(String cAT) {
		CAT = cAT;
	}

	public String getBAND() {
		return BAND;
	}

	public void setBAND(String bAND) {
		BAND = bAND;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}
}