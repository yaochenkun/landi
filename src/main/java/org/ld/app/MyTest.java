package org.ld.app;

import java.io.File;
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

	public static void main(String[] args) {
		Para tp = new Para();
		Map<String, String> temp = tp.getParaPair("item_cat", 0, 1);

		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] ans = list.split("[,]");
			Set<String> news = new HashSet<String>();
			System.out.println(key);
			for (int i = 0; i < ans.length; i++) {
				news.add(ans[i]);
				System.out.print(ans[i] + " ");
			}
		}
	}
}
