package org.ld.app;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.*;

public class MyTest {
	private static Logger logger = Logger.getLogger(MyTest.class);

	public static void main(String[] args) throws ParseException {
//		Para tp = new Para();
		String date = "2016-01";
		int year = Integer.parseInt(date.substring(0,4));
		int mon = Integer.parseInt(date.substring(5));
		
		System.out.println(year + " " + mon);
	}
}
