package org.ld.app;

import java.io.File;
import java.util.ArrayList;
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
		CurEnv cur_env = new CurEnv();
		
		MyFile f = new MyFile();
		
		if((262141 & (0x01<<cur_env.getAuths().get("wRoom"))) != 0)
			System.out.println(1);
		else 
			System.out.println("#"+ (262141 & (0x01<<cur_env.getAuths().get("wRoom"))));
	}
}
