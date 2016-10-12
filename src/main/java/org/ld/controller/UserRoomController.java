package org.ld.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.User;
import org.ld.service.RoomService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userRoom")
public class UserRoomController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	
	private static Logger logger = Logger.getLogger("logRec");
	
	@RequestMapping("/getAllRoom")
	public Map<String, Object> getAllRoom(HttpSession session){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		List<Room> rooms = roomService.getAllRoom();
		ans.put("roomList", rooms);
		
		return ans;
	}
	
	@RequestMapping("/getAllRoomState")
	public Map<String, Object> getAllRoomState(HttpSession session){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		List<RoomState> rooms = roomService.getAllRoomState();
		ans.put("roomStateList", rooms);
		
		return ans;
	}
	
	@RequestMapping("/getRoomInfo")
	public Map<String, Object> getOneRoom(HttpSession session, @RequestBody Integer rid, @RequestBody Integer op){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
//		item_room 0
//		item_furniture 1
//		item_electric 2
//		item_light 3
//		item_curtain 4
//		item_little 5
		
		switch(op)
		{
		case 0:
			Room room = roomService.getRoomById(rid);
			ans.put("room", room);
			break;
		case 1:
			List<RoomItem> item_furniture = roomService.getItems(rid, cur_env.getSettingsInt().get("item_furniture"));
			ans.put("item_funiture", item_furniture);
			break;
		case 2:
			List<RoomItem> item_electric = roomService.getItems(rid, cur_env.getSettingsInt().get("item_electric"));
			ans.put("item_electric", item_electric);
			break;
		case 3:
			List<RoomItem> item_light = roomService.getItems(rid, cur_env.getSettingsInt().get("item_light"));
			ans.put("item_light", item_light);
			break;
		case 4:
			List<RoomItem> item_curtain = roomService.getItems(rid, cur_env.getSettingsInt().get("item_curtain"));
			ans.put("item_curtain", item_curtain);
			break;
		case 5:
			List<RoomItem> item_little = roomService.getItems(rid, cur_env.getSettingsInt().get("item_little"));
			ans.put("item_little", item_little);
			break;
		}

		return ans;
	}
	
	@RequestMapping("/getPics")
	public Map<String, Object> getPics(HttpSession session, @RequestBody Integer rid){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		List<RoomPic> pic = roomService.getPic(rid);
		ans.put("pics", pic);
		return ans;
	}
	
	@RequestMapping("/getMeters")
	public Map<String, Object> getMeters(HttpSession session, @RequestBody Integer rid, @RequestBody Integer type){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		List<RoomMeter> meters = roomService.getMeters(rid, type);
		ans.put("meters" + type, meters);
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
