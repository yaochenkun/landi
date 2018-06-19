package org.ld.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.print.attribute.standard.MediaSize.Other;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.apache.poi.xslf.model.geom.CosExpression;
import org.ld.app.Config;
import org.ld.model.*;
import org.ld.model.CostLe;
import org.ld.service.GuestMissionService;
import org.ld.service.ItemService;
import org.ld.service.RoomService;
import org.ld.service.ServerService;
import org.ld.service.UserService;
import org.ld.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

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
	@Autowired
	private ItemService itemService;

	private static Logger logger = Logger.getLogger("logRec");

	// 多文件上传
	@RequestMapping(value = "/uploadFiles", method = RequestMethod.POST)
	public String uploadFiles(@RequestParam("file") MultipartFile[] file, Integer room_id, HttpServletRequest request) {
		// System.out.println(request.getSession().getServletContext().getRealPath(""));
		System.out.println("room_id：" + room_id);
		String roomNumber = roomService.getRoomById(room_id).getROOM_NUMBER();
		// 遍历文件
		for (MultipartFile mul : file) {
			System.out.println(mul.getName() + "---" + mul.getContentType() + "---" + mul.getOriginalFilename());
			try {
				if (!mul.isEmpty()) {
					Streams.copy(mul.getInputStream(),
							new FileOutputStream(request.getSession().getServletContext().getRealPath("")
									+ "/resources/room_pic/" + mul.getOriginalFilename()),
							true);

					RoomPic roompic = new RoomPic();
					roompic.setROOM_ID(room_id);
					roompic.setTYPE(1);

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

		return "forward:/views/user/tenant/roomCheck.jsp?rid=" + room_id + "&rNum=" + roomNumber;
	}

	// 获取房间图片路径
	@RequestMapping(value = "/getRoomPic", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public List<RoomPic> getRoomPic(@RequestParam(value = "id", required = true) Integer room_id) throws Exception {

		System.out.println(room_id);
		List<RoomPic> roomPic = roomService.getPic(room_id);

		return roomPic;
	}

	// 根据roomNumber 查询 roomID
	@RequestMapping(value = "/getRoomIDByNumber")
	@ResponseBody
	public Room getRoomIDByNumber(@RequestParam(value = "roomNumber", required = true) String roomNumber)
			throws Exception {

		System.out.println(roomNumber);
		Room room = roomService.getRoomByNumber(roomNumber);

		return room;
	}

	@RequestMapping("/getAllRoom") // 所有房间
	@ResponseBody
	public Map<String, Object> getAllRoom(HttpSession session) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		List<Room> rooms = roomService.getAllRoom();
		ans.put("roomList", rooms);

		return ans;
	}

	@RequestMapping("/getAllRoomState") // 获取所有房间状态信息（租客一览表）
	@ResponseBody
	public Map<String, Object> getAllRoomState(HttpSession session) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//取出全部roomState信息

		//List<RoomState> rooms = roomService.getAllRoomState();
		List<RoomState> rooms = roomService.getTotalRoomState();
		ans.put("roomStateList", rooms);

//		List<Room> type_room = roomService.getAllEditedTypeRoom();
//
//		Map<String,Object> toType = new HashMap<String,Object>() ;
//		Map<String,Object> toState = new HashMap<String,Object>();
//
//		if(type_room != null) {
//			for(Room r : type_room) {
//				toType.put(r.getROOM_NUMBER(),r.getTYPE());
//				toState.put(r.getROOM_NUMBER(),r.getSTATE());
//			}
//		}
//		ans.put("roomType",toType);
//		ans.put("roomState",toState);

		//取出全部room信息
		List<Room> roomInfo = roomService.getAllRoom();
		Map<String,String> toInfo = new HashMap<String,String>();
        for(Room r : roomInfo){
        	toInfo.put(r.getROOM_NUMBER(),r.getTYPE());
		}
		ans.put("roomInfo",toInfo);
		return ans;
	}


	@RequestMapping("/getManageOption") //获取房间管理状况
	@ResponseBody
	public Map<String,Object> getManageOption(HttpSession session ,@RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		String rn = dataJson.getString("rNum");
		Room room = roomService.getRoomByNumber(rn);

		if(room == null) ans.put("State","Invalid");
		else {
			ans.put("RoomType",room.getTYPE());
			ans.put("State",room.getSTATE());
		}

		return ans;

	}

	@RequestMapping("/updateRoomInfo")
	@ResponseBody
	public Integer 	updateRoomInfo(HttpSession session , @RequestBody String data){
		User curUser = (User) session.getAttribute("curUser");
		if((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		String rNum = dataJson.getString("rNum");
		String room_type = dataJson.getString("room_type");
		String owner = dataJson.getString("name").equals("") ?  null: dataJson.getString("name");
		Date time = dataJson.getDate("time");
		String manage = dataJson.getString("manage");
		String replace_room = dataJson.getString("replace_room").equals("") ?  null: dataJson.getString("replace_room") ;
		String com = dataJson.getString("com");

		Room room = roomService.getRoomByNumber(rNum);
		room.setCOMM(com);

		if(room != null){
			if(manage.equals("添加房源") ) {
				room.setTYPE(room_type);
				room.setOWNER_NAME(owner);
				room.setSTATE(1);
				room.setRECEIPT_TIME(time);
				room.setREFUND_TIME(null);
				room.setREPLACE_ROOM(null);


			}else if(manage.equals("替换房源")) {
				room.setREPLACE_ROOM(replace_room);

			}else if(manage.equals("退还房源")) {
				room.setREFUND_TIME(time);   //由于数据库表结构 没有存历史记录  退还后该记录保存 是为了查阅的功能
				room.setSTATE(null);
			}

			roomService.updateRoom(room);
			return 1;
		}
		else return 0;

	}


	@RequestMapping("/getRoomInfo") // 获取房间详细信息
	@ResponseBody
	public Map<String, Object> getOneRoom(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		String op = dataJson.getString("op");
		int rid = dataJson.getIntValue("rid");
		String rn = dataJson.getString("rNum");

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		if(op.equals("room")) {
			Room room = roomService.getRoomById(rid);
			ans.put("room", room);
		} else if(op.equals("guest")) {
			Guest guest = guestService.getGuestByRoomNumber(rn);
			ans.put("guest_info", guest);
		} else {
			String type = dataJson.getString("type");
			int pageNumber = dataJson.getIntValue("pageNum");

			int eachPage = Config.getSettingsInt().get("list_size");
			int recordTotal = itemService.totalItemByRoomType(rid, type);
			int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

			if (recordTotal != 0) {
				if (pageNumber > pageTotal)
					pageNumber = pageTotal;

				int st = (pageNumber - 1) * eachPage;
				List<RoomItem> record = roomService.getItems(rid, op, st, eachPage);

				ans.put("pageList", record);
			}

			ans.put("pageNow", pageNumber);
			ans.put("pageTotal", pageTotal);
			ans.put("recordTotal", recordTotal);
		}

		return ans;
	}

	@RequestMapping("getRoomManageInfo")
	@ResponseBody
	public Map<String , Object> getRoomManageInfo(HttpSession session , @RequestBody String data) {

		Map<String , Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject datajson = JSONObject.parseObject(data);
		String rNum = datajson.getString("rNum");
		String roomType = datajson.getString("rType");
		Integer pageNow = datajson.getInteger("pageNow");

		System.out.println(rNum);
		System.out.println(roomType);

		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = roomService.getTotalRoom(rNum,roomType);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if(recordTotal != 0) {
			if(pageNow > pageTotal) pageNow = pageTotal;

			int st = (pageNow - 1) * eachPage;
			List<Room> room = roomService.searchRoom(rNum,roomType,st,eachPage);
			ans.put("pageList",room);
		}
		System.out.println(recordTotal);

		ans.put("pageTotal",pageTotal);
		ans.put("pageNow",pageNow);
		ans.put("recordTotal",recordTotal);

		return ans;
	}

	@RequestMapping("/getAllRoomManageInfo")  //获取所有房源管理信息
	@ResponseBody
	public Map<String,Object> getAllRoomManageInfo(HttpSession session , @RequestBody String data) {
		Map<String ,Object> ans = new HashMap<>();
		User curUser = (User) session.getAttribute("curUser");
		if((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State","Invalid");
		}
		else ans.put("State","Valid");

		JSONObject dataJson = JSONObject.parseObject(data);
		String rnum = dataJson.getString("rNum");
		String type = dataJson.getString("type");

		List<Room> rooms = roomService.searchAllRoom(rnum,type);
		ans.put("dataList",rooms);

		return ans;
	}


	@RequestMapping("/getAllExpenseInfo")  //获取所有LE承担费用信息
	@ResponseBody
	public Map<String,Object> getAllExpenseInfo(HttpSession session , @RequestBody String data) {
		Map<String ,Object> ans = new HashMap<>();
		User curUser = (User) session.getAttribute("curUser");
		if((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State","Invalid");
		}
		else ans.put("State","Valid");

		JSONObject dataJson = JSONObject.parseObject(data);
		String rnum = dataJson.getString("rNum");
		String type = dataJson.getString("type");

		List<CostLe> costs = roomService.searchAllExpense(rnum,type);
		ans.put("dataList",costs);

		return ans;
	}

	@RequestMapping("getExpenseInfo")  //获取LE承担费用信息
	@ResponseBody
	public Map<String , Object> getExpenseInfo(HttpSession session , @RequestBody String data) {

		Map<String , Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject datajson = JSONObject.parseObject(data);
		String rNum = datajson.getString("rNum");
		String roomType = datajson.getString("rType");
		Integer pageNow = datajson.getInteger("pageNow");

		System.out.println(rNum);
		System.out.println(roomType);

		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = roomService.getTotalExpense(rNum,roomType);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if(recordTotal != 0) {
			if(pageNow > pageTotal) pageNow = pageTotal;

			int st = (pageNow - 1) * eachPage;
			List<CostLe> expense = roomService.searchExpense(rNum,roomType,st,eachPage);
			ans.put("pageList",expense);
		}
		System.out.println(recordTotal);

		ans.put("pageTotal",pageTotal);
		ans.put("pageNow",pageNow);
		ans.put("recordTotal",recordTotal);

		return ans;
	}

	@RequestMapping("/addExpenseOfLE") // 添加LE费用
	@ResponseBody
	public Integer addExpenseOfLE(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			return 0;
		}
		try {
			JSONObject dataJson = JSONObject.parseObject(data);
			CostLe newCost = new CostLe();
			newCost.setROOM_NUM(dataJson.getString("rNum"));
			newCost.setPROJECT(dataJson.getString("project"));
			newCost.setCUSTOMER_SERVICE_STAFF(dataJson.getString("service"));
			newCost.setOPERATION_STAFF(dataJson.getString("operation"));
			newCost.setREASON(dataJson.getString("reason"));
			newCost.setCOST(dataJson.getDouble("cost"));
			newCost.setTYPE(dataJson.getString("type"));
			newCost.setGUEST_NAME(dataJson.getString("guest"));
			newCost.setSTATE(1);

			Date date = new Date();
			newCost.setOCCUR_TIME(date);
			return serverService.addExpenseOfLE(newCost);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@RequestMapping("/getPics")
	@ResponseBody
	public Map<String, Object> getPics(HttpSession session, @RequestBody Integer rid) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		List<RoomPic> pic = roomService.getPic(rid);
		ans.put("pics", pic);
		return ans;
	}


	@RequestMapping("/getSourceTotalMeters") // 查所有已入住的房间的room_meter
	@ResponseBody
	public Map<String, Object> getSourceTotalMeters(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String rn = dataJson.getString("rNum");

		List<RoomState> exists = new ArrayList<>();
		int total = 0;
		if(rn.equals("")){
			//从room_state表中读取正在入住的用户
			exists = roomService.getAllRoomState();
			total = exists == null?0:exists.size();
		}else{
			RoomState state = roomService.getCertainRSbyNumber(rn);
			if(state != null){
				exists.add(state);
				total = 1;
			}else{
				total = 0;
				ans.put("recordTotal",0);
				return ans;
			}
		}


		if (total != 0){

			class Model {
				public String num;
				public String guest;
				public String gas_meter_1;
				public String gas_meter_2;
				public Double gas_pre_meterVal_1;
				public Double gas_pre_meterVal_2;
				public Integer gas_month_1;
				public Integer gas_month_2;
				public Double gas_fare_1;
				public Double gas_fare_2;
				public Integer gas_step_1;
				public Integer gas_step_2;
				public String elec_meter;
				public Double elec_pre_meterVal;
				public Integer elec_month;
				public Double elec_fare;
				public Integer elec_step;
				public String water_meter;
				public Double water_pre_meterVal;
				public Integer water_month;
				public Double water_fare;
				public Integer water_step;
				public Double total;
			}

			List<Model> Source = new ArrayList<Model>();

			for (RoomState state:
					exists){
				List<RoomMeter> record = roomService.getMeterById(state.getROOM_ID());

				if(record.size() == 4){
					Model temp = new Model();
					temp.num = state.getROOM_NUMBER();
					temp.guest = state.getCUS_NAME();
					temp.total = 0.0;
					int i = 0;

					for(RoomMeter meter:record){
						if(meter.getTYPE().equals("water")){
							temp.water_meter = meter.getMETER_NUMBER();
							temp.water_fare = meter.getMONEY() == null ? 0.0:meter.getMONEY();
							temp.water_month = meter.getMONTH();
							temp.water_pre_meterVal = meter.getCUR_VAL();
							temp.water_step = meter.getSTEP();
							temp.total += temp.water_fare;
						}else if(meter.getTYPE().equals("elec")){
							temp.elec_meter = meter.getMETER_NUMBER();
							temp.elec_fare = meter.getMONEY() == null ? 0.0:meter.getMONEY();
							temp.elec_month = meter.getMONTH();
							temp.elec_pre_meterVal = meter.getCUR_VAL();
							temp.elec_step = meter.getSTEP();
							temp.total += temp.elec_fare;
						}else if(meter.getTYPE().equals("gas")){
							if(i == 0){
								temp.gas_meter_1 = meter.getMETER_NUMBER();
								temp.gas_fare_1 = meter.getMONEY() == null ? 0.0:meter.getMONEY();
								temp.gas_month_1 = meter.getMONTH();
								temp.gas_pre_meterVal_1 = meter.getCUR_VAL();
								temp.gas_step_1 = meter.getSTEP();
								temp.total += temp.gas_fare_1;

								i++;
							}else{
								temp.gas_meter_2 = meter.getMETER_NUMBER();
								temp.gas_fare_2 = meter.getMONEY() == null ? 0.0:meter.getMONEY();
								temp.gas_month_2 = meter.getMONTH();
								temp.gas_pre_meterVal_2 = meter.getCUR_VAL();
								temp.gas_step_2 = meter.getSTEP();
								temp.total += temp.gas_fare_2;
							}
						}
					}
					Source.add(temp);
				}else{
					System.out.println("getSourceTotalMeters : error");
				}
			}

			ans.put("pageList", Source);
			ans.put("recordTotal",Source.size());

		}
		return ans;

	}

	@RequestMapping("/getRoomMeters") // 查water elec room_meter
	@ResponseBody
	public Map<String, Object> getRoomMeters(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");
		Integer rid = 0;
		if(rn.equals("") == false)
		{
			if(roomService.getRoomByNumber(rn) != null){
				rid = roomService.getRoomByNumber(rn).getID();
			}
			else{
				ans.put("recordTotal", 0);
				return ans;
			}
		}

		int eachPage = Config.getSettingsInt().get("list_size");
//		int recordTotal = roomService.getRoomMeterRow(rid,type);
//		//有问题
//		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
//
//		if (recordTotal != 0) {
//			if (pageNumber > pageTotal)
//				pageNumber = pageTotal;
//
//			int st = (pageNumber - 1) * eachPage;
//			List<RoomMeter> record = roomService.getMeters(rid, type, st, eachPage);
//
//			ans.put("pageList", record);
//
////			从room_state表中读取正在入住的用户名和房间id
//			List<RoomState> exists = roomService.getAllRoomState();
//			Map<Integer,String> table = new HashMap<>();
//			for (RoomState roomstate:
//				 exists) {
//				table.put(roomstate.getROOM_ID(),roomstate.getCUS_NAME());
//			}
//			ans.put("table",table);
//		}

//			从room_state表中读取正在入住的用户名和房间id
		List<RoomState> exists = roomService.getAllRoomState();
		int total = exists == null?0:exists.size();
		int meterTotal = roomService.getRoomMeterRow(rid,type);
		List<RoomMeter> record = roomService.getMeters(rid, type, 0, meterTotal);

		if (total != 0){
			Map<Integer,String> guest = new HashMap<>();
			Map<Integer,String> number = new HashMap<>();

			for (RoomState roomstate:
					exists) {
				guest.put(roomstate.getROOM_ID(),roomstate.getCUS_NAME());
				number.put(roomstate.getROOM_ID(),roomstate.getROOM_NUMBER());
			}
			ans.put("guest",guest);
			ans.put("number",number);

//			roommeter中未入住的信息去除
			Iterator<RoomMeter> it = record.iterator();
			while(it.hasNext()){
				RoomMeter meter = it.next();
				int i = 0;
				for (RoomState state:
						exists){
					if(meter.getROOM_ID().equals(state.getROOM_ID())){
						i = 1;
						break;
					}
				}
				if(i == 0){
					it.remove();
				}
			}
			ans.put("pageList", record);

		}
		int recordTotal = record.size();
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);


		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;

	}

	@RequestMapping("/getSourceInfo") // 查source（一行）
	@ResponseBody
	public Map<String, Object> getSourceInfo(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		String num = dataJson.getString("rNum");
		String type = dataJson.getString("type");

		if(type.equals("gas")){
			String meter = dataJson.getString("meterNum");
			Sources source = serverService.getGasSource(num, type,meter);
			ans.put("Source", source);
			return ans;
		}else{
			//获取该room的最近source信息
			Sources source = serverService.getSource(num, type);
			ans.put("Source", source);
			return ans;
		}

	}

//	@RequestMapping("/getGasSourcesInfo") // 查gas source（两行）
//	@ResponseBody
//	public Map<String, Object> getGasSourcesInfo(HttpSession session, @RequestBody String data) {
//		User curUser = (User) session.getAttribute("curUser");
//		Map<String, Object> ans = new HashMap<String, Object>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}
//
//		JSONObject dataJson = JSONObject.parseObject(data);
//		String num = dataJson.getString("rNum");
//		List<Sources> source = serverService.getPairSource(num);
//		ans.put("Source", source);
//		return ans;
//	}

	@RequestMapping("/getSourceHistoryInfo") // 查source  历史记录
	@ResponseBody
	public Map<String, Object> getSourceHistoryInfo(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		String num = dataJson.getString("rnum");
		String type = dataJson.getString("type");
		String guest = dataJson.getString("guest");
//		String year = dataJson.getString("year");
		String state = dataJson.getString("state");

		class outputModel {
			public double meter_val;
			public String month;
			public Date readTime;
			public Date updateTime;
			public double fare;
			public String guest;

		}

		List<Sources> source = null;
		if(state.equals("one")){  //该房间最新入住用户信息
			source = serverService.getLookupSource(num, type, guest);
		}
		else if(state.equals("all")){ //该房间入住的所有用户信息
			source = serverService.getHistoryLookupSource( num, type);
		}

		if(source == null){
			return null;
		}

		List<outputModel> out = new ArrayList<>();
		List<String> years = new ArrayList<>();

		for (int i = 0;i<source.size();i++){
			String date = new SimpleDateFormat("yyyy-MM-dd").format(source.get(i).getREADING_TIME());
			years.add(date.split("-")[0]);

			outputModel model = new outputModel();
			model.meter_val = source.get(i).getCUR_MONTH_VAL();
			model.readTime = source.get(i).getREADING_TIME();
			model.updateTime = source.get(i).getUPDATE_TIME();
			model.fare = source.get(i).getMONEY();
			model.guest = source.get(i).getGUEST_NAME();

			if(source.get(i).getLOG() == null){
				System.out.println("source log is null :error");
				model.month = source.get(i).getMONTH() + "月";
			}else if(source.get(i).getLOG().equals("入住")){
				model.month = "入住";
			}else if(source.get(i).getLOG().equals("退租")){
				model.month = "退租";
			}else if(source.get(i).getLOG().equals("计费")){
				model.month = source.get(i).getMONTH() + "月";
			}else{
				model.month = "---";
			}

			out.add(model);
		}

		//获取数据的所有年份
		Set<String> setYears = new HashSet<>();
		setYears.addAll(years);
		years.clear();
		years.addAll(setYears);
		//years 排序
		Collections.sort(years, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				if(o1.compareTo(o2)>0){
					return -1;
				}
				if(o1.compareTo(o2)<0){
					return 1;
				}
				if(o1.compareTo(o2) == 0){
					return 0;
				}
				return 0;
			}
		});
		ans.put("Source", out);
		ans.put("Years",years);

		return ans;

	}

	@RequestMapping("/roomSearchBill") // 明细流水（客房服务）
	@ResponseBody
	public Map<String, Object> searchBill(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int type = dataJson.getIntValue("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");

		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = serverService.getTotalDailyServiceRow(rn, type);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<DailyService> record = serverService.searchBill(rn, type, st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

//	//sourceElec sourcewater js 废弃   gas 使用
//	@RequestMapping("/roomSearchSource") // 查 gas room_meter
//	@ResponseBody
//	public Map<String, Object> searchSourch(HttpSession session, @RequestBody String data) {
//		User curUser = (User) session.getAttribute("curUser");
//		Map<String, Object> ans = new HashMap<String, Object>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}
//
//		JSONObject dataJson = JSONObject.parseObject(data);
//
//		String type = dataJson.getString("type");
//		int pageNumber = dataJson.getIntValue("pageNum");
//		String rn = dataJson.getString("rNum");
//
//		Integer rid = 0;
//		if(rn.equals("") == false)
//		{
//			if(roomService.getRoomByNumber(rn) != null){
//				rid = roomService.getRoomByNumber(rn).getID();
//			}
//			else{
//				ans.put("recordTotal", 0);
//				return ans;
//			}
//		}
//
//		int eachPage = Config.getSettingsInt().get("list_size");
//		int recordTotal = serverService.getTotalSourcesRow(rn, type);
//		System.out.println(recordTotal);
////		int recordTotal = roomService.getRoomMeterRow(roomService.getRoomByNumber(rn).getID().toString(),type);
//		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
//
//		if (recordTotal != 0) {
//			if (pageNumber > pageTotal)
//				pageNumber = pageTotal;
//
//			int st = (pageNumber - 1) * eachPage;
//			List<Sources> record = serverService.searchSource(rn, type, st, eachPage);
//
//			ans.put("pageList", record);
//		}
//
//		ans.put("pageNow", pageNumber);
//		ans.put("pageTotal", pageTotal);
//		ans.put("recordTotal", recordTotal);
//
//		return ans;
//	}

	@RequestMapping("/addService") // 添加客房服务
	@ResponseBody
	public Integer addService(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wDaily"))) == 0) {
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
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date;
			date = ft.parse(dataJson.getString("delivery"));
			newDS.setRTIME(date);
			
			return serverService.addDailyService(newDS);
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@RequestMapping("/addSource") // 添加水费电费
	@ResponseBody
	public Integer addSource(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wDaily"))) == 0) {
			return 0;
		}
		try{
			//增加source
			JSONObject dataJson = JSONObject.parseObject(data);
			Sources newSrc = new Sources();
			newSrc.setROOM_NUMBER(dataJson.getString("rNum"));
			newSrc.setGUEST_NAME(dataJson.getString("guest"));

			newSrc.setTYPE(dataJson.getString("type"));
			newSrc.setMETER(dataJson.getString("rNum"));
			newSrc.setCUR_MONTH_VAL(dataJson.getDouble("meter"));
			Date readDate = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("readDate"));
			newSrc.setUPDATE_TIME(readDate);
			Date readTime = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("readTime"));
			newSrc.setREADING_TIME(readTime);
			newSrc.setSYS_STATE(1);
			newSrc.setMONTH(dataJson.getInteger("month"));

			// update room_Meter
			RoomState state = roomService.getCertainRSbyRoomNumber(dataJson.getString("rNum"));
			RoomMeter meter =roomService.getMeter(state.getID(),dataJson.getString("type"));

			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());

			//当前表数-上月表数 = 这月使用表数 并计费
			Double meter_val = meter.getCUR_VAL();
			if(meter_val == null){
				meter_val = 0.0;
			}

			Map<String,Object> ans = SourceFare.sourceFare(dataJson.getDouble("meter")-meter_val,dataJson.getString("type"));
			newSrc.setMONEY(new Double(ans.get("count").toString()));
			newSrc.setLOG("计费");

			meter.setCUR_VAL(dataJson.getDouble("meter"));
			meter.setMONTH(dataJson.getInteger("month"));
			meter.setSTEP(new Integer(ans.get("step").toString()));

			double pre_money = 0.0;
			if(meter.getMONEY() != null) pre_money = meter.getMONEY();
			meter.setMONEY(pre_money + new Double(ans.get("count").toString()));

			if(serverService.addSources(newSrc) == 1 && roomService.updateRoomMeter(meter)==1){
				return 1;
			}
			else return 0;
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}


	}

	@RequestMapping("/addSourceGas") // 添加燃气费
	@ResponseBody
	public Integer addSourceGas(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wDaily"))) == 0) {
			return 0;
		}

		try{
			JSONObject dataJson = JSONObject.parseObject(data);
			Sources srcOne = new Sources();

			srcOne.setROOM_NUMBER(dataJson.getString("rNum"));
			srcOne.setGUEST_NAME(dataJson.getString("guest"));
			srcOne.setMETER(dataJson.getString("meterNum"));
			srcOne.setTYPE(dataJson.getString("type"));
			srcOne.setCUR_MONTH_VAL(dataJson.getDouble("meter"));
			Date readDate = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("readDate"));
			srcOne.setUPDATE_TIME(readDate);
			Date readTime = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("readTime"));
			srcOne.setREADING_TIME(readTime);
			srcOne.setSYS_STATE(1);
			srcOne.setMONTH(dataJson.getInteger("month"));

			//update room_meter
			RoomState state = roomService.getCertainRSbyRoomNumber(dataJson.getString("rNum"));
			//根据 roomID 和 meternum 查找roomMeter
			RoomMeter meter =roomService.getGasMeter(state.getID(),dataJson.getString("type"),dataJson.getString("meterNum"));
			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());

			//当前表数-上月表数 = 这月使用表数 并计费
			Double meter_val = meter.getCUR_VAL();
			if(meter_val == null){
				meter_val = 0.0;
			}

			Map<String,Object> ans = SourceFare.sourceFare(dataJson.getDouble("meter")-meter_val,dataJson.getString("type"));
			srcOne.setMONEY(new Double(ans.get("count").toString()));
			srcOne.setLOG("计费");

			meter.setCUR_VAL(dataJson.getDouble("meter"));
			meter.setMONTH(dataJson.getInteger("month"));
			meter.setSTEP(new Integer(ans.get("step").toString()));

			double pre_money = 0.0;
			if(meter.getMONEY() != null) pre_money = meter.getMONEY();
			meter.setMONEY(pre_money + new Double(ans.get("count").toString()));

			if(serverService.addSources(srcOne) == 1 && roomService.updateRoomMeter(meter)==1){
				return 1;
			}
			else return 0;

		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}

	}
	
	@RequestMapping("/searchWash") // roomNum为null时，查询所有记录      //liyidan 新增返回合计数值
	@ResponseBody
	public Map<String, Object> searchWash(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		try{
			int pageNumber = dataJson.getIntValue("pageNum");
			String roomNum = dataJson.getString("roomNum");
			String date = dataJson.getString("date");

			//Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("date"));
			int eachPage = Config.getSettingsInt().get("list_size");
			int recordTotal = roomService.totalLaundry(roomNum, date);
			int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
	
			if (recordTotal != 0) {
				if (pageNumber > pageTotal)
					pageNumber = pageTotal;
	
				int st = (pageNumber - 1) * eachPage;
				List<Laundry> record = roomService.getLaundry(roomNum,date, st, eachPage);
	
				ans.put("pageList", record);

				//计算所有费用总和
				List<Laundry> allRecord = roomService.getLaundry(roomNum,date,0, recordTotal);

				Integer sum = 0;
				for(Laundry d : allRecord){
					sum += d.getTOTAL_PRICE();
				}
				ans.put("totalPrice",sum);
			}
			
			ans.put("pageNow", pageNumber);
			ans.put("pageTotal", pageTotal);
			ans.put("recordTotal", recordTotal);
		}catch(Exception e){
			logger.error(e.getCause());
		}

		return ans;
	}
	
	@RequestMapping("/searchAllWashes") // 按房间号+时间查询所有车费信息(一组)
	@ResponseBody
	public Map<String, Object> searchAllWashes(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");

		List<Laundry> allRecord = roomService.getAllWashes(roomNum, date);
		ans.put("dataList", allRecord);
		return ans;
	}
	
	@RequestMapping("/addWash")   // 添加洗衣单收费记录
	@ResponseBody
	public Integer addWash(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			String roomNum = dataJson.getString("roomNum");
			if(roomNum == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int id = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Date occurTime = dataJson.getDate("date");

			Laundry nL = new Laundry();
			nL.setDATE(occurTime);
			nL.setROOM_NUM(dataJson.getString("roomNum"));
			nL.setGUEST_ID(id);
			nL.setGUEST_NAME(guestName);
			nL.setCLOTHES(dataJson.getString("clothes"));
			nL.setOTHER(dataJson.getString("other"));
			nL.setTOTAL_PRICE(dataJson.getInteger("totalPrice"));
			nL.setCOUNT(dataJson.getInteger("count"));
			nL.setOCCUR_TIME(occurTime);
			Date importTime = new Date();
			nL.setIMPORT_TIME(importTime);
			nL.setEDIT_TIME(importTime);
			
			return roomService.addWash(nL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/updateWashById")   // 更新洗衣单收费记录
	@ResponseBody
	public Integer updateWashById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			String roomNum = dataJson.getString("roomNum");
			if(roomNum == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int gid = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Date occurTime = dataJson.getDate("date");

			Laundry nL = roomService.getWashById(dataJson.getInteger("id"));
			nL.setROOM_NUM(roomNum);
			nL.setGUEST_ID(gid);
			nL.setGUEST_NAME(guestName);
			nL.setDATE(occurTime);
			nL.setCLOTHES(dataJson.getString("clothes"));
			nL.setOTHER(dataJson.getString("other"));
			nL.setTOTAL_PRICE(dataJson.getInteger("totalPrice"));
			nL.setCOUNT(dataJson.getInteger("count"));
			nL.setOCCUR_TIME(occurTime);
			nL.setEDIT_TIME(new Date());
			
			return roomService.updateWash(nL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/getLaundryPrice")
	public @ResponseBody Map<String, String> getLaundryPrice(HttpSession session) {

		return Para.getParaPair("laundry_price", 0, 1);
	}
	
	@RequestMapping("/searchFares") // 按房间号+时间查询车费信息(一组)
	@ResponseBody
	public Map<String, Object> searchFares(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		int year = Integer.parseInt(date.substring(0,4));
		int mon = Integer.parseInt(date.substring(5));
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.totalShuttleBus(roomNum, year, mon);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<ShuttleBus> record = roomService.getShuttleBus(roomNum, year, mon, st, eachPage);

			//总计
			int sum = 0;
			List<ShuttleBus> allRecord = roomService.getShuttleBus(roomNum, year, mon, 0, recordTotal);
			for (ShuttleBus s : allRecord){
				sum += s.getTOTAL();
			}

			ans.put("dataList", record);
			ans.put("totalPrice",sum);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/searchAllFares") // 按房间号+时间查询所有车费信息(一组)
	@ResponseBody
	public Map<String, Object> searchAllFares(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		int year = Integer.parseInt(date.substring(0,4));
		int mon = Integer.parseInt(date.substring(5));
		List<ShuttleBus> allRecord = roomService.getAllShuttleBus(roomNum, year, mon);
		ans.put("dataList", allRecord);
		return ans;
	}
	
	@RequestMapping("/searchFare") // 按房间号+时间查询车费信息(单个)
	@ResponseBody
	public Map<String, Object> searchFare(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		int year = Integer.parseInt(date.substring(0,4));
		int mon = Integer.parseInt(date.substring(5));
		Guest guest = guestService.getGuestByRoomNumber(roomNum);
		if(guest == null) {
			ans.put("record", null);
			ans.put("unitPrice", roomService.getFareUnitPrice(roomNum));
			return ans;
		}
		
		ShuttleBus record = roomService.getCertainShuttleBus(roomNum, guest.getID(), year, mon);
		ans.put("record", record);
		ans.put("unitPrice", roomService.getFareUnitPrice(roomNum));
		
		return ans;
	}
	
	@RequestMapping("/searchFareById") // 按房间号+时间查询车费信息(单个)
	@ResponseBody
	public Map<String, Object> searchFareById(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		Integer id= dataJson.getInteger("id");
		ShuttleBus record = roomService.getShuttleBusById(id);
		ans.put("record", record);
		ans.put("unitPrice", roomService.getFareUnitPrice(record.getROOM_NUM()));
		
		return ans;
	}
	
	@RequestMapping("/addFare") // 添加车费记录
	@ResponseBody
	public Integer addFare(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			String roomNum = dataJson.getString("roomNum");
			String date = dataJson.getString("date");
			int year = Integer.parseInt(date.substring(0,4));
			int mon = Integer.parseInt(date.substring(5));
			String othersName = dataJson.getString("othersName");
			
			if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int id = guest.getID();
			ShuttleBus sb = roomService.getCertainShuttleBus(roomNum, id, year, mon);
			
			if(sb == null) //先试探查询，若以前没有则为第一次新来的，先增加到数据库
			{	
				//初次生成通勤车记录
				sb = new ShuttleBus();
				sb.setYEAR(year);
				sb.setMONTH(mon);
				sb.setROOM_NUM(roomNum);
				sb.setGUEST_NAME(guest.getGUEST_NAME());
				sb.setGUEST_ID(id);

				Calendar calendar = Calendar.getInstance(); //构建发生时间
				calendar.set(Calendar.YEAR, year);
				calendar.set(Calendar.MONTH, mon - 1);
				calendar.set(Calendar.DATE, 1);
				calendar.set(Calendar.HOUR, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);
				Date occurTime = calendar.getTime();
				sb.setOCCUR_TIME(occurTime);
				Date importTime = new Date();
				sb.setIMPORT_TIME(importTime);
				sb.setEDIT_TIME(importTime);
				roomService.addShuttleBus(sb);
				sb = roomService.getCertainShuttleBus(roomNum, id, year, mon);
			}
			
			JSONArray obj = dataJson.getJSONArray("perRecord");
			int totalDay = 0;
			for(int i = 0; i < obj.size(); i++){

				JSONObject obj2 = obj.getJSONObject(i);
				Integer selection = obj2.getInteger("selection");
				if(selection == 1) totalDay++;

				switch(obj2.getInteger("day"))
				{
					case 1:
						sb.setFIRST(selection);
						break;
					case 2:
						sb.setSECOND(selection);
						break;
					case 3:
						sb.setTHIRD(selection);
						break;
					case 4:
						sb.setFOURTH(selection);
						break;
					case 5:
						sb.setFIFTH(selection);
						break;
					case 6:
						sb.setSIXTH(selection);
						break;
					case 7:
						sb.setSEVENTH(selection);;
						break;
					case 8:
						sb.setEIGHTH(selection);
						break;
					case 9:
						sb.setNINTH(selection);
						break;
					case 10:
						sb.setTENTH(selection);
						break;
					case 11:
						sb.setELEVENTH(selection);
						break;
					case 12:
						sb.setTWELFTH(selection);
						break;
					case 13:
						sb.setTHIRTEENTH(selection);
						break;
					case 14:
						sb.setFOURTEENTH(selection);
						break;
					case 15:
						sb.setFIFTEENTH(selection);
						break;
					case 16:
						sb.setSIXTEENTH(selection);
						break;
					case 17:
						sb.setSEVENTEENTH(selection);
						break;
					case 18:
						sb.setEIGHTEENTH(selection);
						break;
					case 19:
						sb.setNINETEENTH(selection);
						break;
					case 20:
						sb.setTWENTIETH(selection);
						break;
					case 21:
						sb.setTWENTY_FIRST(selection);
						break;
					case 22:
						sb.setTWENTY_SECOND(selection);
						break;
					case 23:
						sb.setTWENTY_THIRD(selection);
						break;
					case 24:
						sb.setTWENTY_FOURTH(selection);
						break;
					case 25:
						sb.setTWENTY_FIFTH(selection);
						break;
					case 26:
						sb.setTWENTY_SIXTH(selection);
						break;
					case 27:
						sb.setTWENTY_SEVENTH(selection);
						break;
					case 28:
						sb.setTWENTY_EIGHTH(selection);
						break;
					case 29:
						sb.setTWENTY_NINTH(selection);
						break;
					case 30:
						sb.setTHIRTIETH(selection);
						break;
					case 31:
						sb.setTHIRTY_FIRST(selection);
						break;
				}
			}
			sb.setDAYS(totalDay);
			String curOthersName = sb.getOTHER_PEOPLE();
			if(!"".equals(othersName)) {
				if(!"".equals(curOthersName)) sb.setOTHER_PEOPLE(curOthersName + "，" + othersName);
				else sb.setOTHER_PEOPLE(othersName);
			}

			//设置总价
			int unitPrice = roomService.getFareUnitPrice(sb.getROOM_NUM()); //读取单价
			sb.setTOTAL(totalDay * unitPrice);
			sb.setEDIT_TIME(new Date()); //更新编辑时间
			
			return roomService.updateShuttleBus(sb);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/updateFare") // 更新车费记录
	@ResponseBody
	public Integer updateFare(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			
			//检测房间号是否合法，若合法检查该房间是否有对应的guest，若有获取，若无返回错误码
			String roomNum = dataJson.getString("roomNum");
			if(roomService.getRoomByNumber(roomNum) == null) return 0;
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			
			//获取更新数据
			Integer id = dataJson.getInteger("id");
			ShuttleBus sb = roomService.getShuttleBusById(id);
			String date = dataJson.getString("date");
			int year = Integer.parseInt(date.substring(0,4));
			int mon = Integer.parseInt(date.substring(5));
			String othersName = dataJson.getString("othersName");
			sb.setYEAR(year);
			sb.setMONTH(mon);
			sb.setOTHER_PEOPLE(othersName);
			
			Calendar calendar = Calendar.getInstance(); //构建发生时间
			calendar.set(Calendar.YEAR, year);
			calendar.set(Calendar.MONTH, mon - 1);
			calendar.set(Calendar.DATE, 1);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			Date occurTime = calendar.getTime();
			sb.setOCCUR_TIME(occurTime);
			
			JSONArray obj = dataJson.getJSONArray("perRecord");
			int totalDay = 0;
			for(int i = 0; i < obj.size(); i++){

				JSONObject obj2 = obj.getJSONObject(i);
				Integer selection = obj2.getInteger("selection");
				if(selection == 1) totalDay++;

				switch(obj2.getInteger("day"))
				{
					case 1:
						sb.setFIRST(selection);
						break;
					case 2:
						sb.setSECOND(selection);
						break;
					case 3:
						sb.setTHIRD(selection);
						break;
					case 4:
						sb.setFOURTH(selection);
						break;
					case 5:
						sb.setFIFTH(selection);
						break;
					case 6:
						sb.setSIXTH(selection);
						break;
					case 7:
						sb.setSEVENTH(selection);;
						break;
					case 8:
						sb.setEIGHTH(selection);
						break;
					case 9:
						sb.setNINTH(selection);
						break;
					case 10:
						sb.setTENTH(selection);
						break;
					case 11:
						sb.setELEVENTH(selection);
						break;
					case 12:
						sb.setTWELFTH(selection);
						break;
					case 13:
						sb.setTHIRTEENTH(selection);
						break;
					case 14:
						sb.setFOURTEENTH(selection);
						break;
					case 15:
						sb.setFIFTEENTH(selection);
						break;
					case 16:
						sb.setSIXTEENTH(selection);
						break;
					case 17:
						sb.setSEVENTEENTH(selection);
						break;
					case 18:
						sb.setEIGHTEENTH(selection);
						break;
					case 19:
						sb.setNINETEENTH(selection);
						break;
					case 20:
						sb.setTWENTIETH(selection);
						break;
					case 21:
						sb.setTWENTY_FIRST(selection);
						break;
					case 22:
						sb.setTWENTY_SECOND(selection);
						break;
					case 23:
						sb.setTWENTY_THIRD(selection);
						break;
					case 24:
						sb.setTWENTY_FOURTH(selection);
						break;
					case 25:
						sb.setTWENTY_FIFTH(selection);
						break;
					case 26:
						sb.setTWENTY_SIXTH(selection);
						break;
					case 27:
						sb.setTWENTY_SEVENTH(selection);
						break;
					case 28:
						sb.setTWENTY_EIGHTH(selection);
						break;
					case 29:
						sb.setTWENTY_NINTH(selection);
						break;
					case 30:
						sb.setTHIRTIETH(selection);
						break;
					case 31:
						sb.setTHIRTY_FIRST(selection);
						break;
				}
			}
			sb.setDAYS(totalDay);

			//设置总价
			int unitPrice = roomService.getFareUnitPrice(sb.getROOM_NUM()); //读取单价
			sb.setTOTAL(totalDay * unitPrice);
			sb.setEDIT_TIME(new Date()); //更新编辑时间
			
			return roomService.updateShuttleBus(sb);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/searchWashById") // 根据id号查询洗衣记录
	@ResponseBody
	public Map<String,Object> searchWashById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		
		Map<String, Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			Laundry laundry = roomService.getWashById(id);
			ans.put("record", laundry);
			return ans;
		}catch(Exception e){
			e.printStackTrace();
			return ans;
		}
	}
	
	@RequestMapping("/deleteWash") // 删除洗衣记录
	@ResponseBody
	public Integer deleteWash(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return roomService.deleteWash(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	
	@RequestMapping("/deleteFare") // 删除车费记录
	@ResponseBody
	public Integer deleteFare(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return roomService.deleteShuttleBus(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
//	@RequestMapping("/addMaintain") // 添加维修记录
//	@ResponseBody
//	public Integer addMaintain(HttpSession session,  @RequestBody String data) {
//		JSONObject dataJson = JSONObject.parseObject(data);
//
//		User curUser = (User) session.getAttribute("curUser");
//
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}
//
//		try{
//			Maintain m = new Maintain();
//			Guest g = guestService.getGuestByRoomNumber(dataJson.getString("roomNum"));
//			m.setGUEST_ID(g.getID());
//			m.setCHARGE(dataJson.getDouble("price"));
//			m.setCOMMENT(dataJson.getString("comment"));
//			m.setETIME(dataJson.getDate("expTime")); // YY-MM-DD HH-MM-SS
//			m.setFOLLOW(dataJson.getString("follow"));
//			m.setGUEST_ID(dataJson.getInteger("guestID"));
//			m.setLEVEL(dataJson.getInteger("problemLevel"));
//			m.setPROBLEM(dataJson.getString("problemExist"));
//			m.setPRO_TYPE(dataJson.getString("problemType"));
//			m.setPRO_CAUSE(dataJson.getString("problemReason"));
//			m.setPRO_DETAIL(dataJson.getString("problemDetail"));
//			m.setROOM_NUMBER(dataJson.getString("roomNum"));
//			m.setSTATE(1); //1 unfinish, 0 finish
//			m.setSTIME(dataJson.getDate("maintainTime")); // YY-MM-DD HH-MM-SS
//
//			return roomService.addMaintain(m);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//
//			return 0;
//		}
//	}
	
//	@RequestMapping("/searchMaintainUnfinished") // state 1 : unfinish , 0 finish, null for all; roomNum为null时查询所有记录
//	@ResponseBody
//	public Map<String, Object> searchMaintainUnfinished(HttpSession session, @RequestBody String data) {
//		JSONObject dataJson = JSONObject.parseObject(data);
//
//		User curUser = (User) session.getAttribute("curUser");
//		Map<String, Object> ans = new HashMap<String, Object>();
//
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}
//
//		int pageNumber = dataJson.getIntValue("pageNum");
//		String roomNum = dataJson.getString("roomNum");
//		Date from = dataJson.getDate("from"); // YYYY-MM-DD HH-MM-SS
//		Date to = dataJson.getDate("to");
//		int type = dataJson.getIntValue("type");
//		int cat = dataJson.getIntValue("cat");
//		int state = dataJson.getIntValue("state");
//		int eachPage = Config.getSettingsInt().get("list_size");
//		int recordTotal = roomService.totalMaintain(type, cat, state, roomNum, from, to);
//		System.out.println(recordTotal);
//		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
//
//		if (recordTotal != 0) {
//			if (pageNumber > pageTotal)
//				pageNumber = pageTotal;
//
//			int st = (pageNumber - 1) * eachPage;
//			List<Maintain> record = roomService.getMaintain(type, cat, state, roomNum, st, eachPage, from, to, 0);
//
//			ans.put("dataList", record);
//		}
//
//		ans.put("pageNow", pageNumber);
//		ans.put("pageTotal", pageTotal);
//		ans.put("recordTotal", recordTotal);
//
//		return ans;
//	}
	
	@RequestMapping("/updateMaintain") 
	@ResponseBody
	public Integer updateMaintain(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Maintain m = roomService.getCertainMaintain(dataJson.getIntValue("ID"));
			m.setCOMMENT(dataJson.getString("comment"));
			m.setTIMES(dataJson.getInteger("times"));
			m.setFOLLOW(dataJson.getString("follow"));
			m.setFTIME(dataJson.getDate("fixTime"));
			m.setPAY(dataJson.getBoolean("payState")); // PAY OR NOT 
			m.setLEVEL(dataJson.getInteger("problemLevel"));
			m.setSTATE(dataJson.getInteger("state")); // 1 unfinish, 0 finish
			
			return roomService.updateMaintain(m);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	class sta{
		public Integer total = 0, l1 = 0, l2 = 0, l3 = 0, l4 = 0, uf = 0, uf4 = 0;
		public Map<String, Integer> count = new HashMap<String, Integer>();
		public Map<String, Integer> time = new HashMap<String, Integer>();
	};
	
	public int getIntervalDays(Date startday,Date endday){          
	    if(startday.after(endday)){  
	        Date cal=startday;  
	        startday=endday;  
	        endday=cal;  
	    }          
	    long sl=startday.getTime();  
	    long el=endday.getTime();         
	    long ei=el-sl;             
	    return (int)(ei/(1000*60*60*24));  
	} 
	
	@RequestMapping("/searchMaintainStatic") // state 1 : unfinish , 0 finish, null for all; roomNum为null时查询所有记录
	@ResponseBody
	public Map<String, Object> searchMaintainStatic(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String roomNum = dataJson.getString("roomNum");
		Date from = dataJson.getDate("from"); // YYYY-MM-DD HH-MM-SS
		Date to = dataJson.getDate("to");
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.totalRow();
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			List<Maintain> record = roomService.getMaintain(null, null, null, roomNum, null, null, from, to, 1);
			
			Integer l1 = 0, l2 = 0, l3 = 0, l4 = 0;
			Integer uf = 0, uf4 = 0, total = 0;
			
			Map<String, sta> cal = new HashMap<String, sta>();

			for(Maintain m : record)
			{
				sta m2 = cal.get(m.getROOM_NUMBER());
				if(m2 == null)
				{
					m2 = new sta();
					cal.put(m.getROOM_NUMBER(), m2);
				}
				m2.total ++;
				total ++;
				String key = m.getPRO_TYPE();
				Integer val = m2.count.get(key);
				if(val != null)
					m2.count.put(key,  val + 1);
				else
					m2.count.put(key, 1);
				
				val = m2.time.get(key);
//				if(val != null)
//					m2.time.put(key, val + getIntervalDays(m.getSTIME(), m.getFTIME()));
//				else
//					m2.time.put(key, getIntervalDays(m.getSTIME(), m.getFTIME()));
				
				switch(m.getLEVEL())
				{
				case 1:
					m2.l1 ++;
					m2.uf += m.getSTATE();
					l1 ++;
					uf ++;
					break;
				case 2:
					m2.l2 ++;
					m2.uf += m.getSTATE();
					l2 ++;
					uf ++;
					break;
				case 3:
					m2.l3 ++;
					m2.uf += m.getSTATE();
					l3 ++;
					uf ++;
					break;
				case 4:
					m2.l4 ++;
					m2.uf4 += m.getSTATE();
					l4 ++;
					uf4 ++;
					break;
				}
			}
			
			ans.put("l1", l1);
			ans.put("l2", l1);
			ans.put("l3", l1);
			ans.put("l4", l1);
			ans.put("uf", l1);
			ans.put("uf4", l1);
			ans.put("total", l1);
			ans.put("dataList", cal);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/getCurentGuest")
	@ResponseBody
	public Map<String, Object> getCurentGuest(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		JSONObject dataJson = JSONObject.parseObject(data);
		
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		Integer rid = dataJson.getInteger("rid");
		if(rid != null)
		{
			RoomState rs = roomService.getCertainRSbyID(rid);
			ans.put("Gname", rs.getCUS_NAME());
			ans.put("GID", rs.getCUS_ID());
		}
		else
		{
			String rn = dataJson.getString("rNum");
			RoomState rs = roomService.getCertainRSbyNumber(rn);
			ans.put("Gname", rs.getCUS_NAME());
			ans.put("GID", rs.getCUS_ID());
		}

		return ans;
	}
	
	@RequestMapping("/Model/")
	@ResponseBody
	public Map<String, Object> Model(HttpSession session, @RequestBody Integer rid) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		return ans;
	}
	
	@RequestMapping("/addFlightPicking")
	@ResponseBody
	public Integer addFlightPicking(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		//权限
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		};

		JSONObject dataJson = JSONObject.parseObject(data);
		FlightPicking bean = new FlightPicking();
		String roomNum = dataJson.getString("roomNum");
		if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
		Guest guest = guestService.getGuestByRoomNumber(roomNum);
		if(guest == null) return 0; //检测房间号是否合法
		bean.setROOM_NUMBER(roomNum);
		bean.setGUEST_NAME(dataJson.getString("guestName"));
		bean.setTYPE(dataJson.getString("type"));
		bean.setFLIGHT_NUMBER(dataJson.getString("flight"));
		bean.setPLATE_NUMBER(dataJson.getString("platNum"));
		bean.setPICKER_NAME(dataJson.getString("pick"));
		bean.setPICKER_TELE(dataJson.getString("pickTele"));
		bean.setCONTACT_NAME(dataJson.getString("contact"));
		bean.setCONTACT_TELE(dataJson.getString("contactNum"));
		Date occurTime = dataJson.getDate("time");
		bean.setTIME(occurTime);
		bean.setOCCUR_TIME(occurTime);
		Date importTime = new Date();
		bean.setIMPORT_TIME(importTime);
		bean.setEDIT_TIME(importTime);

		if(roomService.addFlightPicking(bean) == 1) {
			logger.info(curUser.getNAME() + " successfully add a flight picking record " + BeanPrinter.toString(bean));
			return 1;
		} else {
			logger.error(curUser.getNAME() + "failed to add a flight picking record" + BeanPrinter.toString(bean));
			return 0;
		}
	}
	
	
	@RequestMapping("/searchFlightPickingByRoomNumber_Time")
	@ResponseBody
	public Map<String, Object> searchFlightPickingByRoomNumber_Time(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		String time = dataJson.getString("time");
		String roomNumber = dataJson.getString("roomNum");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.getTotalFlightPickingByRoomNumber_Time(roomNumber, time);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int startPage = (pageNumber - 1) * eachPage;
			List<FlightPicking> record = roomService.getFlightPickingByRoomNumber_Time(roomNumber, time, startPage, eachPage);
			System.out.println(record.size());
			ans.put("pageList", record);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
	
	@RequestMapping("/searchAllFlightPickings") // 按房间号+时间查询所有车费信息(一组)
	@ResponseBody
	public Map<String,Object> searchAllFlightPickings(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		}

		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		List<FlightPicking> allRecord = roomService.getAllFlightPickings(roomNum, date);

		ans.put("dataList",allRecord);
		
		return ans;
	}
	
	@RequestMapping("/searchFlightPickingById")
	@ResponseBody
	public Map<String, Object> searchFlightPickingById(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");
			
		FlightPicking record = roomService.getFlightPickingById(id);
		ans.put("record", record);
		
		return ans;
	}
	
	@RequestMapping("/deleteFlightPickingById") // 添加车费记录
	@ResponseBody
	public Integer deleteFlightPickingById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return roomService.deleteFlightPickingById(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/exportFlightPickingById") //
	@ResponseBody
	public Integer exportFlightPickingById(HttpSession session , @RequestBody String data){ //根据数据库中ID号查询此条记录，并生成Excel
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}

		try{
			File temp = new File("excel/flightpicking.xlsx");
			if(temp.exists() && !(temp.delete())){
				return 0;
			}

			ExcelHelper.copy("excel/flightpicking-model.xlsx","excel/flightpicking.xlsx");

			String id = dataJson.getString("id");
			FlightPicking fp = roomService.getFlightPickingById(Integer.parseInt(id));
			if(fp.getTYPE().equals("welcome")){ //接机
				System.out.println("接机-------------------------------------------");
				List<ExcelCell> list = new ArrayList<ExcelCell>();
				ExcelCell ec = new ExcelCell();
				ec.setRow(3);
				ec.setCol(11);
				ec.setContent(fp.getGUEST_NAME());
				list.add(ec);


				ExcelCell ec1 = new ExcelCell();
				ec1.setRow(3);
				ec1.setCol(14);
				ec1.setContent(fp.getFLIGHT_NUMBER());
				list.add(ec1);

				ExcelCell ec2 = new ExcelCell();
				ec2.setRow(4);
				ec2.setCol(14);
				ec2.setContent(fp.getPLATE_NUMBER());
				list.add(ec2);

				ExcelCell ec3 = new ExcelCell();

				ec3.setRow(5);
				ec3.setCol(11);
				ec3.setContent(fp.getPICKER_NAME());
				list.add(ec3);

				ExcelCell ec4 = new ExcelCell();

				ec4.setRow(5);
				ec4.setCol(14);
				ec4.setContent(fp.getPICKER_TELE());
				list.add(ec4);

				ExcelCell ec5 = new ExcelCell();
				ec5.setRow(7);
				ec5.setCol(11);
				ec5.setContent(fp.getCONTACT_NAME());
				list.add(ec5);

				ExcelCell ec6 = new ExcelCell();
				ec6.setRow(7);
				ec6.setCol(14);
				ec6.setContent(fp.getCONTACT_TELE());
				list.add(ec6);

				if(fp.getOCCUR_TIME() != null){
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String str = format.format(fp.getOCCUR_TIME());

					ExcelCell ec7= new ExcelCell();
					ec7.setRow(4); //出发时间
					ec7.setCol(11);
					ec7.setContent(str.split(" ")[1]);
					list.add(ec7);

					ExcelCell ec9 = new ExcelCell();
					ec9.setRow(2);
					ec9.setCol(14);
					ec9.setContent(str.split(" ")[0].split("-")[1]);
					list.add(ec9);

					ExcelCell ec10 = new ExcelCell();
					ec10.setRow(2);
					ec10.setCol(16);
					ec10.setContent(str.split(" ")[0].split("-")[2]);
					list.add(ec10);
				}

				ExcelHelper.write("excel/flightpicking.xlsx",list);
			}else{   //送机
				List<ExcelCell> list = new ArrayList<ExcelCell>();
				ExcelCell ec = new ExcelCell();
				ec.setRow(3);
				ec.setCol(2);
				ec.setContent(fp.getGUEST_NAME());
				list.add(ec);


				ExcelCell ec1 = new ExcelCell();
				ec1.setRow(3);
				ec1.setCol(5);
				ec1.setContent(fp.getFLIGHT_NUMBER());
				list.add(ec1);

				ExcelCell ec2 = new ExcelCell();
				ec2.setRow(4);
				ec2.setCol(5);
				ec2.setContent(fp.getPLATE_NUMBER());
				list.add(ec2);

				ExcelCell ec3 = new ExcelCell();

				ec3.setRow(5);
				ec3.setCol(2);
				ec3.setContent(fp.getPICKER_NAME());
				list.add(ec3);

				ExcelCell ec4 = new ExcelCell();

				ec4.setRow(5);
				ec4.setCol(5);
				ec4.setContent(fp.getPICKER_TELE());
				list.add(ec4);

				ExcelCell ec5 = new ExcelCell();
				ec5.setRow(6);
				ec5.setCol(2);
				ec5.setContent(fp.getCONTACT_NAME());
				list.add(ec5);

				ExcelCell ec6 = new ExcelCell();
				ec6.setRow(6);
				ec6.setCol(5);
				ec6.setContent(fp.getCONTACT_TELE());
				list.add(ec6);

				if(fp.getOCCUR_TIME() != null){
					System.out.println(fp.getOCCUR_TIME().toString());
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String str = format.format(fp.getOCCUR_TIME());
					System.out.println(str);

					ExcelCell ec7= new ExcelCell();
					ec7.setRow(4); //出发时间
					ec7.setCol(2);
					ec7.setContent(str.split(" ")[1]);
					list.add(ec7);

					ExcelCell ec9 = new ExcelCell();
					ec9.setRow(2);
					ec9.setCol(5);
					ec9.setContent(str.split(" ")[0].split("-")[1]);
					list.add(ec9);

					ExcelCell ec10 = new ExcelCell();
					ec10.setRow(2);
					ec10.setCol(7);
					ec10.setContent(str.split(" ")[0].split("-")[2]);
					list.add(ec10);
				}

				ExcelHelper.write("excel/flightpicking.xlsx",list);
			}
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	@RequestMapping("/updateFlightPickingById") // 更新接送机记录
	@ResponseBody
	public Integer updateFlightPickingById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			String roomNum = dataJson.getString("roomNum");
			if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
			if(guestService.getGuestByRoomNumber(roomNum) == null) return 0; //检测该房间目前是否有用户入住
			
			Integer id = dataJson.getInteger("id");
			FlightPicking bean = roomService.getFlightPickingById(id);
			bean.setROOM_NUMBER(roomNum);
			bean.setGUEST_NAME(dataJson.getString("guestName"));
			bean.setTYPE(dataJson.getString("type"));
			bean.setFLIGHT_NUMBER(dataJson.getString("flight"));
			bean.setPLATE_NUMBER(dataJson.getString("platNum"));
			bean.setPICKER_NAME(dataJson.getString("pick"));
			bean.setPICKER_TELE(dataJson.getString("pickTele"));
			bean.setCONTACT_NAME(dataJson.getString("contact"));
			bean.setCONTACT_TELE(dataJson.getString("contactNum"));
			Date occurTime = dataJson.getDate("time");
			bean.setTIME(occurTime);
			bean.setOCCUR_TIME(occurTime);
			bean.setEDIT_TIME(new Date());

			return roomService.updateFlightPicking(bean);
			
		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}
	
	@RequestMapping("/searchGuestName")
	@ResponseBody
	public Map<String, Object> searchGuestName(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		String roomNum = dataJson.getString("roomNum");
			
		Guest guest = guestService.getGuestByRoomNumber(roomNum);
		RoomState roomState = roomService.getCertainRSbyRoomNumber(roomNum);
		if(guest == null) {
			ans.put("guest_NAME", null);
			ans.put("room_STATE", null);
		}
		else {
			ans.put("guest_NAME", guest.getGUEST_NAME());
			ans.put("room_STATE", roomState.getSTATE() == 0 ? "未入住" : "已入住");
		}
		
		return ans;
	}
	//by lyd
	@RequestMapping("/searchStaff")
	@ResponseBody
	public Map<String,Object> searchStaff(HttpSession session, @RequestBody String duty){
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(duty);
		String dt = dataJson.getString("duty");
				
		System.out.println(dt);
		
		List<Staff> staffs = serverService.searchStaff(dt);
		if(staffs == null) 
			ans.put("staffs", null);
		else
			ans.put("staffs", staffs);
				
		return ans;
	}
	
	@RequestMapping("/addTakeaway")   // 添加餐费记录
	@ResponseBody
	public Integer addTakeaway(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			System.out.println("新增餐费");
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法	
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int id = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Date occurTime = dataJson.getDate("time");

			Meal meal = new Meal();
			meal.setOCCUR_TIME(occurTime);
			meal.setROOM_NUM(dataJson.getString("roomNumber"));
			meal.setGUEST_ID(id);
			meal.setGUEST_NAME(guestName);
			meal.setTOTAL_PRICE(dataJson.getDouble("count"));
			meal.setCOMMENT(dataJson.getString("note"));
			meal.setRESTAURANT_NAME(dataJson.getString("res"));
			meal.setPAY_MODE(dataJson.getByte("pay_for"));
			meal.setSTAFF_ID(dataJson.getInteger("staff_id"));
			meal.setSTAFF_NAME(dataJson.getString("staff_name"));
			
			Date importTime = new Date();
			meal.setIMPORT_TIME(importTime);
			meal.setEDIT_TIME(importTime);
			
			return serverService.addTakeaway(meal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/roomSearchMeal") // 明细流水（餐费）
	@ResponseBody 
	public Map<String, Object> roomSearchMeal(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getInteger("pageNum");
		String rn = dataJson.getString("rNum");
		if(rn == null) rn = "";
//		Date date = dataJson.getDate("date");
		String date = dataJson.getString("date");

		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = serverService.getTotalMealRow(rn , date);

		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<Meal> record = serverService.searchMeal(rn,date, st, eachPage);

			ans.put("pageList", record);

			//计算所有费用总和
			List<Meal> allRecord = serverService.searchMeal(rn,date,0, recordTotal);

			Double sum = 0.0;
			for(Meal d : allRecord){
				sum += d.getTOTAL_PRICE();
			}
			ans.put("totalPrice",sum);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
    
		return ans;
	}
	
	@RequestMapping("/deleteMeal") // 删除餐费记录
	@ResponseBody 
	public Integer deleteMeal(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return serverService.deleteMeal(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchMealById") // 根据id号查询餐费记录
	@ResponseBody 
	public Map<String,Object> searchMealById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		
		Map<String, Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			Meal meal = serverService.getMealById(id);
			ans.put("record", meal);
			return ans;
		}catch(Exception e){
			e.printStackTrace();
			return ans;
		}
	}
	
	@RequestMapping("/searchAllMeal") // 按房间号查询所有餐费信息(一组)
	@ResponseBody  
	public Map<String, Object> searchAllMeal(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");	
		String date = dataJson.getString("date");

		List<Meal> allRecord = serverService.getAllMeal(roomNum,date);
		ans.put("dataList", allRecord);		
		return ans;
	}
	
	@RequestMapping("/updateMealById")   // 更新餐费记录
	@ResponseBody 
	public Integer updateMealById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;

			Meal meal = serverService.getMealById(dataJson.getInteger("id"));
        
			meal.setTOTAL_PRICE(dataJson.getDouble("count"));
			meal.setCOMMENT(dataJson.getString("note"));
			meal.setRESTAURANT_NAME(dataJson.getString("res"));
			meal.setPAY_MODE(dataJson.getByte("pay_for"));
			meal.setSTAFF_ID(dataJson.getInteger("staff_id"));
			meal.setSTAFF_NAME(dataJson.getString("staff_name"));
			Date editTime = new Date();
			meal.setEDIT_TIME(editTime);
			meal.setOCCUR_TIME(dataJson.getDate("time"));
			
			return serverService.updateMeal(meal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/addShoeCleaning")   // 添加擦鞋费记录
	@ResponseBody
	public Integer addShoeCleaning(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			System.out.println("新增擦鞋费");
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法	
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int id = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Date occurTime = dataJson.getDate("time");

			ShoesPolishing shoe = new ShoesPolishing();
			shoe.setOCCUR_TIME(occurTime);
			shoe.setROOM_NUM(dataJson.getString("roomNumber"));
			shoe.setGUEST_ID(id);
			shoe.setGUEST_NAME(guestName);
			shoe.setTOTAL_PRICE(dataJson.getDouble("sum"));
			shoe.setCOUNT(dataJson.getInteger("count"));
			shoe.setCOMMENT(dataJson.getString("note"));
			shoe.setPAY_MODE(dataJson.getByte("pay_for"));
		
			//??
			shoe.setSTAFF_ID(0);
			shoe.setSTAFF_NAME("null");
			//
			Date importTime = new Date();
			shoe.setIMPORT_TIME(importTime);
			shoe.setEDIT_TIME(importTime);
			
			return serverService.addShoeCleaning(shoe);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/roomSearchShoeCleaning") // 明细流水（擦鞋费）
	@ResponseBody  
	public Map<String, Object> roomSearchShoeCleaning(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");
		if(rn == null) rn = "";
		String date = dataJson.getString("date");
		
		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = serverService.getTotalShoeCleaningRow(rn,date);
		System.out.println(recordTotal);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<ShoesPolishing> record = serverService.searchShoeCleaning(rn, date,st, eachPage);

			//计算所有费用总和
			List<ShoesPolishing> allRecord = serverService.searchShoeCleaning(rn,date,0,recordTotal);
			double sum = 0.0;
			for (ShoesPolishing s: allRecord) {
				sum += s.getTOTAL_PRICE();
			}

			ans.put("pageList", record);
			ans.put("total",sum);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/deleteShoeCleaning") // 删除餐费记录
	@ResponseBody  
	public Integer deleteShoeCleaning(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return serverService.deleteShoesPolishing(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchShoeCleaningById") // 根据id号查询餐费记录
	@ResponseBody  
	public Map<String,Object> searchShoeCleaningById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		
		Map<String, Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			ShoesPolishing shoe = serverService.getShoesPolishingById(id);
			ans.put("record", shoe);
			return ans;
		}catch(Exception e){
			e.printStackTrace();
			return ans;
		}
	}
	
	@RequestMapping("/updateshoeCleaningById")   // 更新擦鞋收费记录
	@ResponseBody 
	public Integer updateshoeCleaningById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;

			ShoesPolishing shoe = serverService.getShoesPolishingById(dataJson.getInteger("id"));
        
			shoe.setTOTAL_PRICE(dataJson.getDouble("sum"));
			shoe.setCOUNT(dataJson.getInteger("count"));
			shoe.setCOMMENT(dataJson.getString("note"));
			shoe.setPAY_MODE(dataJson.getByte("pay_for"));
			Date editTime = new Date();
			shoe.setEDIT_TIME(editTime);		
			return serverService.updateShoesPolishing(shoe);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchAllShoeCleaning") // 按房间号查询所有擦鞋信息(一组)
	@ResponseBody  
	public Map<String, Object> searchAllShoeCleaning(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");		
		String date = dataJson.getString("date");   //lyd

		List<ShoesPolishing> allRecord = serverService.getAllShoesPolishing(roomNum , date);
		ans.put("dataList", allRecord);		
		return ans;
	}
	
	@RequestMapping("/addShopping")   // 添加代购费记录
	@ResponseBody 
	public Integer addShopping(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			System.out.println("新增代购费");
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法	
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;
			int id = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Date occurTime = dataJson.getDate("time");

			AgentPurchase agent = new AgentPurchase();
			agent.setOCCUR_TIME(occurTime);
			agent.setROOM_NUM(dataJson.getString("roomNumber"));
			agent.setGUEST_ID(id);
			agent.setGUEST_NAME(guestName);
			agent.setGOOD_NAME(dataJson.getString("item"));
			agent.setCOUNT(dataJson.getInteger("count"));
			agent.setCOVER_PRICE(dataJson.getDouble("sum"));
			agent.setSERVICE_PRICE(dataJson.getDouble("tip"));
			agent.setCOMMENT(dataJson.getString("note"));		
			agent.setPAY_MODE(dataJson.getByte("pay_for"));
			agent.setSTAFF_ID(dataJson.getInteger("staff_id"));
			agent.setSTAFF_NAME(dataJson.getString("staff_name"));
			
			Date importTime = new Date();
			agent.setIMPORT_TIME(importTime);
			agent.setEDIT_TIME(importTime);
			
			return serverService.addAgentPurchase(agent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/roomSearchAgentPurchase") // 明细流水（代购费）
	@ResponseBody  
	public Map<String, Object> roomSearchAgentPurchase(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");
		if(rn == null) rn = "";
		String date = dataJson.getString("date");

		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = serverService.getTotalAgentPurchaseRow(rn , date);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<AgentPurchase> agent = serverService.searchAgentPurchase(rn,date, st, eachPage);
			List<AgentPurchase> allAgent = serverService.searchAgentPurchase(rn,date, 0, recordTotal);

			double sum = 0.0;
			for (AgentPurchase a:
				 allAgent) {
				sum += a.getCOVER_PRICE() + a.getSERVICE_PRICE();
			}

			ans.put("pageList", agent);
			ans.put("totalPrice",sum);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/deleteShopping") // 删除餐费记录
	@ResponseBody  
	public Integer deleteShopping(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return serverService.deleteAgentPurchase(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchShoppingById") // 根据id号查询代购费记录
	@ResponseBody  
	public Map<String,Object> searchShoppingById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		
		Map<String, Object> ans = new HashMap<String, Object>();
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			AgentPurchase agent = serverService.getAgentPurchaseById(id);
			ans.put("record", agent);
			return ans;
		}catch(Exception e){
			e.printStackTrace();
			return ans;
		}
	}
	
	@RequestMapping("/updateShoppingById")   // 更新代购鞋收费记录
	@ResponseBody 
	public Integer updateShoppingById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		try{
			System.out.println(data);
			String roomNum = dataJson.getString("roomNumber");
			if(roomNum == null) return 0; //检测房间号是否合法
			Guest guest = guestService.getGuestByRoomNumber(roomNum);
			if(guest == null) return 0;

			AgentPurchase agent = serverService.getAgentPurchaseById(dataJson.getInteger("id"));
			
			agent.setGOOD_NAME(dataJson.getString("item"));
			agent.setCOUNT(dataJson.getInteger("count"));
			agent.setCOVER_PRICE(dataJson.getDouble("sum"));
			agent.setSERVICE_PRICE(dataJson.getDouble("tip"));
			agent.setCOMMENT(dataJson.getString("note"));
			agent.setPAY_MODE(dataJson.getByte("pay_for"));
			agent.setOCCUR_TIME(dataJson.getDate("time"));
			agent.setSTAFF_ID(dataJson.getInteger("staff_id"));
			agent.setSTAFF_NAME(dataJson.getString("staff_name"));
			Date editTime = new Date();
			agent.setEDIT_TIME(editTime);		
			return serverService.updateAgentPurchase(agent);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchAllShopping") // 按房间号查询所有代购信息(一组)
	@ResponseBody  
	public Map<String, Object> searchAllShopping(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");	
		String date = dataJson.getString("date");
		List<AgentPurchase> allRecord = serverService.getAllAgentPurchase(roomNum , date);
		ans.put("dataList", allRecord);	
		return ans;
	}
	
	
	//lyd end
	
	/**
	 * 其它车费
	 */
	@RequestMapping("/addOtherFare")
	@ResponseBody
	public Integer addOtherFare(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		//权限
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		};

		JSONObject dataJson = JSONObject.parseObject(data);
		OtherFare bean = new OtherFare();
		String roomNum = dataJson.getString("roomNum");
		if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
		Guest guest = guestService.getGuestByRoomNumber(roomNum);
		if(guest == null) return 0; //检测该房间内是否有客户
		bean.setROOM_NUM(roomNum);
		bean.setGUEST_ID(guest.getID());
		bean.setGUEST_NAME(dataJson.getString("guestName"));
		bean.setUSAGE_TYPE(dataJson.getString("usageType"));
		bean.setPAY_MODE(dataJson.getByte("payMode"));
		bean.setTOTAL_PRICE(dataJson.getDouble("totalPrice"));
		bean.setSTAFF_NAME(dataJson.getString("staffName")); //注意之后要加入员工的id号
		bean.setCOMMENT(dataJson.getString("comment"));
		bean.setOCCUR_TIME(dataJson.getDate("occurTime"));
		
		Date importTime = new Date();
		bean.setIMPORT_TIME(importTime);
		bean.setEDIT_TIME(importTime);

		if(roomService.addOtherFare(bean) == 1) {
			logger.info(curUser.getNAME() + " successfully add a other fare record " + BeanPrinter.toString(bean));
			return 1;
		} else {
			logger.error(curUser.getNAME() + "failed to add a other fare record" + BeanPrinter.toString(bean));
			return 0;
		}
	}
	
	@RequestMapping("/searchOtherFaresByPage")
	@ResponseBody
	public Map<String, Object> searchOtherFaresByPage(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		String occurTime = dataJson.getString("occurTime");
		String roomNum = dataJson.getString("roomNum");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.getTotalOtherFares(roomNum, occurTime);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int startPage = (pageNumber - 1) * eachPage;
			List<OtherFare> record = roomService.getOtherFaresByPage(roomNum, occurTime, startPage, eachPage);
			List<OtherFare> allRecord = roomService.getOtherFaresByPage(roomNum, occurTime, 0, recordTotal);

			Double sum = 0.0;
			for(OtherFare o : allRecord){
				sum += o.getTOTAL_PRICE();
			}

			ans.put("pageList", record);
			ans.put("totalPrice",sum);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
	
	@RequestMapping("/searchAllOtherFares")
	@ResponseBody
	public Map<String, Object> searchAllOtherFares(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		List<OtherFare> allRecord = roomService.getAllOtherFares(roomNum, date);
		ans.put("dataList", allRecord);
		return ans;
	}
	
	@RequestMapping("/deleteOtherFareById") // 添加车费记录
	@ResponseBody
	public Integer deleteOtherFareById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return roomService.deleteOtherFareById(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/updateOtherFareById") // 更新其它车费记录
	@ResponseBody
	public Integer updateOtherFareById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			String roomNum = dataJson.getString("roomNum");
			if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
			if(guestService.getGuestByRoomNumber(roomNum) == null) return 0; //检测该房间目前是否有用户入住
			
			Integer id = dataJson.getInteger("id");
			OtherFare bean = roomService.getOtherFareById(id);
			
			bean.setUSAGE_TYPE(dataJson.getString("usageType"));
			bean.setPAY_MODE(dataJson.getByte("payMode"));
			bean.setTOTAL_PRICE(dataJson.getDouble("totalPrice"));
			bean.setSTAFF_NAME(dataJson.getString("staffName")); //注意之后要加入员工的id号
			bean.setCOMMENT(dataJson.getString("comment"));
			bean.setOCCUR_TIME(dataJson.getDate("occurTime"));
			bean.setEDIT_TIME(new Date());

			return roomService.updateOtherFare(bean);
			
		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}
	
	@RequestMapping("/searchOtherFareById")
	@ResponseBody
	public Map<String, Object> searchOtherFareById(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");
			
		OtherFare record = roomService.getOtherFareById(id);
		ans.put("record", record);
		
		return ans;
	}
	
	/**
	 * 桶装水费
	 */
	@RequestMapping("/addWaterBill")
	@ResponseBody
	public Integer addWaterBill(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		//权限
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		};

		JSONObject dataJson = JSONObject.parseObject(data);
		DrinkingWater bean = new DrinkingWater();
		String roomNum = dataJson.getString("roomNum");
		if(roomService.getRoomByNumber(roomNum) == null) return 0; //检测房间号是否合法
		Guest guest = guestService.getGuestByRoomNumber(roomNum);
		if(guest == null) return 0; //检测该房间内是否有客户
		bean.setROOM_NUM(roomNum);
		bean.setGUEST_ID(guest.getID());
		bean.setGUEST_NAME(guest.getGUEST_NAME());
		bean.setPAY_MODE(dataJson.getByte("payMode"));	
		bean.setCOMMENT(dataJson.getString("comment"));
		//后期看加不加staff信息
		bean.setOCCUR_TIME(dataJson.getDate("occurTime"));
		Date importTime = new Date();
		bean.setIMPORT_TIME(importTime);
		bean.setEDIT_TIME(importTime);
		
		//读取桶装水限额量
		GuestService gs = guestService.getCertainGuestService(guest.getID(), "barrelwater");
		Integer barrrelLimitCount = gs == null ? 0 : gs.getLECOUNT();
		bean.setBARREL_LIMITCOUNT(barrrelLimitCount);
		
		//读取矿泉水限额量
		gs = guestService.getCertainGuestService(guest.getID(), "bottlewater");
		int bottleLimitCount = gs == null ? 0 : gs.getLECOUNT();
		bean.setBOTTLE_LIMITCOUNT(bottleLimitCount);
		
		//读取上一次gid租客的饮用水记录（为获取剩余桶装水/矿泉水限额量）
		DrinkingWater lastRecord = roomService.getLastDrinkingWater(guest.getID());
		int barrelRemainCount = lastRecord == null ? barrrelLimitCount : lastRecord.getBARREL_REMAINCOUNT(); 
		int bottleRemainCount  = lastRecord == null ? bottleLimitCount : lastRecord.getBOTTLE_REMAINCOUNT();
		bean.setBARREL_REMAINCOUNT(barrelRemainCount);
		bean.setBOTTLE_REMAINCOUNT(bottleRemainCount);
		
		double barrelUnitPrice =  roomService.getDrinkingWaterUnitPrice(roomNum); //从配置文件读取桶装水费单价
		bean.setBARREL_UNITPRICE(barrelUnitPrice);
		
		String waterType = dataJson.getString("waterType"); //桶装水 or 矿泉水
		int count = dataJson.getInteger("count");
		double excessPrice = lastRecord == null ? 0 : lastRecord.getEXCESS_PRICE(); //超出金额
		double unitPrice = 0;
		if("桶装水".equals(waterType)){
			
			bean.setBARREL_COUNT(count);
			unitPrice = barrelUnitPrice;
			
			//计算这次以后剩多少
			if(barrelRemainCount <= 0) {
				excessPrice += count * unitPrice;
				barrelRemainCount -= count;
			}else {
				barrelRemainCount -= count;
				if(barrelRemainCount < 0) 
					excessPrice += Math.abs(barrelRemainCount) * unitPrice;
			}
			bean.setBOTTLE_UNITPRICE(new Double(0));
			bean.setBARREL_REMAINCOUNT(barrelRemainCount);
			bean.setEXCESS_PRICE(excessPrice);
			
		} else{
			
			bean.setBOTTLE_COUNT(count);
			unitPrice = dataJson.getDouble("unitPrice"); //读取用户输入的单价
			
			//计算这次以后剩多少
			if(bottleRemainCount <= 0) {
				excessPrice += count * unitPrice;
				bottleRemainCount -= count;
			}else {
				bottleRemainCount -= count;
				if(bottleRemainCount < 0) 
					excessPrice += Math.abs(bottleRemainCount) * unitPrice;
			}
			bean.setBOTTLE_UNITPRICE(unitPrice);
			bean.setBOTTLE_REMAINCOUNT(bottleRemainCount);
			bean.setEXCESS_PRICE(excessPrice);
		}
		
		if(roomService.addDrinkingWater(bean) == 1) {
			logger.info(curUser.getNAME() + " successfully add a water bill record " + BeanPrinter.toString(bean));
			return 1;
		} else {
			logger.error(curUser.getNAME() + "failed to add a water bill record" + BeanPrinter.toString(bean));
			return 0;
		}
	}
	
	@RequestMapping("/searchWaterBillsByPage")
	@ResponseBody
	public Map<String, Object> searchWaterBillsByPage(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		String occurTime = dataJson.getString("occurTime");
		String roomNum = dataJson.getString("roomNum");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.getTotalDrinkingWaters(roomNum, occurTime);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int startPage = (pageNumber - 1) * eachPage;
			List<DrinkingWater> record = roomService.getDrinkingWatersByPage(roomNum, occurTime, startPage, eachPage);
			ans.put("pageList", record);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
	
	@RequestMapping("/searchAllWaterBills")
	@ResponseBody
	public Map<String, Object> searchAllWaterBills(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		String roomNum = dataJson.getString("roomNum");
		String date = dataJson.getString("date");
		List<DrinkingWater> allRecord = roomService.getAllDrinkingWaters(roomNum, date);
		ans.put("dataList", allRecord);
		return ans;
	}
	
	@RequestMapping("/deleteWaterBillById") // 添加车费记录
	@ResponseBody
	public Integer deleteWaterFillById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			return roomService.deleteWaterBillById(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/updateWaterBillById") // 更新饮用水费记录
	@ResponseBody
	public Integer updateWaterBillById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			
			//获取本记录
			Integer id = dataJson.getInteger("id");
			DrinkingWater bean = roomService.getDrinkingWater(id);

			//更新与本记录相关联的，晚于其IMPORT_TIME之后的所有guest_ID记录的：桶装水量&&限额剩余量、矿泉水量&&限额剩余量&&单价、超出金额
			//暂存该记录的原始数据
			int oriBarrelCount = bean.getBARREL_COUNT();
			int oriBottleCount = bean.getBOTTLE_COUNT();
			double oriExcessPrice = bean.getEXCESS_PRICE();
			
			//更新bean开始  
			//1.获取上一次饮用水费的状态，方便本次记录在它的基础上累加
			DrinkingWater lastRecord = roomService.getLastBeforeDrinkingWater(bean.getGUEST_ID(), bean.getIMPORT_TIME());
			int lastBarrelRemainCount = lastRecord == null ? bean.getBARREL_LIMITCOUNT() : lastRecord.getBARREL_REMAINCOUNT(); 
			int lastBottleRemainCount  = lastRecord == null ? bean.getBOTTLE_LIMITCOUNT() : lastRecord.getBOTTLE_REMAINCOUNT();
			bean.setBARREL_REMAINCOUNT(lastBarrelRemainCount);
			bean.setBOTTLE_REMAINCOUNT(lastBottleRemainCount);
			
			String waterType = dataJson.getString("waterType"); //桶装水 or 矿泉水
			int count = dataJson.getInteger("count");
			double excessPrice = lastRecord == null ? 0 : lastRecord.getEXCESS_PRICE(); //超出金额
			double curUnitPrice = 0;

			//count与总金额的差值
			int barrelCountDiff = 0;
			int bottleCountDiff = 0;
			double excessPriceDiff = 0;
			double excessExtraPriceDiff = 0; //若记录的remain从负到正 需要修正其后第一个
			if("桶装水".equals(waterType)){
				
				bean.setBARREL_COUNT(count);
				bean.setBOTTLE_COUNT(0);
				curUnitPrice =  bean.getBARREL_UNITPRICE(); //从配置文件读取桶装水费单价
				barrelCountDiff = count - oriBarrelCount;

				//计算这次以后剩多少
				if(lastBarrelRemainCount <= 0) {
					excessPrice += count * curUnitPrice;
					lastBarrelRemainCount -= count;
				}else {
					lastBarrelRemainCount -= count;
					if(lastBarrelRemainCount < 0) {
						double price = Math.abs(lastBarrelRemainCount) * curUnitPrice;
						excessPrice += price;
					}
				}
				bean.setBARREL_REMAINCOUNT(lastBarrelRemainCount);
				bean.setEXCESS_PRICE(excessPrice);
				
			} else{
				
				bean.setBOTTLE_COUNT(count);
				bean.setBARREL_COUNT(0);
				curUnitPrice = dataJson.getDouble("unitPrice"); //读取用户输入的单价
				bottleCountDiff = count - oriBottleCount;
				
				//计算这次以后剩多少
				if(lastBottleRemainCount <= 0) {
					excessPrice += count * curUnitPrice;
					lastBottleRemainCount -= count;
				}else {
					lastBottleRemainCount -= count;
					if(lastBottleRemainCount < 0) {
						double price = Math.abs(lastBottleRemainCount) * curUnitPrice;
						excessPrice += price;
					}
				}
				bean.setBOTTLE_UNITPRICE(curUnitPrice);
				bean.setBOTTLE_REMAINCOUNT(lastBottleRemainCount);
				bean.setEXCESS_PRICE(excessPrice);
			}
			bean.setPAY_MODE(dataJson.getByte("payMode"));
			bean.setCOMMENT(dataJson.getString("comment"));
			bean.setEDIT_TIME(new Date());
			
			//计算总金额差异
			excessPriceDiff = excessPrice - oriExcessPrice;
			
			
			//更新bean
			try{
				roomService.updateDrinkingWater(bean);
			}catch(Exception e){
				return 0;
			}

			//更新其它晚于bean的所有记录
			//用barrelCountDiff、bottleCountDiff和excessPriceDiff去更新晚于该记录之后的所有记录对应项信息
			try{
				roomService.updateAfterDrinkingWaters(bean.getGUEST_ID(),
													  bean.getIMPORT_TIME(), 
													  barrelCountDiff, 
													  bottleCountDiff, 
													  excessPriceDiff,
													  new Date());
				
				//若记录的remain从负到正 修正...不想写了
				
			}catch(Exception e){
				return 0;
			}

			return 1;
			
		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}
	
	@RequestMapping("/searchWaterBillById")
	@ResponseBody
	public Map<String, Object> searchWaterBillById(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");
			
		DrinkingWater record = roomService.getDrinkingWater(id);
		ans.put("record", record);
		
		return ans;
	}


	@RequestMapping("/searchRestaurant")
	@ResponseBody
	public Map<String, Integer> searchRestaurant(HttpSession session) {

		return Para.getParaPairInt("restaurant", 0, 1);
	}

//	@RequestMapping("/getRate")
//	public @ResponseBody Map<String, String> getRate(HttpSession session) {
//
//		User curUser = (User) session.getAttribute("curUser");
//		Map<String, String> res = new HashMap<String, String>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			res.put("State", "Invalid");
//			return res;
//		} else {
//			res.put("State", "Valid");
//		}
//
//		return Para.getParaPair("rate", 0, 1);
//	}

	@RequestMapping("/getAllStatistics") //客房费用结算 -- 统计费用
	@ResponseBody
	public Map<String,Object> getAllStatistics(HttpSession session,@RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJSON = JSONObject.parseObject(data);

		String num = dataJSON.getString("rNum");

		//水费
		int waterTotal = serverService.getExactTotalSourcesRow(num,"water");
		List<Sources> waters = serverService.searchExactSource(num,"water",0,waterTotal);

		//电费

		int elecTotal = serverService.getExactTotalSourcesRow(num,"elec");
		List<Sources> elecs = serverService.searchExactSource(num,"elec",0,elecTotal);

		//燃气费

		int gasTotal = serverService.getExactTotalSourcesRow(num,"gas");
		List<Sources> gass = serverService.searchExactSource(num,"gas",0,gasTotal);

		ans.put("waterTotal",waterTotal);
		ans.put("elecTotal",elecTotal);
		ans.put("gasTotal",gasTotal);

		ans.put("waterRecord",waters);
		ans.put("elecsRecord",elecs);
		ans.put("gasRecord",gass);

		return ans;
	}

	@RequestMapping ("exportExpenseToModel")
	@ResponseBody
	public Integer exportExpenseToModel(HttpSession session , @RequestBody String data){
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			return 0;
		}

		JSONObject dataJSON = JSONObject.parseObject(data);
		String name = dataJSON.getString("guest");
		Double water_pre = dataJSON.getDouble("water_pre");
		Double water_cur = dataJSON.getDouble("water_cur");
		Double water_cost = dataJSON.getDouble("water_cost");

		Double elec_pre = dataJSON.getDouble("elec_pre");
		Double elec_cur = dataJSON.getDouble("elec_cur");
		Double elec_cost = dataJSON.getDouble("elec_cost");

		Double gas_pre_1 = dataJSON.getDouble("gas_pre_1");
		Double gas_cur_1 = dataJSON.getDouble("gas_cur_1");
		Double gas_cost_1 = dataJSON.getDouble("gas_cost_1");

		Double gas_pre_2 = dataJSON.getDouble("gas_pre_2");
		Double gas_cur_2 = dataJSON.getDouble("gas_cur_2");
		Double gas_cost_2 = dataJSON.getDouble("gas_cost_2");

		try{
			File file1 = new File("excel/Consumption.xlsx");
			if(file1.exists() &&(!file1.delete())){
				return 0;
			}

			ExcelHelper.copy("excel/Consumption-model.xlsx","excel/Consumption.xlsx");

			List<ExcelCell> list = new ArrayList<ExcelCell>();
			ExcelCell ec = new ExcelCell();
			ec.setRow(6);
			ec.setCol(2);
			ec.setContent(name);
			list.add(ec);

			ExcelCell ec2 = new ExcelCell();
			ec2.setRow(15);
			ec2.setCol(3);
			ec2.setContent(gas_pre_1.toString());
			list.add(ec2);

			ExcelCell ec3 = new ExcelCell();
			ec3.setRow(15);
			ec3.setCol(4);
			ec3.setContent(gas_cur_1.toString());
			list.add(ec3);

			ExcelCell ec4 = new ExcelCell();
			ec4.setRow(15);
			ec4.setCol(5);
			Double temp = gas_cur_1-gas_pre_1;
			ec4.setContent(temp.toString());
			list.add(ec4);

			ExcelCell ec5 = new ExcelCell();
			ec5.setRow(15);
			ec5.setCol(7);
			System.out.println(gas_cost_1.toString());
			ec5.setContent(gas_cost_1.toString());
			list.add(ec5);

			ExcelCell ec6 = new ExcelCell();
			ec6.setRow(16);
			ec6.setCol(3);
			ec6.setContent(gas_pre_2.toString());
			list.add(ec6);

			ExcelCell ec7 = new ExcelCell();
			ec7.setRow(16);
			ec7.setCol(4);
			ec7.setContent(gas_cur_2.toString());
			list.add(ec7);

			ExcelCell ec8 = new ExcelCell();
			ec8.setRow(16);
			ec8.setCol(5);
			temp = gas_cur_2-gas_pre_2;
			ec8.setContent(temp.toString());
			list.add(ec8);

			ExcelCell ec9 = new ExcelCell();
			ec9.setRow(16);
			ec9.setCol(7);
			ec9.setContent(gas_cost_2.toString());
			list.add(ec9);

			ExcelCell ec10 = new ExcelCell();
			ec10.setRow(17);
			ec10.setCol(3);
			ec10.setContent(water_pre.toString());
			list.add(ec10);

			ExcelCell ec11 = new ExcelCell();
			ec11.setRow(17);
			ec11.setCol(4);
			ec11.setContent(water_cur.toString());
			list.add(ec11);

			ExcelCell ec12 = new ExcelCell();
			ec12.setRow(17);
			ec12.setCol(5);
			temp = water_cur - water_pre;
			ec12.setContent(temp.toString());
			list.add(ec12);

			ExcelCell ec13 = new ExcelCell();
			ec13.setRow(17);
			ec13.setCol(7);
			ec13.setContent(water_cost.toString());
			list.add(ec13);
			
			ExcelCell ec14 = new ExcelCell();
			ec14.setRow(18);
			ec14.setCol(3);
			ec14.setContent(elec_pre.toString());
			list.add(ec14);

			ExcelCell ec15 = new ExcelCell();
			ec15.setRow(18);
			ec15.setCol(4);
			ec15.setContent(elec_cur.toString());
			list.add(ec15);

			ExcelCell ec16 = new ExcelCell();
			ec16.setRow(18);
			ec16.setCol(5);
			temp = elec_cur - elec_pre;
			ec16.setContent(temp.toString());
			list.add(ec16);

			ExcelCell ec17 = new ExcelCell();
			ec17.setRow(18);
			ec17.setCol(7);
			ec17.setContent(elec_cost.toString());
			list.add(ec17);

			ExcelHelper.write("excel/Consumption.xlsx",list);

		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}

		return 1;
	}

	//获取擦鞋费
	@RequestMapping("/searchShoeCleaningPrice")
	@ResponseBody
	public Integer searchShoeCleaningPrice(HttpSession session,@RequestBody String data){
		User curUser = (User) session.getAttribute("curUser");
		if((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0){
			return 0;
		}
		System.out.println("consoller");

		JSONObject dataJson = JSONObject.parseObject(data);
		String room = dataJson.getString("roomNum");

		try{                             //房间号输入异常处理
			String key = "擦鞋费_" + room.charAt(0) + "-" +room.substring(1,room.length()-2);
			//System.out.println(key);

			String[] para = Para.ReadParas("charge",key);

			//System.out.println(para[0] + "+" + para[1]);
			return Integer.parseInt(para[1]);
		}catch(Exception e){
			return 0;
		}


	}

	@RequestMapping("/statement")
	@ResponseBody
	public Map<String,Object> getStatement(HttpSession session,@RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJSON = JSONObject.parseObject(data);

		String num = dataJSON.getString("rNum");
		String name = dataJSON.getString("name");
		String date = dataJSON.getString("date");
//		String page = dataJSON.getString("pageNum");


		double sum = 0.0;
		int recordTotal = 0;

		//洗衣费
		List<Laundry> laundrys = roomService.getCertainLaundrys(num,guestService.getGuestByRoomNumber(num).getID(),date);
		for(Laundry laundry :laundrys){
			sum += laundry.getTOTAL_PRICE();
		}
		recordTotal += laundrys.size();
		//餐费
		List<Meal> meals = serverService.getCertainMeals(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(Meal meal :meals){
			sum += meal.getTOTAL_PRICE();
			System.out.println(meal.toString());
		}
		recordTotal += meals.size();

		//饮用水
		List<DrinkingWater> drinkingWaters = roomService.getCertainDrinkingWaters(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(DrinkingWater drinkingWater :drinkingWaters){
			sum += drinkingWater.getEXCESS_PRICE();
		}
		recordTotal += drinkingWaters.size();

		//擦鞋
		List<ShoesPolishing> shoesPolishings = serverService.getCertainShoesPolishings(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(ShoesPolishing shoesPolishing :shoesPolishings){
			sum += shoesPolishing.getTOTAL_PRICE();
		}
		recordTotal += shoesPolishings.size();

		//代购费
		List<AgentPurchase> agentPurchases = serverService.getCertainAgentPurchases(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(AgentPurchase agentPurchase : agentPurchases){
			sum += agentPurchase.getCOVER_PRICE() + agentPurchase.getSERVICE_PRICE();
		}
		recordTotal += agentPurchases.size();

		//车费
		List<ShuttleBus> shuttleBuses = roomService.getCertainShuttleBuses(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(ShuttleBus shuttleBus :shuttleBuses){
			sum += shuttleBus.getTOTAL();
		}
		recordTotal += shuttleBuses.size();

		List<OtherFare> otherFares = roomService.getCertainOtherFares(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(OtherFare otherFare : otherFares){
			sum += otherFare.getTOTAL_PRICE();
		}
		recordTotal += otherFares.size();

		//能源费
		//水费
		List<Sources> waters = serverService.getCertainSources(num,name,"water",date);
//		RoomMeter meter = roomService.getMeter(roomService.getRoomByNumber(num).getID(),"water");
//		double waterSum = meter.getMONEY();
//		sum += meter.getMONEY();
		for(Sources water : waters){
			sum += water.getMONEY();
		}
		recordTotal += waters.size();

		//电费
		List<Sources> elecs = serverService.getCertainSources(num,name,"elec",date);
//		meter = roomService.getMeter(roomService.getRoomByNumber(num).getID(),"elec");
//		double elecSum = meter.getMONEY();
//		sum += meter.getMONEY();
		for(Sources elec : elecs){
			sum += elec.getMONEY();
		}
		recordTotal += waters.size();

		//燃气费
		List<Sources> gass = serverService.getCertainSources(num,name,"gas",date);
//		List<RoomMeter> meters = roomService.getMeters(roomService.getRoomByNumber(num).getID(),"gas",0,2);
//		double gasSum = meters.get(0).getMONEY() + meters.get(1).getMONEY();
//		sum += meter.getMONEY();
		for(Sources gas : gass){
			sum += gas.getMONEY();
		}
		recordTotal += waters.size();


		//LE承担费用
		List<CostLe> costLes = roomService.getCertainCostLes(num,name,date);
		for(CostLe costLe : costLes){
			sum += costLe.getCOST();
		}
		recordTotal += costLes.size();

		ans.put("laundry",laundrys);
		ans.put("meal",meals);
		ans.put("drinkingwater",drinkingWaters);
		ans.put("shoespolishing",shoesPolishings);
		ans.put("agentpurchase",agentPurchases);
		ans.put("shuttlebus",shuttleBuses);
		ans.put("otherfare",otherFares);
		ans.put("watersource",waters);
		ans.put("elecsource",elecs);
		ans.put("gassource",gass);
//		ans.put("watersum",waterSum);
//		ans.put("elecsum",elecSum);
//		ans.put("gassum",gasSum);
		ans.put("costle",costLes);


		ans.put("Total",sum);
		ans.put("recordTotal",recordTotal);

		return ans;
	}

	@RequestMapping("/statementByDay")
	@ResponseBody
	public Map<String,Object> getStatementByDay(HttpSession session,@RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJSON = JSONObject.parseObject(data);

		String num = dataJSON.getString("rNum");
		String name = dataJSON.getString("name");
		String date = dataJSON.getString("date");


		System.out.println(date);
		double sum = 0.0;
		int recordTotal = 0;

		//洗衣费
		List<Laundry> laundrys = roomService.getCertainLaundrysByDay(num,guestService.getGuestByRoomNumber(num).getID(),date);
		for(Laundry laundry :laundrys){
			sum += laundry.getTOTAL_PRICE();
		}
		recordTotal += laundrys.size();
		//餐费
		List<Meal> meals = serverService.getCertainMealsByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(Meal meal :meals){
			sum += meal.getTOTAL_PRICE();
			System.out.println(meal.toString());
		}
		recordTotal += meals.size();

		//饮用水
		List<DrinkingWater> drinkingWaters = roomService.getCertainDrinkingWatersByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(DrinkingWater drinkingWater :drinkingWaters){
			sum += drinkingWater.getEXCESS_PRICE();
		}
		recordTotal += drinkingWaters.size();

		//擦鞋
		List<ShoesPolishing> shoesPolishings = serverService.getCertainShoesPolishingsByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(ShoesPolishing shoesPolishing :shoesPolishings){
			sum += shoesPolishing.getTOTAL_PRICE();
		}
		recordTotal += shoesPolishings.size();

		//代购费
		List<AgentPurchase> agentPurchases = serverService.getCertainAgentPurchasesByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(AgentPurchase agentPurchase : agentPurchases){
			sum += agentPurchase.getCOVER_PRICE() + agentPurchase.getSERVICE_PRICE();
		}
		recordTotal += agentPurchases.size();

		//车费
		List<ShuttleBus> shuttleBuses = roomService.getCertainShuttleBusesByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(ShuttleBus shuttleBus :shuttleBuses){
			sum += shuttleBus.getTOTAL();
		}
		recordTotal += shuttleBuses.size();

		List<OtherFare> otherFares = roomService.getCertainOtherFaresByDay(num,guestService.getGuestByRoomNumber(num).getID().toString(),date);
		for(OtherFare otherFare : otherFares){
			sum += otherFare.getTOTAL_PRICE();
		}
		recordTotal += otherFares.size();

		//能源费
		//水费
		List<Sources> waters = serverService.getCertainSourcesByDay(num,name,"water",date);
//		RoomMeter meter = roomService.getMeter(roomService.getRoomByNumber(num).getID(),"water");
//		double waterSum = meter.getMONEY();
//		sum += meter.getMONEY();
		for(Sources water : waters){
			sum += water.getMONEY();
		}
		recordTotal += waters.size();

		//电费
		List<Sources> elecs = serverService.getCertainSourcesByDay(num,name,"elec",date);
//		meter = roomService.getMeter(roomService.getRoomByNumber(num).getID(),"elec");
//		double elecSum = meter.getMONEY();
//		sum += meter.getMONEY();
		for(Sources elec : elecs){
			sum += elec.getMONEY();
		}
		recordTotal += waters.size();

		//燃气费
		List<Sources> gass = serverService.getCertainSourcesByDay(num,name,"gas",date);
//		List<RoomMeter> meters = roomService.getMeters(roomService.getRoomByNumber(num).getID(),"gas",0,2);
//		double gasSum = meters.get(0).getMONEY() + meters.get(1).getMONEY();
//		sum += meter.getMONEY();
		for(Sources gas : gass){
			sum += gas.getMONEY();
		}
		recordTotal += waters.size();


		//LE承担费用
		List<CostLe> costLes = roomService.getCertainCostLesByDay(num,name,date);
		for(CostLe costLe : costLes){
			sum += costLe.getCOST();
		}
		recordTotal += costLes.size();

		ans.put("laundry",laundrys);
		ans.put("meal",meals);
		ans.put("drinkingwater",drinkingWaters);
		ans.put("shoespolishing",shoesPolishings);
		ans.put("agentpurchase",agentPurchases);
		ans.put("shuttlebus",shuttleBuses);
		ans.put("otherfare",otherFares);
		ans.put("watersource",waters);
		ans.put("elecsource",elecs);
		ans.put("gassource",gass);
//		ans.put("watersum",waterSum);
//		ans.put("elecsum",elecSum);
//		ans.put("gassum",gasSum);
		ans.put("costle",costLes);


		ans.put("Total",sum);
		ans.put("recordTotal",recordTotal);

		return ans;
	}
}


