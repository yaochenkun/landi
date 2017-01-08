package org.ld.app;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import org.ld.app.*;
import org.ld.dao.UserMapper;
import org.ld.model.Guest;
import org.ld.model.Maintain;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.*;

public class MyTest {
	private static Logger logger = Logger.getLogger(MyTest.class);
	
	public static class sta{
		public int total = 0;
		public Map<String, Integer> count = new HashMap<String, Integer>();
		public Map<String, Integer> time = new HashMap<String, Integer>();
	};
	
	public static int getIntervalDays(Date startday,Date endday){          
	    if(startday.after(endday)){  
	        Date cal=startday;  
	        startday=endday;  
	        endday=cal;  
	    }          
	    long sl=startday.getTime();  
	    long el=endday.getTime();         
	    long ei=el-sl;             
	    return (int)(ei/(1000*60*60*24));  
	} 

	public static void main(String[] args) throws ParseException {
//		Para tp = new Para();
		Map<String, sta> cal = new HashMap<String, sta>();

		sta m2 = cal.get("aaa");
		if(m2 == null)
		{
			m2 = new sta();
			cal.put("aaa", m2);
		}
		
		String key = "bb";
		Integer val = m2.count.get(key);
		if(val != null)
			m2.count.put(key, val + 1);
		else
			m2.count.put(key, 1);
		
		val = m2.time.get(key);
		if(val != null)
			m2.time.put(key, val + 1);
		else
			m2.time.put(key, 1);
		
		for(String k : cal.keySet())
		{
			System.out.println(k);
			sta m3 = cal.get(k);
			System.out.println(m3.total);
			
			for(String k2: m3.count.keySet())
			{
				System.out.println(k2 + " " +  m3.count.get(k2));
			}
			for(String k2: m3.time.keySet())
			{
				System.out.println(k2 + " " +  m3.time.get(k2));
			}
		}
	}
}
