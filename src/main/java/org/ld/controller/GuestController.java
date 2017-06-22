package org.ld.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.model.*;
import org.ld.service.GuestMissionService;
import org.ld.service.ReminderService;
import org.ld.service.RoomService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/guest")
public class GuestController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private GuestMissionService guestMissionService;
	@Autowired
	private ReminderService reminderService;

	private static Logger logger = Logger.getLogger("logRec");


	// 多文件上传
	@RequestMapping(value = "/uploadGuestScanning", method = RequestMethod.POST)
	public String uploadGuestScanning(@RequestParam("file") MultipartFile[] file, Integer guestId, HttpServletRequest request) {
		// System.out.println(request.getSession().getServletContext().getRealPath(""));
		System.out.println("guestId：" + guestId);

		// 遍历文件
		int index = 0;
		String[]  foldersName = {"LE_condition", "SPC_condition", "guest_idcard"};
		for (MultipartFile mul : file) {
			System.out.println(mul.getName() + "---" + mul.getContentType() + "---" + mul.getOriginalFilename());
			try {
				if (!mul.isEmpty()) {
					Streams.copy(mul.getInputStream(),
							new FileOutputStream(request.getSession().getServletContext().getRealPath("")
									+ "/resources/"+ foldersName[index] +"/" + guestId + "_" + mul.getOriginalFilename()),
							true);
					index++;
				}
			} catch (IOException e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			}
		}

		return "redirect:/views/user/tenant/newGuest.jsp";
	}



	@RequestMapping("/addGuest")
	@ResponseBody
	public Map<String, Object> Model(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wCustom"))) == 0) {
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

			//先检查roomNumber房间是否已经有人入住 即free字段为1则不能添加
			Integer state = roomService.getCertainRSbyRoomNumber(obj.getString("STR_RommID")).getSTATE();
			if(state == 1) //已有人入住
			{
				ans.put("State", "该房间已有人入住");
				return ans;
			}

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

			newGuest.setOTHER_GUESTS(obj.getString("STR_GuestOthers"));
			newGuest.setGUEST_TYPE(obj.getString("STR_GuestType"));
			newGuest.setBIRTHDAY(obj.getDate("STR_Birthday"));


			newGuest.setEMAIL(obj.getString("STR_Email"));
			newGuest.setCOMPANY_CONTACTOR(obj.getString("STR_CompanyContactor"));
			newGuest.setCOMPANY_TEL(obj.getString("STR_CompanyTel"));
			newGuest.setCOMPANY_ACCOUNT(obj.getString("STR_CompanyAccount"));
			newGuest.setCOMPANY_INVOICE(obj.getString("STR_CompanyInvoice"));
			newGuest.setCOMPANY_PAYMODE(obj.getString("STR_CompanyPayMode"));


			if (guestMissionService.addGuest(newGuest) == 1) {
				newGuest = guestMissionService.getGuestByContract(obj.getString("STR_ContractID"));
				System.out.println("Finish Guest");

				//生日提醒设置
				//根据BOOL_IsRemind决定是否添加系统提醒
				//若是 进一步获取UID、TITLE、CONTENT、并根据birthday和到期时间 计算总共X年，然后生成X条系统提醒
				if(obj.getBooleanValue("BOOL_IsRemind")) {

					Integer uid = obj.getInteger("INT_Uid");
					String title = obj.getString("STR_RemindTitle");
					String content = obj.getString("STR_RemindContent");
					Date birthday = obj.getDate("STR_Birthday");




					Calendar timeIn = Calendar.getInstance();
					Calendar timeOut = Calendar.getInstance();
					Calendar birth = Calendar.getInstance();
					timeIn.setTime(obj.getDate("STR_TimeIn"));
					timeOut.setTime(obj.getDate("STR_TimeOut"));
					birth.setTime(birthday);

					Calendar endTime = Calendar.getInstance();
					endTime.set(timeOut.get(Calendar.YEAR), timeOut.get(Calendar.MONTH), timeOut.get(Calendar.DAY_OF_MONTH));


					int startYear = timeIn.get(Calendar.YEAR);
					int endYear = timeOut.get(Calendar.YEAR);

					if(birth.get(Calendar.DAY_OF_YEAR) < timeIn.get(Calendar.DAY_OF_YEAR))
						startYear++;

					int birthMonth = birth.get(Calendar.MONTH);
					int birthDay = birth.get(Calendar.DAY_OF_MONTH);

					//计算生日提醒的 年/月/日 - 3天
					Calendar remind = Calendar.getInstance();
					for(int year = startYear; year <= endYear; year++) {
						remind.set(year, birthMonth, birthDay);

						if(remind.compareTo(endTime) <= 0) {

							remind.add(Calendar.DAY_OF_MONTH, -3);
							Date remindDate = remind.getTime();

							//写入系统提醒
							SystemReminder sr = new SystemReminder();
							sr.setREMIND_DATE(remindDate);
							sr.setUSER_ID(uid);
							sr.setTITLE(title);
							sr.setCONTENT(content);
							sr.setSTATE("未完成");

							if(reminderService.addSystemReminder(sr) == 1){
								System.out.println("Finish System Reminder of Birthday");
							} else  {
								ans.remove("State");
								ans.put("State", "Invalid: Birthday Reminder info error");
								return ans;
							}
						} else {
							break;
						}
					}

				}


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
			newHost.setRENT_CHARGE(obj.getDouble("DOU_Rent"));
			newHost.setSERVICE_CHARGE(obj.getDouble("DOU_Service"));
			newHost.setRETURN_MONEY(obj.getDouble("DOU_SignReturn"));
			newHost.setOTHER_CHARGE(obj.getDouble("DOU_OtherMoney")); // other is
																		// charge
			String hostType = obj.getString("STR_Type");
			newHost.setHOST_TYPE(hostType);
			newHost.setHOST_NAME("SPC".equals(hostType) ? "SPC" : obj.getString("STR_Name"));
			newHost.setHOST_IDENTITY(obj.getString("STR_IDNumber"));
			newHost.setHOST_ACCOUNT(obj.getString("STR_Account"));
			newHost.setTAX_CHARGE(obj.getDouble("DOU_Taxes"));
			newHost.setTENET_CHARGE(obj.getDouble("DOU_SPC"));
			newHost.setHEATING_CHARGE(obj.getDouble("DOU_Heating"));
			newHost.setACTUAL_CHARGE(obj.getDouble("DOU_ActualReturn"));

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
			newBalance.setCHARGE_DAY(obj.getDate("STR_RentNumber"));
			newBalance.setCHARGE_TURN(obj.getInteger("INT_RentCycle"));
			newBalance.setCHARGE_WAY(obj.getString("STR_RentWay"));
			newBalance.setRETURN_DAY(obj.getDate("STR_ReturnNumber"));
			newBalance.setRETURN_TURN(obj.getInteger("INT_ReturnCycle"));
			newBalance.setINVOICE_DAY(obj.getDate("STR_BillNumber"));
			newBalance.setINVOICE_TURN(obj.getInteger("INT_BillCycle"));
			newBalance.setINVOICE_AHEAD(obj.getInteger("INT_BillTime"));
			newBalance.setBEGIN_DAY(obj.getDate("STR_BeginDate"));
			newBalance.setEND_DAY(obj.getDate("STR_EndDate"));
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

						newService.setFREE_MONEY(obj3.getBooleanValue("BOOL_Give") ? obj3.getDouble("DOU_GiveMoney") : 0);
						newService.setFREE_REASON(obj3.getBooleanValue("BOOL_Give") ? obj3.getString("STR_GiveComment") : "");

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

						newService.setFREE_MONEY(obj3.getBooleanValue("BOOL_Give") ? obj3.getDouble("DOU_GiveMoney") : 0);
						newService.setFREE_REASON(obj3.getBooleanValue("BOOL_Give") ? obj3.getString("STR_GiveComment") : "");

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

					newService.setFREE_MONEY(obj2.getBooleanValue("BOOL_Give") ? obj2.getDouble("DOU_GiveMoney") : 0);
					newService.setFREE_REASON(obj2.getBooleanValue("BOOL_Give") ? obj2.getString("STR_GiveComment") : "");

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

					newService.setFREE_MONEY(obj2.getBooleanValue("BOOL_Give") ? obj2.getDouble("DOU_GiveMoney") : 0);
					newService.setFREE_REASON(obj2.getBooleanValue("BOOL_Give") ? obj2.getString("STR_GiveComment") : "");

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
		
		logger.info(curUser.getNAME() + " add new guest " + newGuest.getGUEST_NAME() + " in " + newGuest.getROOM_NUMBER());

		//返回guestId作为之后上传3个扫描件文件命名使用 guestId_XX_MMMM
		ans.put("guestId", newGuest.getID());
		return ans;
	}

	@RequestMapping("/searchGuestList")
	@ResponseBody
	public Map<String, Object> searchGuestList(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}
		
		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = Config.getSettingsInt().get("list_size");
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
		String name = dataJson.getString("name");
		String roomNumber = dataJson.getString("roomId");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
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



	//add by yck
	@RequestMapping("/searchAllGuestByName")
	@ResponseBody
	public Map<String, Object> searchAllGuestByName_RoomNumber(HttpSession session, @RequestBody String data) {

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
		String name = dataJson.getString("name");
		String roomNumber = dataJson.getString("roomId");


		List<Guest> record = guestMissionService.getAllGuestByName_RoomNumber(name, roomNumber);
		ans.put("dataList", record);
		return ans;
	}

}
