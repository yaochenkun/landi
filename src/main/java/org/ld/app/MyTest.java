package org.ld.app;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import org.ld.app.*;
import org.ld.dao.UserMapper;
import org.ld.model.Guest;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.*;

public class MyTest {		
	private static Logger logger = Logger.getLogger(MyTest.class);
	public static void main(String[] args)
	{
		CurEnv cur_env = new CurEnv();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
	     String input = args.length == 0 ? "1818-11-11" : args[0];
	     System.out.print(input + " Parses as ");
	     Date t;
	     try {
	          t = ft.parse(input);
	          System.out.println(t);
	     } catch (Exception e) {
	          System.out.println("Unparseable using " + ft);
	      }  
	}
}
