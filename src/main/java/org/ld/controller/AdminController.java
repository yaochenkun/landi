package org.ld.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.ld.model.User;

import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import org.ld.app.CurEnv;
import org.ld.app.Para;

@Controller
@RequestMapping("/HomeAdmin")
public class AdminController {	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/searchUserList/{pageNumber}")
	public @ResponseBody Map<String, Object> showUserInfo(HttpSession session, ModelMap modelMap, @PathVariable int pageNumber){
		
		int eachPage = 10;
		Map<String, Object > res_map = new HashMap<String, Object>(); 
		int st = (pageNumber - 1) * eachPage;
		List<User> user_list = userService.selectUserRange(st, st + eachPage - 1);
		
		res_map.put("pageList", user_list);
		res_map.put("pageNow", pageNumber);
		//!! 获取一共有多少页
		//res_map.put("pageTotal", pageTotal);
		return res_map;
	}
	
	@RequestMapping("/addUser")
	public @ResponseBody String addUser(@RequestBody String userString){
		JSONObject userJson = (JSONObject) JSONObject.parse(userString);
		
		User newUser = new User();
		newUser.setID((Integer)userJson.get("ID"));
		newUser.setUSERNAME((String)userJson.get("USERNAME"));
		newUser.setNAME((String)userJson.get("NAME"));
		
		System.out.println(newUser.getUSERNAME());
		//!!
		//userService.insert(newUser);
		
		return "/addUser";
	}
		
	
	@RequestMapping("/checkRole")
	public @ResponseBody Integer checkRole(HttpSession session, ModelMap modelMap,
			Integer role){
		Para tp = new Para();
		tp.ReadParas("role", role.toString());
		String auth = tp.getParas()[2];
		return Integer.parseInt(auth);
	}
	
	@RequestMapping("/setRate")
	public @ResponseBody String setRate(HttpSession session, ModelMap modelMap,
			Integer role){
		
		Para tp = new Para();
		tp.ReadParas("role", role.toString());
		String auth = tp.getParas()[2];
		return "setRate";
	}
	
	@RequestMapping("/requestDepart")
	public @ResponseBody List<String> departMenu()
	{
		Para tp = new Para();
		Map<String, List<String> > temp = tp.getParaList("depart");
		List<String> ans = new ArrayList<String>();
		for(String x: temp.keySet())
		{
			ans.add(x);
		}
		
		return ans;
	}
	
	@RequestMapping("/requestRole")
	public @ResponseBody Map<Integer, String> departRole()
	{
		Para tp = new Para();
		Map<String, List<String> > temp = tp.getParaList("role");
		Map<Integer, String> ans = new HashMap<Integer, String>();
		Iterator<Entry<String, List<String>>> it = temp.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry<String, List<String>> entry = it.next();
			ans.put(Integer.parseInt(entry.getKey()), entry.getValue().get(0));
		}
		return ans;
	}
	
	@RequestMapping("/requestCap/{role}")
	public @ResponseBody Integer Cap(@PathVariable Integer role)
	{
		Para tp = new Para();
		tp.ReadParas("role", role.toString());
		String[] ps = tp.getParas();
	
 		return Integer.parseInt(ps[2]);
	}
}
