package org.ld.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.ld.app.Config;

import org.ld.model.*;

import org.ld.service.GuestMissionService;
import org.ld.service.ItemService;
import org.ld.service.RoomService;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

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

	@RequestMapping("/searchItemRoomOverview") // 房间物品统计
	@ResponseBody
	public Map<String, Object> searchItemRoomOverview(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		String roomNum = dataJson.getString("roomNum");
		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotalItemsByRoomNum_Type(roomNum, type);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<RoomItem> record = itemService.getItemsByRoomNum_Type(roomNum, type, st, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	@RequestMapping("/searchAllItemRoomOverview") // 所有的库房物品统计
	@ResponseBody
	public Map<String, Object> searchAllItemRoomOverview(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		String roomNum = dataJson.getString("roomNum");

		List<RoomItem> record = itemService.getAllRoomItemByType_RoomNum(roomNum, type);
		ans.put("dataList", record);

		return ans;
	}

	@RequestMapping("/searchItemRepoOverview") // 库房物品统计
	@ResponseBody
	public Map<String, Object> searchItemRepoOverview(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		String repoNum = dataJson.getString("repoNum");
		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotalRepoItemByType_RepoNum(type, repoNum);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<FacSta> record = itemService.getRepoItemByType_RepoNum(type,repoNum, st, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	@RequestMapping("/searchAllItemRepoOverview") // 所有的库房物品统计
	@ResponseBody
	public Map<String, Object> searchAllItemRepoOverview(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		String repoNum = dataJson.getString("repoNum");

		List<FacSta> record = itemService.getAllRepoItemByType_RepoNum(type,repoNum);
		ans.put("dataList", record);

		return ans;
	}


	@RequestMapping("/searchItemList") // 根据物品种类、子类、品牌获取物品名称
	@ResponseBody
	public Map<String, Object> searchItemList(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		String cat = dataJson.getString("cat");
		String band = dataJson.getString("band");

		List<FacSta> record = itemService.getFacByTypeCatBandAll(type, cat, band);

		ans.put("pageList", record);

		return ans;
	}

	@RequestMapping("/searchPlanList") // 查询所有采购计划
	@ResponseBody
	public Map<String, Object> searchPlanList(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rBuy"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotalPlan();
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<Plan> record = itemService.getPlans(st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	@RequestMapping("/searchPlanByPlanId") // 根据采购计划ID查询采购计划
	@ResponseBody
	public Map<String, Plan> searchPlanByPlanId(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		int PlanId = dataJson.getIntValue("PlanId");
		Plan plan = itemService.searchPlanByPlanid(PlanId);

		Map<String, Plan> res = new HashMap<String, Plan>();
		res.put("plan", plan);
		return res;
	}

	@RequestMapping("/getItemType") // 查询系统物品种类（家电、家具）
	@ResponseBody
	public Set<String> getItemType(HttpSession session) {
		return Config.getItem_type();
	}

	@RequestMapping("/getItemCat") // 根据物品种类type查询物品类别Cat
	@ResponseBody
	public Set<String> getItemCat(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		String type = dataJson.getString("type");

		return Config.getItem_cat().get(type);
	}

	@RequestMapping("/getItemCom") // 根据物品种类type查询物品品牌Com
	@ResponseBody
	public Set<String> getItemCom(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		String type = dataJson.getString("type");

		return Config.getItem_com().get(type);
	}

	@RequestMapping("/newPlan") // 新增采购计划
	@ResponseBody
	public Integer newPlan(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wBuy"))) == 0) {
			return 0;
		}

		try {
			JSONObject dataJson = JSONObject.parseObject(data);

			Plan newPlan = new Plan();
			String name = dataJson.getString("delivery") + dataJson.getString("planName");
			newPlan.setNAME(name);
			newPlan.setSTAFF(dataJson.getString("planManager"));
			newPlan.setCOMMENT(dataJson.getString("note"));

//			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			newPlan.setCTIME(date);

			if (itemService.addNewPlan(newPlan) == 1) {
				double sum = 0;
				JSONObject obj = dataJson.getJSONObject("itemList");
				PlanDetail pd = new PlanDetail();
				pd.setPLAN_ID(newPlan.getID());
				for (String key : obj.keySet()) {
					JSONObject obj2 = obj.getJSONObject(key);


					//物品基本属性信息
					String facType = obj2.getString("FAC_TYPE");
					String facCat = obj2.getString("FAC_CAT");
					String facBrand = obj2.getString("FAC_BRAND");
					String facName = obj2.getString("FAC_NAME");
					String facOwner = obj2.getString("FAC_OWNER");
					String facRepoNum = obj2.getString("FAC_REPONUM");


					pd.setALL_MONEY(obj2.getDouble("totalPrice"));
					pd.setCOMMENT(obj2.getString("comment"));
					pd.setTOTAL(obj2.getInteger("count"));
					pd.setARRIVAL_DATE(obj2.getDate("arrivalDate"));
					pd.setORDER_DATE(obj2.getDate("orderDate"));
					pd.setINVOICE_TYPE(obj2.getString("invoiceType"));
					pd.setPROVIDER(obj2.getString("provider"));
					pd.setRECEIVED(obj2.getString("received"));
					pd.setUNITPRICE(obj2.getDouble("unitPrice"));
					pd.setALREADY(0);
					sum += obj2.getDouble("totalPrice");


					//根据上面信息查询数据库，看是否存在已有的物品，若有则将该plan_detail的facId关联上，否则新建一个facSta
					FacSta facSta= itemService.getFacByItemInfo(facType, facCat, facName, facBrand, facOwner, facRepoNum);

					if (facSta == null) { //新物品
						FacSta newFs = new FacSta();

						newFs.setTYPE(facType);
						newFs.setCAT(facCat);
						newFs.setBRAND(facBrand);
						newFs.setNAME(facName);
						newFs.setOWNER(facOwner);
						newFs.setREPO_NUM(facRepoNum);//以后这里还要setRepoId
						newFs.setCOMMENT(obj2.getString("comment"));
						newFs.setFREE(0);
						newFs.setBAD(0);
						newFs.setMAINTAIN(0);
						newFs.setWORKING(0);
						newFs.setTOTAL(0);

						itemService.addNewFac(newFs);
						pd.setFAC_ID(newFs.getID());
					} else {
						pd.setFAC_ID(facSta.getID());
					}

					itemService.addNewPlanDetail(pd);
				}

				newPlan.setMONEY(sum);
				itemService.updatePlan(newPlan);
				return 1;
			} else
				return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping("/searchPlanDetail") // 查询计划采购物品（plan_detail表）
	@ResponseBody
	public Map<String, Object> searchPlanDetail(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rBuy"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		int pid = dataJson.getIntValue("planID");
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotalPlanDetail(pid);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			List<PlanDetail> record = itemService.getPlanDetails(pid, 0, eachPage);
			
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		return ans;
	}
	
	@RequestMapping("/searchPlanProgress") // 查询计划执行情况（plan_progress表）
	@ResponseBody
	public Map<String, Object> searchPlanProgress(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rBuy"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		int pageNumber = dataJson.getIntValue("pageNum");
		int pid = dataJson.getIntValue("planID");
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotalPlanProgress(pid);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;
			
			int st = (pageNumber - 1) * eachPage;
			
			List<PlanProgress> record = itemService.getPlanProgresses(pid, st, eachPage);
			
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);
		return ans;
	}
	
	@RequestMapping("/addPlanProgress") // 添加计划执行情况
	@ResponseBody
	public Integer addPlanProgress(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wBuy"))) == 0) {
			return 0;
		};
		
		JSONObject dataJson = JSONObject.parseObject(data);
		PlanProgress newPg = new PlanProgress();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		try {
			date = ft.parse(dataJson.getString("time"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		newPg.setTIME(date);
		newPg.setPLAN_ID(dataJson.getInteger("planID"));
		newPg.setFAC_ID(dataJson.getInteger("facID"));
		newPg.setTERM(dataJson.getString("term"));
		newPg.setTOTAL(dataJson.getInteger("total"));
		newPg.setSTAFF(dataJson.getString("staff"));
		newPg.setALL_MONEY(dataJson.getDouble("all_money"));
		newPg.setCOMMENT(dataJson.getString("comment"));

		//检查采购数量累加后是否超过总量
		PlanDetail pd = itemService.getPlanDetailByID(dataJson.getIntValue("pdID"));
		Integer curCount = pd.getALREADY() + newPg.getTOTAL();
		if(pd == null || curCount > pd.getTOTAL())
			return 0;


		if(itemService.addNewPlanProgress(newPg) == 1) {

			pd.setALREADY(curCount);
			itemService.updatePlanDetain(pd);

			//将新采购的数量添加到库房
			FacSta fs = itemService.getFac(dataJson.getInteger("facID"));
			fs.setTOTAL(fs.getTOTAL() + newPg.getTOTAL());
			fs.setFREE(fs.getFREE() + newPg.getTOTAL());
			itemService.updateFac(fs);
		} else {
			return 0;
		}
		logger.info(curUser.getNAME() + " add plan progress for " + dataJson.getInteger("planID"));
		return 1;
	}
	
	@RequestMapping("/searchFacDetail") // 根据物品ID查询物品分配到房间的情况
	@ResponseBody
	public Map<String, Object> searchFacDetail(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer facID = dataJson.getInteger("facID");
		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = roomService.totalRowByItem(facID);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<RoomItem> record = roomService.getItemByItemID(facID, st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/searchFacSta") // 获取指定FacSta
	@ResponseBody
	public Map<String, Object> searchFacSta(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer facID = dataJson.getInteger("facID");
		FacSta newFs = itemService.getFac(facID);
		ans.put("fac", newFs);
		return ans;
	}
	
	@RequestMapping("/transferFac") // 移动物品到其他房间
	@ResponseBody
	public Integer transferFac(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		
		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		ri.setALLOCATE_TYPE(dataJson.getString("allocateType"));
		ri.setBORROW_DATE(dataJson.getDate("borrowDate"));
		ri.setRETURN_DATE(dataJson.getDate("returnDate"));
		ri.setROOM_NUM(dataJson.getString("rNum"));
		
		if(itemService.updateRoomItem(ri) == 1) {

			logger.info(curUser.getNAME() + " move item " + recID + " to " + dataJson.getString("rNum"));
			return 1;
		} else {

			return 0;
		}
	}


	@RequestMapping("/facRepair") // 物品点击维修
	@ResponseBody
	public Integer facRepair(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		FacSta fs = itemService.getFac(ri.getFAC_ID());

		fs.setMAINTAIN(fs.getMAINTAIN() + 1);
		fs.setWORKING(fs.getWORKING() - 1);

		ri.setSTATE("维修中"); //状态变为维修中
		ri.setMAINTAIN_DURATION(dataJson.getInteger("maintainDuration"));


		if(itemService.updateRoomItem(ri) == 1 && itemService.updateFac(fs) == 1)
		{
			logger.info(curUser.getNAME() + " let " + recID + " under repairing ");
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping("/facFinishRepair") // 物品点击维修完成
	@ResponseBody
	public Integer facFinishRepair(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		FacSta fs = itemService.getFac(ri.getFAC_ID());


		fs.setMAINTAIN(fs.getMAINTAIN() - 1);

		//检测物品是否需要直接放回库房（若不处于任何房间则放回，若处于则不放回）
		boolean isIsolated = dataJson.getBoolean("isIsolated");
		if(isIsolated == true) { //物品不属于任一房间

			fs.setFREE(fs.getFREE() + 1);

			if(roomService.deleteRI(recID) == 1 && itemService.updateFac(fs) == 1)
			{
				logger.info(curUser.getNAME() + " let " + recID + " be free");
				return 1;
			} else {
				return 0;
			}

		} else { //物品现在已被分配到某个房间

			fs.setWORKING(fs.getWORKING() + 1);
			ri.setSTATE("正常"); //状态变为正常
			ri.setMAINTAIN_DURATION(null);

			if(itemService.updateRoomItem(ri) == 1 && itemService.updateFac(fs) == 1)
			{
				logger.info(curUser.getNAME() + " let " + recID + " be working");
				return 1;
			} else {
				return 0;
			}
		}
	}

	@RequestMapping("/facBad") // 物品点击报废
	@ResponseBody
	public Integer facBad(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		
		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		FacSta fs = itemService.getFac(ri.getFAC_ID());
		
		fs.setBAD(fs.getBAD() + 1);
		fs.setWORKING(fs.getWORKING() - 1);
		
		if(roomService.deleteRI(recID) == 1)
		{
			itemService.updateFac(fs);
		} else {
			return 0;
		}
		
		logger.info(curUser.getNAME() + " let " + recID + " bad ");
		return 1;
	}

	@RequestMapping("/facRepairToBad") // 物品从维修中转为报废
	@ResponseBody
	public Integer facRepairToBad(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		FacSta fs = itemService.getFac(ri.getFAC_ID());

		fs.setBAD(fs.getBAD() + 1);
		fs.setMAINTAIN(fs.getMAINTAIN() - 1);

		if(roomService.deleteRI(recID) == 1)
		{
			itemService.updateFac(fs);
		} else {
			return 0;
		}

		logger.info(curUser.getNAME() + " let " + recID + " bad ");
		return 1;
	}

	@RequestMapping("/getFacRepoNum") // 获得物品所在仓库号
	@ResponseBody
	public String getFacRepoNum(HttpSession session, @RequestBody String data) throws IOException {

		ObjectMapper mapper = new ObjectMapper();

		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rFac"))) == 0) {
			return mapper.writeValueAsString(null);
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		Integer recID = dataJson.getInteger("recID");
		RoomItem ri = roomService.getCertainRIRec(recID);
		Integer facId = ri.getFAC_ID();
		FacSta fs= itemService.getFac(facId);

		if(fs != null)
		{
			return mapper.writeValueAsString(fs.getREPO_NUM());
		} else {
			return mapper.writeValueAsString(null);
		}
	}



	@RequestMapping("/toWarehouse") // 物品回仓库
	@ResponseBody
	public Integer toWarehouse(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		
		Integer recID = dataJson.getInteger("recID");
		String targetRepoNum = dataJson.getString("repoNum"); //当前希望放回的仓库号

		//查看targetRepoNum是否存在
		Repository repo = itemService.getRepoByRepoNum(targetRepoNum);
		if(repo == null) return 0;

		RoomItem ri = roomService.getCertainRIRec(recID);
		Integer facID = ri.getFAC_ID();
		if(roomService.deleteRI(recID) == 1) {

			FacSta fs = itemService.getFac(facID);
			if(fs == null) return 0;
			String oriRepoNum = fs.getREPO_NUM(); //原来的仓库号


			//存在，合法的仓库号
			//检测是否是该物品原来所在的仓库
			if(oriRepoNum.equals(targetRepoNum)) {

				//是
				fs.setWORKING(fs.getWORKING() - 1);
				fs.setFREE(fs.getFREE() + 1);
				itemService.updateFac(fs);

				logger.info(curUser.getNAME() + " move " + recID + " to original warehouse " + targetRepoNum);

			} else {

				//转到别的仓库
				fs.setWORKING(fs.getWORKING() - 1);
				fs.setTOTAL(fs.getTOTAL() - 1);
				itemService.updateFac(fs);

				//查看targetRepoNum仓库中是否有fac这个物品（种类、子类、品牌、名称、归属权 5项必须相同）
				FacSta targetFacSta = itemService.getFacByItemInfo(fs.getTYPE(), fs.getCAT(),fs.getNAME(), fs.getBRAND(),fs.getOWNER(), targetRepoNum);

				if(targetFacSta == null) {

					//目标仓库暂无该物品
					//向该仓库新增一个该物品
					FacSta newFs = new FacSta();

					newFs.setTYPE(fs.getTYPE());
					newFs.setCAT(fs.getCAT());
					newFs.setBRAND(fs.getBRAND());
					newFs.setNAME(fs.getNAME());
					newFs.setOWNER(fs.getOWNER());
					newFs.setREPO_NUM(targetRepoNum);//以后这里还要setRepoId
					newFs.setTOTAL(1);
					newFs.setFREE(1);
					newFs.setWORKING(0);
					newFs.setMAINTAIN(0);
					newFs.setBAD(0);
					newFs.setCOMMENT("无");

					if(itemService.addNewFac(newFs) == 1){
						logger.info(curUser.getNAME() + " move " + recID + " to other warehouse " + targetRepoNum);
						return 1;
					} else return 0;

				} else {

					//已有
					targetFacSta.setTOTAL(targetFacSta.getTOTAL() + 1);
					targetFacSta.setFREE(targetFacSta.getFREE() + 1);

					if(itemService.updateFac(targetFacSta) == 1){
						logger.info(curUser.getNAME() + " move " + recID + " to other warehouse " + targetRepoNum);
						return 1;
					} else return 0;
				}
			}

		} else {
			return 0;
		}

		return 1;
	}
	
	@RequestMapping("/newDistribute") // 新分配物品
	@ResponseBody
	public Integer newDistribute(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		
		int facId = dataJson.getIntValue("facID");
		String rn = dataJson.getString("rNum");
		
		FacSta fs = itemService.getFac(facId);
		if(fs.getFREE() <= 0)
		{
			return 0;
		}
		else {
			fs.setWORKING(fs.getWORKING() + 1);
			fs.setFREE(fs.getFREE() - 1);
			itemService.updateFac(fs);
			RoomItem newRi = new RoomItem();
			newRi.setCOMM(dataJson.getString("comment"));
			newRi.setTAG(dataJson.getString("tag"));
			newRi.setFAC_ID(facId);
			newRi.setROOM_NUM(rn);
			newRi.setALLOCATE_TYPE("分配");
			newRi.setSTATE("正常");
			roomService.insertRI(newRi);
		}
		
		logger.info(curUser.getNAME() + " assign " + facId + " to " + rn );
		return 1;
	}

	@RequestMapping("/newBorrow") // 新借用物品
	@ResponseBody
	public Integer newBorrow(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int facId = dataJson.getIntValue("facID");
		String rn = dataJson.getString("rNum");

		FacSta fs = itemService.getFac(facId);
		if(fs.getFREE() <= 0)
		{
			return 0;
		}
		else {
			fs.setWORKING(fs.getWORKING() + 1);
			fs.setFREE(fs.getFREE() - 1);
			itemService.updateFac(fs);
			RoomItem newRi = new RoomItem();
			newRi.setCOMM(dataJson.getString("comment"));
			newRi.setTAG(dataJson.getString("tag"));
			newRi.setFAC_ID(facId);
			newRi.setROOM_NUM(rn);
			newRi.setALLOCATE_TYPE("借用");
			newRi.setBORROW_DATE(dataJson.getDate("borrowDate"));
			newRi.setRETURN_DATE(dataJson.getDate("returnDate"));
			newRi.setSTATE("正常");
			roomService.insertRI(newRi);
		}

		logger.info(curUser.getNAME() + " borrow " + facId + " to " + rn );
		return 1;
	}

	@RequestMapping("/newFacRepair") // 新维修物品
	@ResponseBody
	public Integer newFacRepair(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int facId = dataJson.getIntValue("facID");

		FacSta fs = itemService.getFac(facId);
		if(fs.getFREE() <= 0)
		{
			return 0;
		}
		else {
			fs.setFREE(fs.getFREE() - 1);
			fs.setMAINTAIN(fs.getMAINTAIN() + 1);
			itemService.updateFac(fs);

			RoomItem newRi = new RoomItem();
			newRi.setCOMM("无");
			newRi.setTAG("-");
			newRi.setFAC_ID(facId);
			newRi.setROOM_NUM("-");
			newRi.setALLOCATE_TYPE("-");
			newRi.setSTATE("维修中");
			newRi.setMAINTAIN_DURATION(dataJson.getInteger("maintainDuration"));
			roomService.insertRI(newRi);
		}

		logger.info(curUser.getNAME() + " let 1 " + facId + " under repairing ");
		return 1;
	}




	@RequestMapping("/newFacBad") // 新报废物品
	@ResponseBody
	public Integer newFacBad(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wFac"))) == 0) {
			return 0;
		}

		JSONObject dataJson = JSONObject.parseObject(data);
		
		int facId = dataJson.getIntValue("facID");
		int count = dataJson.getIntValue("count");
		
		FacSta fs = itemService.getFac(facId);
		if(fs.getFREE() <= count)
		{
			return 0;
		}
		else {
			fs.setFREE(fs.getFREE() - count);
			fs.setBAD(fs.getBAD() + count);
			itemService.updateFac(fs);
		}
		
		logger.info(curUser.getNAME() + " let " + count + " " + facId + " bad ");
		return 1;
	}
	
	//小卖部
	
	@RequestMapping("/searchGoodsList") // GoodsName为null时，查询所有记录(只有当前的统计，没有历史统计记录)
	@ResponseBody
	public Map<String, Object> searchGoodsList(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rGrocery"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		String goods = dataJson.getString("GoodsName");
		
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = itemService.totalGrocery(goods);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<GroceryItem> record = itemService.getGrocery(goods, st, eachPage);

			ans.put("dataList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/buyGoods")
	@ResponseBody
	public Integer buyGoods(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wGrocery"))) == 0) {
			return 0;
		}
		
		try{
			int ID = dataJson.getIntValue("ID");
			int count = dataJson.getIntValue("count");
			double per = dataJson.getDoubleValue("per");
			double total = dataJson.getDoubleValue("total"); // money
			String d = dataJson.getString("date"); // YYYY-MM-DD HH-MM-SS
//			System.out.println(d);

			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(d);
//			System.out.println(date);

			GroceryItem gi = itemService.getCertainGrocery(ID);
			GroceryRunning gr = new GroceryRunning();
			gr.setALL_MONEY(total);
			gr.setCTIME(date);
			gr.setITEM_ID(ID);
			gr.setPER_MONEY(per);
			gr.setTOTAL(count);
			gr.setTYPE(1); // 1 buy, 2 sell, 3 use
			
			if(itemService.addGroceryRec(gr) == 1)
			{
				gi.setTOTAL(gi.getTOTAL() + count);
				gi.setAVALIABLE(gi.getAVALIABLE() + count);
				return itemService.updateGrocery(gi);
			}
			else return 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/sellGoods")
	@ResponseBody
	public Integer sellGoods(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wGrocery"))) == 0) {
			return 0;
		}
		
		try{
			int ID = dataJson.getIntValue("ID");
			int count = dataJson.getIntValue("count");
			double per = dataJson.getDoubleValue("per");
			double total = dataJson.getDoubleValue("total"); // money
			String d = dataJson.getString("date"); // YYYY-MM-DD HH-MM-SS
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(d);

			GroceryItem gi = itemService.getCertainGrocery(ID);

			if(count > gi.getAVALIABLE()) return 0;

			GroceryRunning gr = new GroceryRunning();
			gr.setALL_MONEY(total);
			gr.setCTIME(date);
			gr.setITEM_ID(ID);
			gr.setPER_MONEY(per);
			gr.setTOTAL(count);
			gr.setTYPE(2); // 1 buy, 2 sell, 3 waste
			
			if(itemService.addGroceryRec(gr) == 1)
			{
				gi.setAVALIABLE(gi.getAVALIABLE() - count);
				gi.setTOTAL_SOLD(gi.getTOTAL_SOLD() + count);
				gi.setTOTAL_BENIFIT(gi.getTOTAL_BENIFIT() + total - count * gi.getBUY_MONEY());
				return itemService.updateGrocery(gi);
			}
			else return 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
	
	@RequestMapping("/wasteGoods")
	@ResponseBody
	public Integer wasteGoods(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		
		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wGrocery"))) == 0) {
			return 0;
		}
		
		try{
			int ID = dataJson.getIntValue("ID");
			int count = dataJson.getIntValue("count");
			double per = dataJson.getDoubleValue("per");
			double total = dataJson.getDoubleValue("total"); // money
			String d = dataJson.getString("date"); // YYYY-MM-DD HH-MM-SS
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(d);

			GroceryItem gi = itemService.getCertainGrocery(ID);

			if(count > gi.getAVALIABLE()) return 0;


			GroceryRunning gr = new GroceryRunning();
			gr.setALL_MONEY(total);
			gr.setCTIME(date);
			gr.setITEM_ID(ID);
			gr.setPER_MONEY(per);
			gr.setTOTAL(count);
			gr.setTYPE(3); // 1 buy, 2 sell, 3 waste
			
			if(itemService.addGroceryRec(gr) == 1)
			{
				gi.setAVALIABLE(gi.getAVALIABLE() - count);
				gi.setTOTAL_BENIFIT(gi.getTOTAL_BENIFIT() - count * gi.getBUY_MONEY());
				gi.setTOTAL_LOSS(gi.getTOTAL_LOSS() + count);
				return itemService.updateGrocery(gi);
			}
			else return 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}

	@RequestMapping("/deleteGoods")
	@ResponseBody
	public Integer deleteGoods(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wGrocery"))) == 0) {
			return 0;
		}


		int ID = dataJson.getIntValue("ID");

		if(itemService.deleteGrocery(ID) != 0)
		{
			return 1;
		}
		else return 0;

	}


	
	@RequestMapping("/searchAnnualSale") // id为null时，查询所有记录(只有当前的统计，没有历史统计记录)
	@ResponseBody
	public Map<String, Object> searchAnnualSale(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rGrocery"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		int pageNumber = dataJson.getIntValue("pageNum");
		int id = dataJson.getIntValue("id");
		String s_from = dataJson.getString("from"); // YYYY-MM-DD HH-MM-SS
		String s_to = dataJson.getString("to");
		try{
			Date from = new SimpleDateFormat("yyyy-MM-dd").parse(s_from);
			Date to = new SimpleDateFormat("yyyy-MM-dd").parse(s_to);

			//数据库中时间为 yyyy-MM-dd HH:mm:ss 为了实现比较，将to 时间加一
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(to);
			calendar.add(Calendar.DATE,1);
			to = calendar.getTime();

			int eachPage = Config.settingsInt.get("list_size");
			int recordTotal = itemService.totalGroceryRunning(id, from, to);

			int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

			if (recordTotal != 0) {
				if (pageNumber > pageTotal)
					pageNumber = pageTotal;

				int st = (pageNumber - 1) * eachPage;
				List<GroceryRunning> record = itemService.getGroceryRunning(id, st, eachPage, from, to);

				ans.put("dataList", record);
			}

			ans.put("pageNow", pageNumber);
			ans.put("pageTotal", pageTotal);
			ans.put("recordTotal", recordTotal);
			return ans;

		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/addGoods") // 新增小卖部物品
	@ResponseBody
	public Integer addGoods(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		
		User curUser = (User) session.getAttribute("curUser");

		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wGrocery"))) == 0) {
			return 0;
		}
		
		try{
			String name = dataJson.getString("name");
			String type = dataJson.getString("type");
			String cat = dataJson.getString("cat");
			double buyMoney = dataJson.getDoubleValue("buyPrice");
			double sellMoney = dataJson.getDoubleValue("sellPrice");
			int total = dataJson.getIntValue("total");
			GroceryItem gi = new GroceryItem();
			
			gi.setAVALIABLE(total);
			gi.setBUY_MONEY(buyMoney);
			gi.setCAT(cat);
			gi.setNAME(name);
			gi.setSELL_MONEY(sellMoney);
			gi.setTOTAL(total);
			gi.setTYPE(type);
			gi.setTOTAL_SOLD(0);
			gi.setTOTAL_LOSS(0);
			gi.setTOTAL_BENIFIT(0.0);

			return itemService.addGrocery(gi);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return 0;
		}
	}
}
