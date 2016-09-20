package org.ld.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public @ResponseBody String addUser(@RequestBody String userString, HttpSession session){
		JSONObject userJson = (JSONObject) JSONObject.parse(userString);
		
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		Para tp = new Para();
		User newUser = new User();
		
		newUser.setNUM((String)userJson.get("NUM"));
		newUser.setUSERNAME((String)userJson.get("USERNAME"));
		newUser.setNAME((String)userJson.get("NAME"));
		newUser.setDEPART((String)userJson.get("DEPART"));
		newUser.setROLE((Integer)userJson.get("ROLE"));
		newUser.setPASSWD(cur_env.getSettings().get("default_passwd"));
		newUser.setAUTH(Integer.parseInt(tp.ReadParaPair("role", (String)userJson.get("ROLE"), 0, 2)[1]));
		newUser.setCTIME(new Date());
		newUser.setLTIME(new Date());
		newUser.setSTATE(1);
		
		userService.insert(newUser);
		return "/addUser";
	}
	
	@RequestMapping("/setRate/{role}")
	public @ResponseBody String setRate(HttpSession session, ModelMap modelMap,
			@PathVariable Integer role){
		
		return "setRate";
	}
	
	@RequestMapping("/requestDepart")
	public @ResponseBody Map<String,List<String>> departMenu()
	{
		Para tp = new Para();
		Map<String, List<String> > temp = tp.getParaList("depart");
		List<String> ans = new ArrayList<String>();
		for(String x: temp.keySet())
		{
			ans.add(x);
		}
		
		Map<String, List<String> > res =new  HashMap<String, List<String>>(); 
		res.put("departList", ans);
		
		return res;
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
		String[] ps = tp.ReadParas("role", role.toString());
	
 		return Integer.parseInt(ps[2]);
	}
}
