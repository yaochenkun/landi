package org.ld.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.Room;
import org.ld.model.User;
import org.ld.service.RoomService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/UserRoom")
public class UserRoomController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	
	private static Logger logger = Logger.getLogger("logRec");
	
	@RequestMapping("/getAllRoom/")
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
}
