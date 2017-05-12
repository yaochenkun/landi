package org.ld.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.model.DailyService;
import org.ld.model.FlightPicking;
import org.ld.model.Guest;
import org.ld.model.Laundry;
import org.ld.model.Maintain;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.ShuttleBus;
import org.ld.model.Sources;
import org.ld.model.User;
import org.ld.service.FlightPickingService;
import org.ld.service.GuestMissionService;
import org.ld.service.ItemService;
import org.ld.service.RoomService;
import org.ld.service.ServerService;
import org.ld.service.UserService;
import org.ld.utils.BeanPrinter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
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
	@Autowired
	private ItemService itemService;
	@Autowired
	private FlightPickingService flightPickingService;

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
					;
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
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
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
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		List<RoomState> rooms = roomService.getAllRoomState();
		ans.put("roomStateList", rooms);

		return ans;
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

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
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

			int eachPage = Config.settingsInt.get("list_size");
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

	@RequestMapping("/getPics")
	@ResponseBody
	public Map<String, Object> getPics(HttpSession session, @RequestBody Integer rid) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		List<RoomPic> pic = roomService.getPic(rid);
		ans.put("pics", pic);
		return ans;
	}

	@RequestMapping("/getMeters") // 查meter（一行）
	@ResponseBody
	public Map<String, Object> getMeters(HttpSession session, Integer rid, Integer type) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		List<RoomMeter> meters = roomService.getMeters(rid, type);
		ans.put("meters" + type, meters);
		return ans;
	}

	@RequestMapping("/roomSearchBill") // 明细流水（客房服务）
	@ResponseBody
	public Map<String, Object> searchBill(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int type = dataJson.getIntValue("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");

		int eachPage = Config.settingsInt.get("list_size");
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

	@RequestMapping("/roomSearchSource") // 查 sources
	@ResponseBody
	public Map<String, Object> searchSourch(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rDaily"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		// 1 water 2 power 3 gas
		int type = dataJson.getIntValue("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String rn = dataJson.getString("rNum");

		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = serverService.getTotalSourcesRow(rn, type);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<Sources> record = serverService.searchSource(rn, type, st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	@RequestMapping("/addService") // 添加客房服务
	@ResponseBody
	public Integer addService(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wDaily"))) == 0) {
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
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wDaily"))) == 0) {
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
			newSrc.setCOUNT(newSrc.getCURRENT_DATA()-newSrc.getLAST_DATA());

			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date;
			date = ft.parse(dataJson.getString("meterDate"));
			newSrc.setTIME(date);

			 meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			 meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			 meter.setCUR_TIME(newSrc.getTIME());

			if (serverService.addSources(newSrc) == 1) {
				 return roomService.updateMeter(meter);
			} else {
				return 0;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@RequestMapping("/addSourceGas") // 添加燃气费
	@ResponseBody
	public Integer addSourceGas(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wDaily"))) == 0) {
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
			newSrc.setTYPE((Integer) Config.settingsInt.get("source_gas"));
			newSrc.setMETER(dataJson.getString("firstMeterNo"));
			newSrc.setLAST_DATA(meter.getCUR_VAL());
			newSrc.setCOUNT(newSrc.getCURRENT_DATA() - newSrc.getLAST_DATA());

			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date;
			date = ft.parse(dataJson.getString("meterDate"));
			newSrc.setTIME(date);

			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			meter.setCUR_TIME(newSrc.getTIME());

			if (serverService.addSources(newSrc) == 1) {
				roomService.updateMeter(meter);
			} else {
				return 0;
			}

			meter = roomService.getMeter(dataJson.getString("secondMeterNo"));
			newSrc.setCURRENT_DATA(dataJson.getDouble("secondthisMonthNum"));
			newSrc.setMONEY(dataJson.getDouble("secondCharge"));
			newSrc.setTYPE((Integer) Config.settingsInt.get("source_gas"));
			newSrc.setMETER(dataJson.getString("secondMeterNo"));
			newSrc.setLAST_DATA(meter.getCUR_VAL());
			newSrc.setCOUNT(newSrc.getCURRENT_DATA() - newSrc.getLAST_DATA());

			meter.setLAST_MONTH_VAL(meter.getCUR_VAL());
			meter.setCUR_VAL(newSrc.getCURRENT_DATA());
			meter.setCUR_TIME(newSrc.getTIME());

			if (serverService.addSources(newSrc) == 1) {
				return roomService.updateMeter(meter);
			} else {
				return 0;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchWash") // roomNum为null时，查询所有记录
	@ResponseBody
	public Map<String, Object> searchWash(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String roomNum = dataJson.getString("roomNum");
		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = roomService.totalLaundry(roomNum);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<Laundry> record = roomService.getLaundry(roomNum, st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/addWash")   // 添加洗衣单收费记录
	@ResponseBody
	public Integer addWash(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			date = ft.parse(dataJson.getString("date"));
			Guest guest = guestService.getGuestByRoomNumber(dataJson.getString("roomNum"));
			int id = guest.getID();
			String guestName = guest.getGUEST_NAME();
			Laundry nL = roomService.getCertainLaundry(dataJson.getString("roomNum"), id, date);
			if(nL == null) {
				nL = new Laundry();
				nL.setDATE(date);
				nL.setROOM_NUM(dataJson.getString("roomNum"));
				nL.setGUEST_ID(id);
				nL.setGUEST_NAME(guestName);
				nL.setCLOTHES(dataJson.getString("clothes"));
				nL.setOTHER(dataJson.getString("other"));
				nL.setTOTAL_PRICE(dataJson.getInteger("totalPrice"));
				nL.setCOUNT(dataJson.getInteger("count"));
				
				return roomService.addWash(nL);
			}
			else
			{
				//把新旧的洗衣种类与对应数量合并，得到新clothes json串
				JSONArray oldClothes = JSONArray.parseArray(nL.getCLOTHES());
				JSONArray newClothes = JSONArray.parseArray(dataJson.getString("clothes"));
				for(int i = 0; i < newClothes.size(); i++){
					JSONObject newCloth = newClothes.getJSONObject(i);
					String newClothName = newCloth.getString("name");
					String newClothMode = newCloth.getString("mode");
					Integer newClothCount = newCloth.getInteger("count");
					int j = 0;
					for(; j < oldClothes.size(); j++){
						JSONObject oldCloth = oldClothes.getJSONObject(j);
						String oldClothName = oldCloth.getString("name");
						String oldClothMode = oldCloth.getString("mode");
						if(newClothName.equals(oldClothName) 
						&& newClothMode.equals(oldClothMode)) { //种类与洗衣方式均相同，算到一起
							oldCloth.put("count", oldCloth.getInteger("count") + newClothCount);
							break;
						}
					}
					
					//若没找到相同的，追加
					if(j >= oldClothes.size()) 
						oldClothes.add(newCloth);
				}

				//把新旧的其他种类与对应数量合并，得到新other json串
				JSONArray oldOthers = JSONArray.parseArray(nL.getOTHER());
				JSONArray newOthers = JSONArray.parseArray(dataJson.getString("other"));
				for(int i = 0; i < newOthers.size(); i++){
					JSONObject newOther = newOthers.getJSONObject(i);
					String newOtherName = newOther.getString("name");
					String newOtherMode = newOther.getString("mode");
					Integer newOtherPrice = newOther.getInteger("price");
					Integer newOtherCount = newOther.getInteger("count");
					int j = 0;
					for(; j < oldOthers.size(); j++){
						JSONObject oldOther = oldOthers.getJSONObject(j);
						String oldOtherName = oldOther.getString("name");
						String oldOtherMode = oldOther.getString("mode");
						Integer oldOtherPrice = oldOther.getInteger("price");
						if(newOtherName.equals(oldOtherName) 
						&& newOtherMode.equals(oldOtherMode)
						&& newOtherPrice.equals(oldOtherPrice)) { //种类与洗衣方式均相同，算到一起
							oldOther.put("count", oldOther.getInteger("count") + newOtherCount);
							break;
						}
					}
					
					//若没找到相同的，追加
					if(j >= oldOthers.size()) 
						oldOthers.add(newOther);
				}

				nL.setCLOTHES(oldClothes.toJSONString());
				nL.setOTHER(oldOthers.toJSONString());
				nL.setTOTAL_PRICE(nL.getTOTAL_PRICE() + dataJson.getInteger("totalPrice"));
				nL.setCOUNT(nL.getCOUNT() + dataJson.getInteger("count"));
				
				return roomService.updateWash(nL);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchWashModeUnitPrice") //查询洗衣单价（种类+方式）
	@ResponseBody
	public Map<String, Object> searchWashModeUnitPrice(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		String clothesName = dataJson.getString("clothesName");
		String mode = dataJson.getString("mode");
		Integer unitPrice = Config.laundry_price.get(clothesName).get(mode);
		ans.put("unitPrice", unitPrice);
		
		return ans;
	}
	
	
	@RequestMapping("/searchFares") // 按房间号+时间查询车费信息(一组)
	@ResponseBody
	public Map<String, Object> searchFares(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
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
		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = roomService.totalShuttleBus(roomNum, year, mon);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<ShuttleBus> record = roomService.getShuttleBus(roomNum, year, mon, st, eachPage);

			ans.put("dataList", record);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/searchFare") // 按房间号+时间查询车费信息(单个)
	@ResponseBody
	public Map<String, Object> searchFare(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
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
			ans.put("unitPrice", getUnitPrice(roomNum));
			return ans;
		}
		
		ShuttleBus record = roomService.getCertainShuttleBus(roomNum, guest.getID(), year, mon);
		ans.put("record", record);
		ans.put("unitPrice", getUnitPrice(roomNum));
		
		return ans;
	}
	
	@RequestMapping("/searchFareById") // 按房间号+时间查询车费信息(单个)
	@ResponseBody
	public Map<String, Object> searchFareById(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		Integer id= dataJson.getInteger("id");
		ShuttleBus record = roomService.getShuttleBusById(id);
		ans.put("record", record);
		ans.put("unitPrice", getUnitPrice(record.getROOM_NUM()));
		
		return ans;
	}
	
	@RequestMapping("/addFare") // 添加车费记录
	@ResponseBody
	public Integer addFare(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
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
			if(!"".equals(othersName)) 
				sb.setOTHER_PEOPLE(sb.getOTHER_PEOPLE() + "，" + othersName);

			//设置总价
			int unitPrice = this.getUnitPrice(sb.getROOM_NUM()); //读取单价
			sb.setTOTAL(totalDay * unitPrice);
			sb.setEDIT_TIME(new Date()); //更新编辑时间
			
			return roomService.updateShuttleBus(sb);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/updateFare") // 添加车费记录
	@ResponseBody
	public Integer updateFare(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Integer id = dataJson.getInteger("id");
			ShuttleBus sb = roomService.getShuttleBusById(id);
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
			int unitPrice = this.getUnitPrice(sb.getROOM_NUM()); //读取单价
			sb.setTOTAL(totalDay * unitPrice);
			sb.setEDIT_TIME(new Date()); //更新编辑时间
			
			return roomService.updateShuttleBus(sb);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/deleteFare") // 添加车费记录
	@ResponseBody
	public Integer deleteFare(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
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

	//到时候把全局配置文件从cur_env中抽离写成单例，把该函数转入RoomService中
	private Integer getUnitPrice(String roomNum) {
		String floor = "车费_" + roomNum.substring(0, 1) + "-" + roomNum.substring(1, roomNum.indexOf('-'));
		return Config.charge.get(floor);
	}
	
	@RequestMapping("/addMaintain") // 添加维修记录
	@ResponseBody
	public Integer addMaintain(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
			return 0;
		}
		
		try{
			Maintain m = new Maintain();
			Guest g = guestService.getGuestByRoomNumber(dataJson.getString("roomNum"));
			m.setGUEST_ID(g.getID());
			m.setCHARGE(dataJson.getDouble("price"));
			m.setCOMMENT(dataJson.getString("comment"));
			m.setETIME(dataJson.getDate("expTime")); // YY-MM-DD HH-MM-SS
			m.setFOLLOW(dataJson.getString("follow"));
			m.setGUEST_ID(dataJson.getInteger("guestID"));
			m.setLEVEL(dataJson.getInteger("problemLevel"));
			m.setPROBLEM(dataJson.getString("problemExist"));
			m.setPRO_TYPE(dataJson.getString("problemType"));
			m.setPRO_CAUSE(dataJson.getString("problemReason"));
			m.setPRO_DETAIL(dataJson.getString("problemDetail"));
			m.setROOM_NUMBER(dataJson.getString("roomNum"));
			m.setSTATE(1); //1 unfinish, 0 finish
			m.setSTIME(dataJson.getDate("maintainTime")); // YY-MM-DD HH-MM-SS
			
			return roomService.addMaintain(m);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/searchMaintainUnfinished") // state 1 : unfinish , 0 finish, null for all; roomNum为null时查询所有记录
	@ResponseBody
	public Map<String, Object> searchMaintainUnfinished(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String roomNum = dataJson.getString("roomNum");
		Date from = dataJson.getDate("from"); // YYYY-MM-DD HH-MM-SS
		Date to = dataJson.getDate("to");
		int type = dataJson.getIntValue("type");
		int cat = dataJson.getIntValue("cat");
		int state = dataJson.getIntValue("state");
		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = roomService.totalMaintain(type, cat, state, roomNum, from, to);
		System.out.println(recordTotal);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<Maintain> record = roomService.getMaintain(type, cat, state, roomNum, st, eachPage, from, to, 0);

			ans.put("dataList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/updateMaintain") 
	@ResponseBody
	public Integer updateMaintain(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("wRoom"))) == 0) {
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

		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String roomNum = dataJson.getString("roomNum");
		Date from = dataJson.getDate("from"); // YYYY-MM-DD HH-MM-SS
		Date to = dataJson.getDate("to");
		int eachPage = Config.settingsInt.get("list_size");
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
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		Integer rid = dataJson.getIntValue("rid");
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
		if ((curUser.getAUTH() & (0x01 << Config.auths.get("rRoom"))) == 0) {
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
//		if ((curEnv.getCur_user().getAUTH() & (0x01 << curEnv.getAuths().get("wBuy"))) == 0) {
//			return 0;
//		};

		JSONObject dataJson = JSONObject.parseObject(data);
		FlightPicking bean = new FlightPicking();
		bean.setTIME(dataJson.getDate("time"));
		bean.setROOM_NUMBER(dataJson.getString("roomNum"));
		bean.setGUEST_NAME(dataJson.getString("guestName"));
		bean.setTYPE(dataJson.getString("type"));
		bean.setFLIGHT_NUMBER(dataJson.getString("flight"));
		bean.setPLATE_NUMBER(dataJson.getString("platNum"));
		bean.setPICKER_NAME(dataJson.getString("pick"));
		bean.setPICKER_TELE(dataJson.getString("pickTele"));
		bean.setCONTACT_NAME(dataJson.getString("contact"));
		bean.setCONTACT_TELE(dataJson.getString("contactNum"));

		if(flightPickingService.addFlightPicking(bean) == 1) {
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
//		if ((curEnv.getCur_user().getAUTH() & (0x01 << curEnv.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		Date time = dataJson.getDate("time");
		String roomNumber = dataJson.getString("roomNum");

		//分页
		int eachPage = Config.settingsInt.get("list_size");
		int recordTotal = flightPickingService.getTotalFlightPickingByRoomNumber_Time(roomNumber, time);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int startPage = (pageNumber - 1) * eachPage;
			List<FlightPicking> record = flightPickingService.getFlightPickingByRoomNumber_Time(roomNumber, time, startPage, eachPage);
			ans.put("pageList", record);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
}
