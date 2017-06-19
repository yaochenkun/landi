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
import org.ld.utils.MD5Builder;
import org.ld.utils.MyFile;
import org.ld.utils.Para;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import org.apache.log4j.Logger;
import org.ld.app.Config;

@Controller
@RequestMapping("/HomeAdmin")
public class AdminController {

	@Autowired
	private UserService userService;

	private static Logger logger = Logger.getLogger("logRec");

	@RequestMapping("/searchUserList/{pageNumber}")
	public @ResponseBody Map<String, Object> showUserInfo(HttpSession session, @PathVariable int pageNumber) {


		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		Map<String, Object> res_map = new HashMap<String, Object>();

		int eachPage = Config.getSettingsInt().get("list_size");
		int pageTotal = (int) Math.ceil((float) userService.totalRow() / eachPage);

		if (pageNumber > pageTotal)
			pageNumber = pageTotal;

		int st = (pageNumber - 1) * eachPage;
		List<User> user_list = userService.selectUserRange(st, eachPage);

		res_map.put("pageList", user_list);
		res_map.put("pageNow", pageNumber);
		res_map.put("pageTotal", pageTotal);
		return res_map;
	}

	@RequestMapping("/addUser")
	public @ResponseBody Integer addUser(@RequestBody String userString, HttpSession session) {
		JSONObject userJson = (JSONObject) JSONObject.parse(userString);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}



		User newUser = new User();

		newUser.setNUM((String) userJson.get("NUM"));
		newUser.setUSERNAME((String) userJson.get("USERNAME"));
		newUser.setNAME((String) userJson.get("NAME"));
		newUser.setDEPART((String) userJson.get("DEPART"));
		newUser.setROLE((Integer) userJson.get("ROLE"));
		newUser.setPASSWD(Config.getSettings().get("default_passwd"));
		newUser.setAUTH(
				Integer.parseInt(Para.ReadParaPair("role", ((Integer) userJson.get("ROLE")).toString(), 0, 2)[1]));
		newUser.setCTIME(new Date());
		newUser.setLTIME(new Date());
		newUser.setSTATE(1);
		newUser.setRESET_PASSWD((byte)0);

