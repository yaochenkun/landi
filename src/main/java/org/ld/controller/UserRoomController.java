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
@RequestMapping("/userRoom")
public class UserRoomController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private GuestMissionService guestService;
	@Autowired
	private ServerService serverService;
	
	private static Logger logger = Logger.getLogger("logRec");
		
	// 多文件上传(add by pq)
    @RequestMapping(value = "/uploadFiles",method = RequestMethod.POST)
    public String uploadFiles(@RequestParam("file") MultipartFile[] file, Integer room_id, HttpServletRequest request){
    	//System.out.println(request.getSession().getServletContext().getRealPath(""));
    	System.out.println("room_id：" + room_id);
    	String roomNumber = roomService.getRoomById(room_id).getROOM_NUMBER();
        // 遍历文件
        for (MultipartFile mul:file){
            System.out.println(mul.getName()+"---"+mul.getContentType()+"---"+mul.getOriginalFilename());
            try {
                if (!mul.isEmpty()){
                    Streams.copy(mul.getInputStream(),new FileOutputStream(request.getSession().getServletContext().getRealPath("") + "/resources/room_pic/" +mul.getOriginalFilename()),true);
                    
                    RoomPic roompic = new RoomPic();
                    roompic.setROOM_ID(room_id);
                    roompic.setTYPE(1);;
                    roompic.setCTIME(null);
                    roompic.setNAME("1");
                    roompic.setTAG("1");
                    roompic.setPATH("/resources/room_pic/" + mul.getOriginalFilename());
                    
                    roomService.insertRoomPic(roompic);
                }
            } catch (IOException e) {
                System.out.println("文件上传失败");
                e.printStackTrace();
            }
        }
        
        return "forward:/views/user/tenant/roomCheck.jsp?rid="+ room_id + "&rNum=" + roomNumber ;
    }
    
    // 获取房间图片路径(add by pq)
	@RequestMapping(value="/getRoomPic",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<RoomPic> getRoomPic(@RequestParam(value="id",required=true) Integer room_id)throws Exception {
		
		System.out.println(room_id);
		List<RoomPic> roomPic = roomService.getPic(room_id);

		return roomPic;
	}
	
	// 根据roomNumber 查询 roomID(add by pq)
	@RequestMapping(value="/getRoomIDByNumber")
	@ResponseBody
	public Room getRoomIDByNumber(@RequestParam(value="roomNumber",required=true) String roomNumber)throws Exception {
		
		System.out.println(roomNumber);
		Room room = roomService.getRoomByNumber(roomNumber);

		return room;
	}
	
	@RequestMapping("/getAllRoom") // 所有房间
	@ResponseBody
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
	@ResponseBody
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
	@ResponseBody
	public Map<String, Object> getOneRoom(HttpSession session, @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		
		int op = dataJson.getIntValue("op");		
		int rid = dataJson.getIntValue("rid");
		String rn = dataJson.getString("rNum");

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
//		guest_info 6
		
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
		case 6:
			Guest guest = guestService.getGuestByRoomNumber(rn);
			ans.put("guest_info", guest);
			break;
		}

		return ans;
	}
	
	@RequestMapping("/getPics")
	@ResponseBody
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
	
	@RequestMapping("/getMeters") // 所有房间表概览
	@ResponseBody
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
	
	@RequestMapping("/roomSearchBill") // 明细流水
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
		
		int eachPage = cur_env.getSettingsInt().get("list_size");
		int recordTotal = serverService.getTotalDailyServiceRow(rn, type);
		int pageTotal = (int)Math.ceil((float)recordTotal/eachPage);

		if(pageNumber > pageTotal)
			pageNumber = pageTotal;
		
		int st = (pageNumber - 1) * eachPage;
		List<DailyService> record = serverService.searchBill(rn, type, st, eachPage);

		ans.put("pageList", record);
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
	
	@RequestMapping("/roomSearchSource") // 明细流水
	@ResponseBody
	public Map<String, Object> searchSourch(HttpSession session, @RequestBody String data){
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
		
		// 1 water 2 power 3 gas
		int type = dataJson.getIntValue("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");
		
		int eachPage = cur_env.getSettingsInt().get("list_size");
		int recordTotal = serverService.getTotalSourcesRow(rn, type);
		int pageTotal = (int)Math.ceil((float)recordTotal/eachPage);

		if(pageNumber > pageTotal)
			pageNumber = pageTotal;
		
		int st = (pageNumber - 1) * eachPage;
		List<Sources> record = serverService.searchSource(rn, type, st, eachPage);
		
		ans.put("pageList", record);
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}

	
	@RequestMapping("/addService")
	@ResponseBody
	public Integer addService(HttpSession session, @RequestBody String data){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			return 0;
		}
		try {
			JSONObject dataJson = JSONObject.parseObject(data);
			DailyService newDS = new DailyService();
			newDS.setCOUNT(dataJson.getInteger("count"));
			newDS.setGUEST_NAME(dataJson.getString("guestName"));
			newDS.setITEM(dataJson.getString("item"));
			newDS.setCOMMENT(dataJson.getString("note"));
			newDS.setROOM_NUMBER(dataJson.getString("roomNumber"));
			newDS.setMONEY(dataJson.getDouble("sum"));
			newDS.setTYPE(dataJson.getInteger("type"));
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			Date date;
			date = ft.parse(dataJson.getString("delivery"));
			newDS.setRTIME(date);
			
			return serverService.addDailyService(newDS);
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/addSource")
	@ResponseBody
	public Integer addSource(HttpSession session, @RequestBody String data){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			return 0;
		}
		try {
			JSONObject dataJson = JSONObject.parseObject(data);
			RoomMeter meter = roomService.getMeter(dataJson.getString("meterNo"));
			Sources newSrc = new Sources();
			newSrc.setROOM_NUMBER(dataJson.getString("roomNumber"));
			newSrc.setGUEST_NAME(dataJson.getString("guestName"));
			newSrc.setCURRENT_DATA(dataJson.getDouble("thisMonthNum"));
			newSrc.setMONEY(dataJson.getDouble("charge"));
			newSrc.setTYPE(dataJson.getInteger("type"));
			newSrc.setMETER(dataJson.getString("meterNo"));
			newSrc.setLAST_DATA(meter.getCUR_VAL());
			newSrc.setCOUNT(newSrc.getCURRENT_DATA() - newSrc.getLAST_DATA());

			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			Date date;
			date = ft.parse(dataJson.getString("meterDate"));
			newSrc.setTIME(date);
			
			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			meter.setCUR_TIME(newSrc.getTIME());
			
			if(serverService.addSources(newSrc) == 1)
			{
				return roomService.updateMeter(meter);
			} else {
				return 0;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/addSourceGas")
	@ResponseBody
	public Integer addSourceGas(HttpSession session, @RequestBody String data){
		CurEnv cur_env = (CurEnv)session.getAttribute("CUR_ENV"); 
		if((cur_env.getCur_user().getAUTH() & (0x01<<cur_env.getAuths().get("rRoom"))) == 0)
		{
			return 0;
		}
		try {
			JSONObject dataJson = JSONObject.parseObject(data);
			RoomMeter meter = roomService.getMeter(dataJson.getString("firstMeterNo"));
			Sources newSrc = new Sources();
			newSrc.setROOM_NUMBER(dataJson.getString("roomNumber"));
			newSrc.setGUEST_NAME(dataJson.getString("guestName"));
			newSrc.setCURRENT_DATA(dataJson.getDouble("firstthisMonthNum"));
			newSrc.setMONEY(dataJson.getDouble("firstCharge"));
			newSrc.setTYPE((Integer)cur_env.getSettingsInt().get("source_gas"));
			newSrc.setMETER(dataJson.getString("firstMeterNo"));
			newSrc.setLAST_DATA(meter.getCUR_VAL());
			newSrc.setCOUNT(newSrc.getCURRENT_DATA() - newSrc.getLAST_DATA());

			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			Date date;
			date = ft.parse(dataJson.getString("meterDate"));
			newSrc.setTIME(date);
			
			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			meter.setCUR_TIME(newSrc.getTIME());
			
			if(serverService.addSources(newSrc) == 1)
			{
				roomService.updateMeter(meter);
			} else {
				return 0;
			}
			
			meter = roomService.getMeter(dataJson.getString("secondMeterNo"));
			newSrc.setCURRENT_DATA(dataJson.getDouble("secondthisMonthNum"));
			newSrc.setMONEY(dataJson.getDouble("secondCharge"));
			newSrc.setTYPE((Integer)cur_env.getSettingsInt().get("source_gas"));
			newSrc.setMETER(dataJson.getString("secondMeterNo"));
			newSrc.setLAST_DATA(meter.getCUR_VAL());
			newSrc.setCOUNT(newSrc.getCURRENT_DATA() - newSrc.getLAST_DATA());

			ft = new SimpleDateFormat ("yyyy-MM-dd");
			date = ft.parse(dataJson.getString("meterDate"));
			newSrc.setTIME(date);
			
			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			meter.setCUR_TIME(newSrc.getTIME());
			
			if(serverService.addSources(newSrc) == 1)
			{
				return roomService.updateMeter(meter);
			} else {
				return 0;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/Model/")
	@ResponseBody
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
