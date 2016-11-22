package org.ld.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.DailyService;
import org.ld.model.Guest;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.Sources;
import org.ld.service.GuestMissionService;
import org.ld.service.ItemService;
import org.ld.service.RoomService;
import org.ld.service.ServerService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;


@Controller
@RequestMapping("/userItem")
public class UserItemController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private GuestMissionService guestService;
	@Autowired
	private ItemService itemService;
	
	private static Logger logger = Logger.getLogger("logRec");
	
	@RequestMapping("/searchItemOverview") // 明细流水
	@ResponseBody
	public Map<String, Object> searchBill(HttpSession session, @RequestBody String data){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		Map<String, Object> ans = new HashMap<String, Object>();
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			ans.put("State", "Invalid");
			return ans;
		} else{
			ans.put("State", "Valid");
		}
		
		JSONObject dataJson = JSONObject.parseObject(data);
		
		int type = dataJson.getIntValue("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");
		int rid = roomService.getRoomByNumber(rn).getID();
		
		int eachPage = cur_env.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotal(rid, type);
		int pageTotal = (int)Math.ceil((float)recordTotal/eachPage);

		if(pageNumber > pageTotal)
			pageNumber = pageTotal;
		
		int st = (pageNumber - 1) * eachPage;
		List<RoomItem> record = itemService.getItems(rid, type, st, eachPage);

		ans.put("pageList", record);
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
}
