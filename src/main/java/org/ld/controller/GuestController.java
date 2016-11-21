package org.ld.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.Guest;
import org.ld.model.GuestBalance;
import org.ld.model.GuestService;
import org.ld.model.Host;
import org.ld.model.Intern;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.User;
import org.ld.service.GuestMissionService;
import org.ld.service.RoomService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/guest")
public class GuestController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private GuestMissionService guestMissionService;
	
	private static Logger logger = Logger.getLogger("logRec");
	
	/**
	 * @param obj
	 * @param s
	 */
	
	@RequestMapping("/addGuest")
	public Map<String, Object> Model(HttpSession session, @RequestBody String data){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		JSONObject objs = JSON.parseObject(data);
		Guest newGuest = new Guest();
		Host newHost = new Host();
		Intern newIntern = new Intern();
		GuestBalance newBalance = new GuestBalance();
		GuestService newService = new GuestService();
		
		JSONObject obj = objs.getJSONObject("guest");
		try{
			newGuest.setGUEST_NAME(obj.getString("STR_Name"));
			newGuest.setROOM_NUMBER(obj.getString("STR_RommID"));
			newGuest.setROOM_TYPE(roomService.getRoomByNumber(obj.getString("STR_RommID")).getTYPE());
			newGuest.setCONTRACT_NUMBER(obj.getString("STR_ContractID"));
			newGuest.setTEL(obj.getString("STR_Tel"));
			newGuest.setCOMPANY(obj.getString("STR_Company"));
			newGuest.setTITLE(obj.getString("STR_Position"));
			newGuest.setPERSONS(obj.getInteger("INT_GuestNumber"));
			newGuest.setCOMING(obj.getBooleanValue("BOOL_Checkin") ? 1 : 0);
			newGuest.setPARKING(obj.getString("STR_Carport"));
			newGuest.setCAR(null); // need to add ?
			newGuest.setCOMMENT(obj.getString("STR_Remark"));
			newGuest.setCHARGE(obj.getDouble("INT_Rent")); // double ?
			newGuest.setSYS_STATE(0);
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			Date date;
			date = ft.parse(obj.getString("STR_TimeIn"));
			newGuest.setTIMEIN(date);
			date = ft.parse(obj.getString("STR_TimeOut"));
			newGuest.setTIMEOUT(date);
			
			if(guestMissionService.addGuest(newGuest) == 1) {
				newGuest = guestMissionService.getGuestByContract(obj.getString("STR_ContractID"));
			} else {
				ans.remove("State");
				ans.put("State", "Invalid");
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid");
			return ans;
		}
			
		obj = objs.getJSONObject("guest");
		try{
			newHost.setGUEST_ID(newGuest.getID());
			newHost.setHOST_NAME(obj.getString("STR_Name"));
			newHost.setRENT_CHARGE(obj.getDouble("INT_Rent"));
			newHost.setSERVICE_CHARGE(obj.getDouble("INT_Service"));
			newHost.setRETURN_MONEY(obj.getDouble("INT_Return"));
			newHost.setOTHER_CHARGE(obj.getDouble("INT_OTHER")); // other is charge
			newHost.setSYS_STATE(0);
			
			if(guestMissionService.addHost(newHost) == 1) {
				
			} else {
				ans.remove("State");
				ans.put("State", "Invalid");
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid");
			return ans;
		}
		
		obj = objs.getJSONObject("intern");
		try{
			newIntern.setGUEST_ID(newGuest.getID());
			newIntern.setLE_1(obj.getDouble("DOU_LEFirst"));
			newIntern.setLE_2(obj.getDouble("DOU_LESecond"));
			newIntern.setLE_3(obj.getDouble("DOU_LEThird"));
			newIntern.setLE_SERVICE(obj.getDouble("DOU_LEFourth")); // fourth ?
			newIntern.setIN_1(obj.getDouble("DOU_AgentFirst"));
			newIntern.setIN_2(obj.getDouble("DOU_AgentSecond"));
			newIntern.setIN_3(obj.getDouble("DOU_AgentThird"));
			newIntern.setIN_SERVICE(obj.getDouble("DOU_AgentFourth")); // fourth ?
			newIntern.setSYS_STATE(0);
			
			if(guestMissionService.addIntern(newIntern) == 1) {
				
			} else {
				ans.remove("State");
				ans.put("State", "Invalid");
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid");
			return ans;
		}
		
		obj = objs.getJSONObject("balance");
		try{
			newBalance.setGUEST_ID(newGuest.getID());
			
			
			if(guestMissionService.addIntern(newIntern) == 1) {
				
			} else {
				ans.remove("State");
				ans.put("State", "Invalid");
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid");
			return ans;
		}
		
		return ans;
	}
	
	@RequestMapping("/Model/")
	public Map<String, Object> Model(HttpSession session, @RequestBody Integer rid){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		
		
		return ans;
	}
}
