package org.ld.model;

import java.util.Date;

public class Problem {
    private Integer ID;

    private String ROOM_NUM;

    private String ROOM_STATE;

    private String GUEST_NAME;

    private Date REFLECT_DATE;

    private Date SOLVE_DATE;

    private Integer REFLECTER_ID;

    private String REFLECTER_NAME;

    private String DESCRIPTION;

    private String OUTSIDER_REASON;

    private String OUTSIDER_COMMENT;

    private Integer IS_LEMANAGE;

    private String TYPE;

    private String SUBTYPE;

    private String LEVEL;

    private String REPAIRER_REASON;

    private String REPAIRER_COMMENT;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getROOM_NUM() {
        return ROOM_NUM;
    }

    public void setROOM_NUM(String ROOM_NUM) {
        this.ROOM_NUM = ROOM_NUM == null ? null : ROOM_NUM.trim();
    }

    public String getROOM_STATE() {
        return ROOM_STATE;
    }

    public void setROOM_STATE(String ROOM_STATE) {
        this.ROOM_STATE = ROOM_STATE == null ? null : ROOM_STATE.trim();
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public Date getREFLECT_DATE() {
        return REFLECT_DATE;
    }

    public void setREFLECT_DATE(Date REFLECT_DATE) {
        this.REFLECT_DATE = REFLECT_DATE;
    }

    public Date getSOLVE_DATE() {
        return SOLVE_DATE;
    }

    public void setSOLVE_DATE(Date SOLVE_DATE) {
        this.SOLVE_DATE = SOLVE_DATE;
    }

    public Integer getREFLECTER_ID() {
        return REFLECTER_ID;
    }

    public void setREFLECTER_ID(Integer REFLECTER_ID) {
        this.REFLECTER_ID = REFLECTER_ID;
    }

    public String getREFLECTER_NAME() {
        return REFLECTER_NAME;
    }

    public void setREFLECTER_NAME(String REFLECTER_NAME) {
        this.REFLECTER_NAME = REFLECTER_NAME == null ? null : REFLECTER_NAME.trim();
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION == null ? null : DESCRIPTION.trim();
    }

    public String getOUTSIDER_REASON() {
        return OUTSIDER_REASON;
    }

    public void setOUTSIDER_REASON(String OUTSIDER_REASON) {
        this.OUTSIDER_REASON = OUTSIDER_REASON == null ? null : OUTSIDER_REASON.trim();
    }

    public String getOUTSIDER_COMMENT() {
        return OUTSIDER_COMMENT;
    }

    public void setOUTSIDER_COMMENT(String OUTSIDER_COMMENT) {
        this.OUTSIDER_COMMENT = OUTSIDER_COMMENT == null ? null : OUTSIDER_COMMENT.trim();
    }

    public Integer getIS_LEMANAGE() {
        return IS_LEMANAGE;
    }

    public void setIS_LEMANAGE(Integer IS_LEMANAGE) {
        this.IS_LEMANAGE = IS_LEMANAGE;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public String getSUBTYPE() {
        return SUBTYPE;
    }

    public void setSUBTYPE(String SUBTYPE) {
        this.SUBTYPE = SUBTYPE == null ? null : SUBTYPE.trim();
    }

    public String getLEVEL() {
        return LEVEL;
    }

    public void setLEVEL(String LEVEL) {
        this.LEVEL = LEVEL == null ? null : LEVEL.trim();
    }

    public String getREPAIRER_REASON() {
        return REPAIRER_REASON;
    }

    public void setREPAIRER_REASON(String REPAIRER_REASON) {
        this.REPAIRER_REASON = REPAIRER_REASON == null ? null : REPAIRER_REASON.trim();
    }

    public String getREPAIRER_COMMENT() {
        return REPAIRER_COMMENT;
    }

    public void setREPAIRER_COMMENT(String REPAIRER_COMMENT) {
        this.REPAIRER_COMMENT = REPAIRER_COMMENT == null ? null : REPAIRER_COMMENT.trim();
    }
}