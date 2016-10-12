package org.ld.app;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import org.ld.app.*;
import org.ld.dao.UserMapper;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class MyTest {		
	private static Logger logger = Logger.getLogger(MyTest.class);
	public static void main(String[] args)
	{
		CurEnv cur_env = new CurEnv();
		
		Para p = new Para();
		
		Map<String,String> ans = p.getParaPair("charge", 0, 1);
		Iterator<Entry<String, String>> it = ans.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry<String, String> entry = it.next();
			System.out.println(entry.getKey() + " " + entry.getValue());
		}
	}
}