		if (userService.insert(newUser) == 1) {
			logger.info(curUser.getNAME() + " create a new user " + newUser.getNAME());
			return 1;
		} else {
			logger.error(curUser.getNAME() + " failed to create the new user " + newUser.getNAME());
			return 0;
		}
	}

	@RequestMapping("/requestDepart")
	public @ResponseBody Map<String, Object> departMenu(HttpSession session) {

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> res = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			res.put("State", "Invalid");
			return res;
		} else {
			res.put("State", "Valid");
		}

		Map<String, List<String>> temp = Para.getParaList("depart");
		List<String> ans = new ArrayList<String>();
		for (String x : temp.keySet()) {
			ans.add(x);
		}

		res.put("departList", ans);

		return res;
	}

	@RequestMapping("/requestRole")
	public @ResponseBody Map<Integer, Object> departRole(HttpSession session) {

		User curUser = (User) session.getAttribute("curUser");
		Map<Integer, Object> res = new HashMap<Integer, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			res.put(-1, "无此权限!");
			return res;
		}

		Map<String, List<String>> temp = Para.getParaList("role");
		Map<Integer, Object> ans = new HashMap<Integer, Object>();
		Iterator<Entry<String, List<String>>> it = temp.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, List<String>> entry = it.next();
			ans.put(Integer.parseInt(entry.getKey()), entry.getValue().get(0));
		}
		return ans;
	}

	@RequestMapping("/requestCap/{role}")
	public @ResponseBody Integer Cap(@PathVariable Integer role, HttpSession session) {

		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}


		String[] ps = Para.ReadParas("role", role.toString());
		return Integer.parseInt(ps[2]);
	}

	@RequestMapping("/changePassword")
	public @ResponseBody Integer changePassword(HttpSession session, @RequestBody String stringPassword) {
		JSONObject passwordJson = (JSONObject) JSONObject.parse(stringPassword);
		String password = passwordJson.getString("password");
		User curUser = (User) session.getAttribute("curUser");
		curUser.setPASSWD(MD5Builder.create((password)));
		curUser.setRESET_PASSWD((byte)1);

		if (userService.updateUserInfo(curUser) == 1) {
			logger.info("Change password of " + curUser.getNAME());
			return 1;
		} else {
			logger.error("Failed to change password of " + curUser.getNAME());
			return 0;
		}
	}

	@RequestMapping("/changeRole")
	public @ResponseBody Integer changeRole(HttpSession session, @RequestBody String data) {

		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}

		JSONObject dataJson = (JSONObject) JSONObject.parse(data);
		Integer id = dataJson.getInteger("id");
		Integer role = dataJson.getInteger("role");
		User user = userService.getUserById(id);
		user.setROLE(role);
		user.setAUTH(
				Integer.parseInt(Para.ReadParaPair("role", role.toString(), 0, 2)[1]));

		if (userService.updateUserInfo(user) == 1) {
			logger.info("Change role of " + user.getNAME());
			return 1;
		} else {
			logger.error("Failed to change role of " + user.getNAME());
			return 0;
		}
	}

	@RequestMapping("/resetPasswd/{user_id}")
	public @ResponseBody Integer resetPasswd(HttpSession session, @PathVariable Integer user_id) {

		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}

		User temp = new User();
		temp.setID(user_id);
		temp.setPASSWD(Config.getSettings().get("default_passwd"));

		if (userService.updateUserInfo(temp) == 1) {
			logger.info(curUser.getNAME() + " reset password of " + user_id);
			return 1;
		} else {
			logger.error(curUser.getNAME() + " failed to reset password of " + user_id);
			return 0;
		}
	}

	@RequestMapping("/forbidUser/{user_id}")
	public @ResponseBody Integer forbidUser(HttpSession session, @PathVariable int user_id) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}

		User temp = new User();
		temp.setID(user_id);
		temp.setSTATE(Config.getSettingsInt().get("forbid_state"));

		if (userService.updateUserInfo(temp) == 1) {
			logger.info(curUser.getNAME() + " disable user " + user_id);
			return 1;
		} else {
			logger.error(curUser.getNAME() + " failed to disable user " + user_id);
			return 0;
		}
	}

	@RequestMapping("/enableUser/{user_id}")
	public @ResponseBody Integer enableUser(HttpSession session, @PathVariable int user_id) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRole"))) == 0) {
			return 0;
		}
		User temp = new User();
		temp.setID(user_id);
		temp.setSTATE(Config.getSettingsInt().get("normal_state"));

		if (userService.updateUserInfo(temp) == 1) {
			logger.info(curUser.getNAME() + " enable user " + user_id);
			return 1;
		} else {
			logger.error(curUser.getNAME() + " failed to enable user " + user_id);
			return 0;
		}
	}

	@RequestMapping("/getRate")
	public @ResponseBody Map<String, String> getRate(HttpSession session) {

		User curUser = (User) session.getAttribute("curUser");
		Map<String, String> res = new HashMap<String, String>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			res.put("State", "Invalid");
			return res;
		} else {
			res.put("State", "Valid");
		}

		return Para.getParaPair("rate", 0, 1);
	}

	@RequestMapping("/setRate")
	public @ResponseBody Integer setRate(HttpSession session, @RequestBody Map<String, String> rate) {
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			return 0;
		}

		if (Para.setPair("rate", rate) == 1) {
			logger.info(curUser.getNAME() + " set rate " + rate.toString());
			return 1;
		} else {
			logger.info(curUser.getNAME() + " failed to set rate " + rate.toString());
			return 0;
		}
	}

	@RequestMapping("/getCharge")
	public @ResponseBody Map<String, String> getCharge(HttpSession session) {

		User curUser = (User) session.getAttribute("curUser");
		Map<String, String> res = new HashMap<String, String>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			res.put("State", "Invalid");
			return res;
		} else {
			res.put("State", "Valid");
		}
		return Para.getParaPair("charge", 0, 1);
	}

	@RequestMapping("/setCharge")
	public @ResponseBody Integer setCharge(HttpSession session, @RequestBody Map<String, String> charge) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			return 0;
		}

		if (Para.setPair("charge", charge) == 1) {
			logger.info(curUser.getNAME() + " set charge " + charge.toString());
			return 1;
		} else {
			logger.info(curUser.getNAME() + " failed to set charge " + charge.toString());
			return 0;
		}
	}
	
	@RequestMapping("/getLaundryPrice")
	public @ResponseBody Map<String, String> getLaundryPrice(HttpSession session) {


		User curUser = (User) session.getAttribute("curUser");
		Map<String, String> res = new HashMap<String, String>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			res.put("State", "Invalid");
			return res;
		} else {
			res.put("State", "Valid");
		}

		return Para.getParaPair("laundry_price", 0, 1);
	}

	@RequestMapping("/setLaundryPrice")
	public @ResponseBody Integer setLaundryPrice(HttpSession session, @RequestBody Map<String, String> laundry_price) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
			return 0;
		}

		if (Para.setPair("laundry_price", laundry_price) == 1) {
			logger.info(curUser.getNAME() + " set laundry_price " + laundry_price.toString());
			return 1;
		} else {
			logger.info(curUser.getNAME() + " failed to set laundry_price " + laundry_price.toString());
			return 0;
		}
	}

	@RequestMapping("/getLogs")
	public @ResponseBody Map<String, String> getLogs() {
		Map<String, String> ans = MyFile.getFilePath("log/rec");

		return ans;
	}
}
