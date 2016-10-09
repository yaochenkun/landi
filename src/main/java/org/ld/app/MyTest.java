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
		CurEnv temp = new CurEnv();
		
		MyFile f = new MyFile();
		
		Map<String, String> ans = f.getFilePath("log");
	}
}
