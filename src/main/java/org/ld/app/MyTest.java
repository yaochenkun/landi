package org.ld.app;

import java.util.List;
import java.util.Map;

import org.ld.app.*;
import org.ld.dao.UserMapper;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class MyTest {		
	public static void main(String[] args)
	{
//		CurEnv temp = new CurEnv();
//		
//		System.out.println(temp.getSettings().get("default_passwd"));
//		System.out.println(temp.myMD5("654321"));
		Para t = new Para();
		Map<String, String> ans = t.getParaPair("sys", 0, 1);
		System.out.println(ans.size());
		
		t.setPair("test", ans);
	}
}
