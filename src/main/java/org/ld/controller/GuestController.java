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
import org.ld.model.DailyService;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public Map<String, Object> Model(HttpSession session, @RequestBody String data) {
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("wCustom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject objs = JSON.parseObject(data);
		Guest newGuest = new Guest();
		Host newHost = new Host();
		Intern newIntern = new Intern();
		GuestBalance newBalance = new GuestBalance();
		GuestService newService = new GuestService();

		JSONObject obj = objs.getJSONObject("guest");
		try {
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
			newGuest.setCHARGE(obj.getDouble("DOU_Rent")); // double ?
			newGuest.setSYS_STATE(0);
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			date = ft.parse(obj.getString("STR_TimeIn"));
			newGuest.setTIMEIN(date);
			date = ft.parse(obj.getString("STR_TimeOut"));
			newGuest.setTIMEOUT(date);

			if (guestMissionService.addGuest(newGuest) == 1) {
				newGuest = guestMissionService.getGuestByContract(obj.getString("STR_ContractID"));
				System.out.println("Finish Guest");
			} else {
				ans.remove("State");
				ans.put("State", "Invalid: Guest info error");
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid: Guest info error");
			return ans;
		}

		obj = objs.getJSONObject("host");
		try {
			newHost.setGUEST_ID(newGuest.getID());
			newHost.setHOST_NAME(obj.getString("STR_Name"));
			newHost.setRENT_CHARGE(obj.getDouble("DOU_Rent"));
			newHost.setSERVICE_CHARGE(obj.getDouble("DOU_Service"));
			newHost.setRETURN_MONEY(obj.getDouble("DOU_Return"));
			newHost.setOTHER_CHARGE(obj.getDouble("DOU_OTHER")); // other is
																	// charge
			newHost.setSYS_STATE(0);

			if (guestMissionService.addHost(newHost) == 1) {
				System.out.println("Finish Host");
			} else {
				ans.remove("State");
				ans.put("State", "Invalid: Host info error");
				guestMissionService.delGuest(newGuest.getID());
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid: Host info error");
			guestMissionService.delGuest(newGuest.getID());
			return ans;
		}

		obj = objs.getJSONObject("intern");
		try {
			newIntern.setGUEST_ID(newGuest.getID());
			newIntern.setIN_NAME(obj.getString("STR_Company"));
			newIntern.setLE_1(obj.getDouble("DOU_LEFirst"));
			newIntern.setLE_2(obj.getDouble("DOU_LESecond"));
			newIntern.setLE_3(obj.getDouble("DOU_LEThird"));
			newIntern.setLE_SERVICE(obj.getDouble("DOU_LEFourth")); // fourth ?
			newIntern.setIN_1(obj.getDouble("DOU_AgentFirst"));
			newIntern.setIN_2(obj.getDouble("DOU_AgentSecond"));
			newIntern.setIN_3(obj.getDouble("DOU_AgentThird"));
			newIntern.setIN_SERVICE(obj.getDouble("DOU_AgentFourth")); // fourth
																		// ?
			newIntern.setSYS_STATE(0);

			if (guestMissionService.addIntern(newIntern) == 1) {
				System.out.println("Finish Intern");
			} else {
				ans.remove("State");
				ans.put("State", "Invalid: Intern info error");
				guestMissionService.delGuest(newGuest.getID());
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid: Intern info error");
			guestMissionService.delGuest(newGuest.getID());
			return ans;
		}

		obj = objs.getJSONObject("balance");
		try {
			newBalance.setGUEST_ID(newGuest.getID());
			newBalance.setROOM_NUMBER(newGuest.getROOM_NUMBER());
			newBalance.setCHARGE_DAY(obj.getInteger("INT_RentNumber"));
			newBalance.setCHARGE_TURN(obj.getInteger("INT_RentCycle"));
			newBalance.setCHARGE_WAY(obj.getString("STR_RentWay"));
			newBalance.setRETURN_DAY(obj.getInteger("INT_ReturnNumber"));
			newBalance.setRETURN_TURN(obj.getInteger("INT_ReturnCycle"));
			newBalance.setINVOICE_DAY(obj.getInteger("INT_BillNumber"));
			newBalance.setINVOICE_TURN(obj.getInteger("INT_BillCycle"));
			newBalance.setINVOICE_AHEAD(obj.getInteger("INT_BillTime"));
			newBalance.setSYS_STATE(0);

			if (guestMissionService.addGuestBalance(newBalance) == 1) {
				System.out.println("Finish Balance");
			} else {
				ans.remove("State");
				ans.put("State", "Invalid: Balance info error");
				guestMissionService.delGuest(newGuest.getID());
				return ans;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid: Balance info error");
			guestMissionService.delGuest(newGuest.getID());
			return ans;
		}

		obj = objs.getJSONObject("service");
		newService.setGUEST_ID(newGuest.getID());
		newService.setROOM_NUMBER(newGuest.getROOM_NUMBER());
		for (String key : obj.keySet()) {
			try {
				JSONObject obj2 = obj.getJSONObject(key);
				if (key.equals("OBJ_lunchMap")) {
					newService.setSYS_STATE(1);
					for (String key2 : obj2.keySet()) {
						JSONObject obj3 = obj2.getJSONObject(key2);
						newService.setNAME(obj3.getString("STR_RName"));
						newService.setLECHARGE(obj3.getDouble("DOU_LECharge"));
						newService.setLECOUNT(obj3.getInteger("INT_LECount"));
						newService.setSPCHARGE(obj3.getDouble("DOU_SPCCharge"));
						newService.setSPCOUNT(obj3.getInteger("INT_SPCCount"));
						newService.setTURN(obj3.getInteger("INT_Cycle"));
						newService.setCOMMENT(obj3.getString("STR_Note"));
						newService.setFREE(obj3.getBooleanValue("BOOL_Give") ? 1 : 0);

						if (guestMissionService.addGuestService(newService) == 1) {
							System.out.println("Finish launch");
						} else {
							ans.remove("State");
							ans.put("State", "Invalid: Launch info error");
							guestMissionService.delGuest(newGuest.getID());
							return ans;
						}
					}
				} else if (key.equals("OBJ_ADDLIST")) {
					newService.setSYS_STATE(3);
					for (String key2 : obj2.keySet()) {
						JSONObject obj3 = obj2.getJSONObject(key2);
						newService.setNAME(obj3.getString("STR_ADD_NAME"));
						newService.setLECHARGE(obj3.getDouble("DOU_LECharge"));
						newService.setLECOUNT(obj3.getInteger("INT_LECount"));
						newService.setSPCHARGE(obj3.getDouble("DOU_SPCCharge"));
						newService.setSPCOUNT(obj3.getInteger("INT_SPCCount"));
						newService.setTURN(obj3.getInteger("INT_Cycle"));
						newService.setCOMMENT(obj3.getString("STR_Note"));
						newService.setFREE(obj3.getBooleanValue("BOOL_Give") ? 1 : 0);

						if (guestMissionService.addGuestService(newService) == 1) {
							System.out.println("Finish service_add");
						} else {
							ans.remove("State");
							ans.put("State", "Invalid: AddService info error");
							guestMissionService.delGuest(newGuest.getID());
							return ans;
						}
					}
				} else if (key.equals("resource")) {
					newService.setSYS_STATE(obj2.getBooleanValue("BOOL_Selfpay") ? 5 : 7);
					newService.setNAME(key);
					newService.setLECHARGE(obj2.getDouble("DOU_LECharge"));
					newService.setLECOUNT(obj2.getInteger("INT_LECount"));
					newService.setSPCHARGE(obj2.getDouble("DOU_SPCCharge"));
					newService.setSPCOUNT(obj2.getInteger("INT_SPCCount"));
					newService.setTURN(obj2.getInteger("INT_Cycle"));
					newService.setCOMMENT(obj2.getString("STR_Note"));
					newService.setFREE(obj2.getBooleanValue("BOOL_Give") ? 1 : 0);

					if (guestMissionService.addGuestService(newService) == 1) {
						System.out.println("Finish service_source");
					} else {
						ans.remove("State");
						ans.put("State", "Invalid: Resource info error");
						guestMissionService.delGuest(newGuest.getID());
						return ans;
					}
				} else {
					newService.setSYS_STATE(9);
					newService.setNAME(key);
					newService.setLECHARGE(obj2.getDouble("DOU_LECharge"));
					newService.setLECOUNT(obj2.getInteger("INT_LECount"));
					newService.setSPCHARGE(obj2.getDouble("DOU_SPCCharge"));
					newService.setSPCOUNT(obj2.getInteger("INT_SPCCount"));
					newService.setTURN(obj2.getInteger("INT_Cycle"));
					newService.setCOMMENT(obj2.getString("STR_Note"));
					newService.setFREE(obj2.getBooleanValue("BOOL_Give") ? 1 : 0);

					if (guestMissionService.addGuestService(newService) == 1) {
						System.out.println("Finish service");
					} else {
						ans.remove("State");
						ans.put("State", "Invalid: Service info error");
						guestMissionService.delGuest(newGuest.getID());
						return ans;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				ans.remove("State");
				ans.put("State", "Invalid: Data Error");
				guestMissionService.delGuest(newGuest.getID());
				return ans;
			}
		}
		
		try{
			Integer rid = roomService.getRoomByNumber(newGuest.getROOM_NUMBER()).getID();
			RoomState rs = new RoomState();
			rs.setID(rid);
			rs.setCUS_ID(newGuest.getID());
			rs.setCUS_NAME(newGuest.getGUEST_NAME());
			rs.setSTATE(1); // 0 free, 1 rent
			roomService.updateRoomState(rs);
		} catch (Exception e) {
			e.printStackTrace();
			ans.remove("State");
			ans.put("State", "Invalid: Data Error");
			guestMissionService.delGuest(newGuest.getID());
			return ans;
		}
		
		logger.info(cur_env.getCur_user().getNAME() + " add new guest " + newGuest.getGUEST_NAME() + " in " + newGuest.getROOM_NUMBER());
		return ans;
	}

	@RequestMapping("/searchGuestList")
	@ResponseBody
	public Map<String, Object> searchGuestList(HttpSession session, @RequestBody String data) {
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = cur_env.getSettingsInt().get("list_size");
		int recordTotal = guestMissionService.getTotal();
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int st = (pageNumber - 1) * eachPage;
			List<Guest> record = guestMissionService.getGuestList(st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	//add by yck
	@RequestMapping("/searchGuestByName")
	@ResponseBody
	public Map<String, Object> searchGuestByName_RoomNumber(HttpSession session, @RequestBody String data) {
		
		//验证权限
		CurEnv curEnv = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<>();
		if ((curEnv.getCur_user().getAUTH() & (0x01 << curEnv.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		String name = dataJson.getString("name");
		String roomNumber = dataJson.getString("roomId");

		//分页
		int eachPage = curEnv.getSettingsInt().get("list_size");
		int recordTotal = guestMissionService.getTotalByName_RoomNumber(name, roomNumber);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int st = (pageNumber - 1) * eachPage;
			List<Guest> record = guestMissionService.getGuestByName_RoomNumber(name, roomNumber, st, eachPage);
			ans.put("pageList", record);
		}
		
		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		
		return ans;
	}
}
