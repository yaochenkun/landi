package org.ld.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.DailyService;
import org.ld.model.FacSta;
import org.ld.model.Guest;
import org.ld.model.Plan;
import org.ld.model.PlanDetail;
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

	@RequestMapping("/searchItemOverview") // 物品统计
	@ResponseBody
	public Map<String, Object> searchItemOverview(HttpSession session, @RequestBody String data) {
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("rFac"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		String type = dataJson.getString("type");
		int pageNumber = dataJson.getIntValue("pageNum");
		String cat = dataJson.getString("cat");
		String band = dataJson.getString("band");

		int eachPage = cur_env.getSettingsInt().get("list_size");
		int recordTotal = itemService.getTotal(type, cat, band);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);

		if (recordTotal != 0) {
			if (pageNumber > pageTotal)
				pageNumber = pageTotal;

			int st = (pageNumber - 1) * eachPage;
			List<FacSta> record = itemService.getFacByTypeCatBand(type, cat, band, st, eachPage);

			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}
	
	@RequestMapping("/searchItemList") // 根据物品种类、子类、品牌获取物品名称
	@ResponseBody
	public Map<String, Object> searchItemList(HttpSession session, @RequestBody String data) {
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("rFac"))) == 0) {
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
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		Map<String, Object> ans = new HashMap<String, Object>();
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("rBuy"))) == 0) {
			ans.put("State", "Invalid");
			return ans;
		} else {
			ans.put("State", "Valid");
		}

		JSONObject dataJson = JSONObject.parseObject(data);

		int pageNumber = dataJson.getIntValue("pageNum");

		int eachPage = cur_env.getSettingsInt().get("list_size");
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
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		return cur_env.getItem_type();
	}

	@RequestMapping("/getItemCat") // 根据物品种类type查询物品类别Cat
	@ResponseBody
	public Set<String> getItemCat(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		String type = dataJson.getString("type");

		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		return cur_env.getItem_cat().get(type);
	}

	@RequestMapping("/getItemCom") // 根据物品种类type查询物品品牌Com
	@ResponseBody
	public Set<String> getItemCom(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		String type = dataJson.getString("type");

		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		return cur_env.getItem_com().get(type);
	}

	@RequestMapping("/newPlan") // 新增采购计划
	@ResponseBody
	public Integer newPlan(HttpSession session, @RequestBody String data) {
		CurEnv cur_env = (CurEnv) session.getAttribute("CUR_ENV");
		if ((cur_env.getCur_user().getAUTH() & (0x01 << cur_env.getAuths().get("wBuy"))) == 0) {
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
				newPlan = itemService.getPlanByName(name);
				JSONObject obj = dataJson.getJSONObject("itemList");
				PlanDetail pd = new PlanDetail();
				pd.setPLAN_ID(newPlan.getID());
				for (String key : obj.keySet()) {
					JSONObject obj2 = obj.getJSONObject(key);
					pd.setALL_MONEY(obj2.getDouble("totalPrice"));
					pd.setCOMMENT(obj2.getString("comment"));
					pd.setTOTAL(obj2.getInteger("count"));
					sum += obj2.getDouble("totalPrice");

					Integer ID = obj2.getIntValue("FAC_ID");

					if (ID == 0) {
						FacSta newFs = new FacSta();

						newFs.setNAME(obj2.getString("FAC_NAME"));
						newFs.setCAT(obj2.getString("FAC_CAT"));
						newFs.setCOMMENT("");
						newFs.setCOMPANY(obj2.getString("FAC_BRAND"));
						newFs.setFAC_NUMBER(obj2.getString("FAC_NUMBER"));
						newFs.setTYPE(obj2.getString("FAC_TYPE"));
						newFs.setFREE(0);
						newFs.setBAD(0);
						newFs.setWORKING(0);
						newFs.setTOTAL(0);

						itemService.addNewFac(newFs);
						newFs = itemService.getFacByNumber(obj2.getString("FAC_NUM"));
						ID = newFs.getID();
					}

					pd.setFAC_ID(ID);
					pd.setFAC_NAME(obj2.getString("FAC_NAME"));
					pd.setFAC_NUMBER(obj2.getString("FAC_NUMBER"));

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
}
