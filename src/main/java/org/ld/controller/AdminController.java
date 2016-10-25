package org.ld.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.app.MyFile;
import org.ld.app.Para;

@Controller
@RequestMapping("/HomeAdmin")
public class AdminController {	
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = Logger.getLogger("logRec");
	
	@RequestMapping("/searchUserList/{pageNumber}")
	public @ResponseBody Map<String, Object> showUserInfo(HttpSession session, @PathVariable int pageNumber){
				
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object > res_map = new HashMap<String, Object>(); 
		
		int eachPage = cur_env.getSettingsInt().get("list_size");
		int pageTotal = (int)Math.ceil((float)userService.totalRow()/eachPage);
		
		
		if(pageNumber > pageTotal)
			pageNumber = pageTotal;
		
		int st = (pageNumber - 1) * eachPage + 1;
		List<User> user_list = userService.selectUserRange(st, st + eachPage - 1);
	
		res_map.put("pageList", user_list);
		res_map.put("pageNow", pageNumber);
		res_map.put("pageTotal", pageTotal);
		return res_map;
	}
	
	@RequestMapping("/addUser")
	public @ResponseBody Integer addUser(@RequestBody String userString, HttpSession session){
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
		newUser.setAUTH(Integer.parseInt(tp.ReadParaPair("role", ((Integer)userJson.get("ROLE")).toString(), 0, 2)[1]));
		newUser.setCTIME(new Date());
		newUser.setLTIME(new Date());
		newUser.setSTATE(2);
		
		if(userService.insert(newUser) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " create a new user " + newUser.getNAME());
			return 1;
		}
		else
		{
			logger.error(cur_env.getCur_user().getNAME() + " failed to create the new user " + newUser.getNAME());
			return 0;
		}
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
	
	@RequestMapping("/changePassword")
	public @ResponseBody Integer changePassword(HttpSession session, @RequestBody String stringPassword){
		JSONObject passwordJson = (JSONObject) JSONObject.parse(stringPassword);
		String password = passwordJson.getString("password");
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		cur_env.getCur_user().setPASSWD(cur_env.myMD5(password));
		
		if(userService.updateUserInfo(cur_env.getCur_user()) == 1)
		{
			logger.info("Change password of " + cur_env.getCur_user().getNAME());
			return 1;
		}
		else
		{
			logger.error("Failed to change password of " + cur_env.getCur_user().getNAME());
			return 0;
		}
	}
	
	@RequestMapping("/resetPasswd/{user_id}")
	public @ResponseBody Integer resetPasswd(HttpSession session, @PathVariable Integer user_id)
	{
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		User temp = new User();
		temp.setID(user_id);
		temp.setPASSWD(cur_env.getSettings().get("default_passwd"));
		
		if(userService.updateUserInfo(temp) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " reset password of " + user_id);
			return 1;
		}
		else
		{
			logger.error(cur_env.getCur_user().getNAME() + " failed to reset password of " + user_id);
			return 0;
		}
	}
		
	@RequestMapping("/forbidUser/{user_id}")
	public @ResponseBody Integer forbidUser(HttpSession session, @PathVariable int user_id)
	{
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		User temp = new User();
		temp.setID(user_id);
		temp.setSTATE(cur_env.getSettingsInt().get("forbid_state"));	
		
		if(userService.updateUserInfo(temp) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " disable user " + user_id);
			return 1;
		}
		else
		{
			logger.error(cur_env.getCur_user().getNAME() + " failed to disable user " + user_id);
			return 0;
		}
	}
	
	@RequestMapping("/enableUser/{user_id}")
	public @ResponseBody Integer enableUser(HttpSession session, @PathVariable int user_id)
	{
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		User temp = new User();
		temp.setID(user_id);
		temp.setSTATE(cur_env.getSettingsInt().get("normal_state"));	
		
		if(userService.updateUserInfo(temp) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " enable user " + user_id);
			return 1;
		}
		else
		{
			logger.error(cur_env.getCur_user().getNAME() + " failed to enable user " + user_id);
			return 0;
		}
	}
	
	@RequestMapping("/getRate")
	public @ResponseBody Map<String, String> getRate(HttpSession session)
	{
		Para p = new Para();
		return p.getParaPair("rate", 0, 1);
	}
	
	@RequestMapping("/setRate")
	public @ResponseBody Integer setRate(HttpSession session, @RequestBody Map<String,String> rate)
	{		
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		Para p = new Para();
		if(p.setPair("rate", rate) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " set rate " + rate.toString());
			return 1;
		}
		else
		{
			logger.info(cur_env.getCur_user().getNAME() + " failed to set rate " + rate.toString());
			return 0;
		}
	}
	
	@RequestMapping("/getCharge")
	public @ResponseBody Map<String, String> getCharge(HttpSession session)
	{
		Para p = new Para();
		return p.getParaPair("charge", 0, 1);
	}
	
	@RequestMapping("/setCharge")
	public @ResponseBody Integer setCharge(HttpSession session, @RequestBody Map<String,String> charge)
	{		
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		Para p = new Para();
		if(p.setPair("charge", charge) == 1)
		{
			logger.info(cur_env.getCur_user().getNAME() + " set charge " + charge.toString());
			return 1;
		}
		else
		{
			logger.info(cur_env.getCur_user().getNAME() + " failed to set charge " + charge.toString());
			return 0;
		}
	}
	
	@RequestMapping("/getLogs")
	public @ResponseBody Map<String, String> getLogs()
	{
		Map<String, String> ans = MyFile.getFilePath("log/rec");
		
		return ans;
	}
}
