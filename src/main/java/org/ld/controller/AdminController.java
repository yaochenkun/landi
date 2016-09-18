package org.ld.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ld.model.User;

import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.ld.app.CurEnv;
import org.ld.app.Para;

@Controller
@RequestMapping("/HomeAdmin")
public class AdminController {	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/searchUserList/{userId}")
	public @ResponseBody Map<String, Object> showUserInfo(HttpSession session, ModelMap modelMap, @PathVariable int userId,
			int pageNumber, int eachPage){
		
		Map<String, Object > res_map = new HashMap<String, Object>(); 
		int st = (pageNumber - 1) * eachPage;
		List<User> user_list = userService.selectUserRange(st, st + eachPage - 1);
		
		res_map.put("pageList", user_list);
		
		return res_map;
	}
	
	@RequestMapping("/addUser")
	public @ResponseBody String addUser(HttpSession session, ModelMap modelMap,
			User newUser){
		
		userService.insert(newUser);
		
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
}
