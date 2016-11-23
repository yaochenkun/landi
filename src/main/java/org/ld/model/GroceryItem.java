package org.ld.model;

public class GroceryItem {
    private Integer ID;

    private String NAME;

    private String TYPE;

    private String CAT;

    private Integer TOTAL;

    private Integer TOTAL_LOSS;

    private Integer TOTAL_SOLD;

    private Double TOTAL_BENIFIT;

    private Integer AVALIABLE;

    private Double BUY_MONEY;

    private Double SELL_MONEY;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public String getCAT() {
        return CAT;
    }

    public void setCAT(String CAT) {
        this.CAT = CAT == null ? null : CAT.trim();
    }

    public Integer getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(Integer TOTAL) {
        this.TOTAL = TOTAL;
    }

    public Integer getTOTAL_LOSS() {
        return TOTAL_LOSS;
    }

    public void setTOTAL_LOSS(Integer TOTAL_LOSS) {
        this.TOTAL_LOSS = TOTAL_LOSS;
    }

    public Integer getTOTAL_SOLD() {
        return TOTAL_SOLD;
    }

    public void setTOTAL_SOLD(Integer TOTAL_SOLD) {
        this.TOTAL_SOLD = TOTAL_SOLD;
    }

    public Double getTOTAL_BENIFIT() {
        return TOTAL_BENIFIT;
    }

    public void setTOTAL_BENIFIT(Double TOTAL_BENIFIT) {
        this.TOTAL_BENIFIT = TOTAL_BENIFIT;
    }

    public Integer getAVALIABLE() {
        return AVALIABLE;
    }

    public void setAVALIABLE(Integer AVALIABLE) {
        this.AVALIABLE = AVALIABLE;
    }

    public Double getBUY_MONEY() {
        return BUY_MONEY;
    }

    public void setBUY_MONEY(Double BUY_MONEY) {
        this.BUY_MONEY = BUY_MONEY;
    }

    public Double getSELL_MONEY() {
        return SELL_MONEY;
    }

    public void setSELL_MONEY(Double SELL_MONEY) {
        this.SELL_MONEY = SELL_MONEY;
    }
}