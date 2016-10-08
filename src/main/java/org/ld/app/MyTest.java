package org.ld.app;

import java.util.List;
import java.util.Map;
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
		CurEnv temp = new CurEnv();
		
		System.out.println(temp.getSettings().get("default_passwd"));
		System.out.println(temp.myMD5("654321"));
		
		logger.debug("Hello this is a debug message");
		logger.info("Hello this is an info message");
//		Para t = new Para();
//		Map<String, String> ans = t.getParaPair("sys", 0, 1);
//		System.out.println(ans.size());
//		
//		t.setPair("test", ans);
	}
}
