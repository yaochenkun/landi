package org.ld.model;

import java.util.Date;

public class User {
    private Integer ID;

    private String USERNAME;

    private String PASSWD;

    private String NAME;

    private String NUM;

    private String DEPART;

    private Integer ROLE;

    private Integer AUTH;

    private Date CTIME;

    private Date LTIME;

    private Integer STATE;

    private Byte RESET_PASSWD;


    @Override
    public String toString() {
        return "User [ID=" + ID + ", USERNAME=" + USERNAME + ", PASSWD=" + PASSWD + ", NAME=" + NAME + ", NUM=" + NUM
                + ", DEPART=" + DEPART + ", ROLE=" + ROLE + ", AUTH=" + AUTH + ", CTIME=" + CTIME + ", LTIME=" + LTIME
                + "]";
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String USERNAME) {
        this.USERNAME = USERNAME == null ? null : USERNAME.trim();
    }

    public String getPASSWD() {
        return PASSWD;
    }

    public void setPASSWD(String PASSWD) {
        this.PASSWD = PASSWD == null ? null : PASSWD.trim();
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME == null ? null : NAME.trim();
    }

    public String getNUM() {
        return NUM;
    }

    public void setNUM(String NUM) {
        this.NUM = NUM == null ? null : NUM.trim();
    }

    public String getDEPART() {
        return DEPART;
    }

    public void setDEPART(String DEPART) {
        this.DEPART = DEPART == null ? null : DEPART.trim();
    }

    public Integer getROLE() {
        return ROLE;
    }

    public void setROLE(Integer ROLE) {
        this.ROLE = ROLE;
    }

    public Integer getAUTH() {
        return AUTH;
    }

    public void setAUTH(Integer AUTH) {
        this.AUTH = AUTH;
    }

    public Date getCTIME() {
        return CTIME;
    }

    public void setCTIME(Date CTIME) {
        this.CTIME = CTIME;
    }

    public Date getLTIME() {
        return LTIME;
    }

    public void setLTIME(Date LTIME) {
        this.LTIME = LTIME;
    }

    public Integer getSTATE() {
        return STATE;
    }

    public void setSTATE(Integer STATE) {
        this.STATE = STATE;
    }

    public Byte getRESET_PASSWD() {
        return RESET_PASSWD;
    }

    public void setRESET_PASSWD(Byte RESET_PASSWD) {
        this.RESET_PASSWD = RESET_PASSWD;
    }
}