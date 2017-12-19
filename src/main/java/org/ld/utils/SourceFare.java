package org.ld.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by lenovo on 2017/12/5.
 */
public class SourceFare {
    public static Map<String,Object> sourceFare(Double number,String type){
        Map<String, String> rate = Para.getParaPair("rate", 0, 1);
//        System.out.println(rate.size());
//
//        Iterator<Map.Entry<String,String>> it = rate.entrySet().iterator();
//        while(it.hasNext()){
//            Map.Entry<String,String> entry = it.next();
//            System.out.println(entry.getKey() + ":" + entry.getValue());
//        }
        Map<String,Object> ans = new HashMap<>();
        double count = 0.0;
        double step_1 = 0.0;
        double step_2 = 0.0;
        double step_3 = 0.0;
        double step_4 = 0.0;
        String p = "";
        String c = "";
        int step = 0;

        if(type.equals("water")){
            p = "wp";
            c = "wc";
        }else if(type.equals("elec")){
            p = "pp";
            c = "pc";
        }else if(type.equals("gas")){
            p = "gp";
            c = "gc";
        }else{
            return null;
        }

        if(number>=0&& number <= Double.parseDouble(rate.get(c+1))){
            step_1 = number;
            step = 1;
        }
        else if(number < (Double.parseDouble(rate.get(c+2)) + Double.parseDouble(rate.get(c+1)))){
            step_1 = Double.parseDouble(rate.get(c+1));
            step_2 = number - Double.parseDouble(rate.get(c+1));
            step = 2;
        }
        else if(number < (Double.parseDouble(rate.get(c+2)) + Double.parseDouble(rate.get(c+1)) + Double.parseDouble(rate.get(c+3)))){
            step_1 = Double.parseDouble(rate.get(c+1));
            step_2 = Double.parseDouble(rate.get(c+2));
            step_3 = number - (Double.parseDouble(rate.get(c+2)) + Double.parseDouble(rate.get(c+1)));
            step = 3;
        }
        else {
            step_1 = Double.parseDouble(rate.get(c+1));
            step_2 = Double.parseDouble(rate.get(c+2));
            step_3 = Double.parseDouble(rate.get(c+3));
            step_4 = number - (Double.parseDouble(rate.get(c+3)) + Double.parseDouble(rate.get(c+2)) + Double.parseDouble(rate.get(c+1)));
            step = 4;
        }
        count = step_1 * Double.parseDouble(rate.get(p+1)) + step_2 * Double.parseDouble(rate.get(p+2)) +
                step_3 * Double.parseDouble(rate.get(p+3)) + step_4 * Double.parseDouble(rate.get(p+4));

        ans.put("count",count);
        ans.put("step",step);
//        System.out.println(count + ":" + step);
        return ans;
    }

//    public static void main(String args[]){
//        double f = 12.00000001;
//        java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
//        System.out.println(df.format(f));
//
//    }

}
