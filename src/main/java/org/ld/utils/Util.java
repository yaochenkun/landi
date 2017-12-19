package org.ld.utils;

/**
 * Created by lenovo on 2017/12/5.
 */
public class Util {
    public static String preMonth(String month){
        String temp = "";
        if(month.charAt(0) == '0' && month.charAt(1) == '1'){
            temp = "12";
        }else if(month.charAt(0) == '1' && month.charAt(1) == '0'){
            temp = "09";
        }else {
            temp = String.valueOf(month.charAt(0)) + String.valueOf((char)(month.charAt(1)-1));
        }
        return temp;
    }

}
