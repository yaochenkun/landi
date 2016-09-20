package org.ld.app;

import java.util.List;

import org.ld.app.*;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class MyTest {	
	public static void main(String[] args)
	{
		CurEnv temp = new CurEnv();
		
		System.out.println(temp.getSettings().get("default_passwd"));
		System.out.println(temp.myMD5("654321"));
	}
}
