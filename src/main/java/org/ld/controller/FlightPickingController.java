package org.ld.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.ld.app.CurEnv;
import org.ld.model.FlightPicking;
import org.ld.service.FlightPickingService;
import org.ld.utils.BeanPrinter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/flightPicking")
public class FlightPickingController {

	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private FlightPickingService flightPickingService;
	
	@RequestMapping("/addFlightPicking")
	@ResponseBody
	public Integer addFlightPicking(HttpSession session, @RequestBody String data) {
		CurEnv curEnv = (CurEnv) session.getAttribute("CUR_ENV");
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
			logger.info(curEnv.getCur_user().getNAME() + " successfully add a flight picking record " + BeanPrinter.toString(bean));
			return 1;
		} else {
			logger.error(curEnv.getCur_user().getNAME() + "failed to add a flight picking record" + BeanPrinter.toString(bean));
			return 0;
		}
	}
	
	
	@RequestMapping("/searchFlightPickingByRoomNumber_Time")
	@ResponseBody
	public Map<String, Object> searchFlightPickingByRoomNumber_Time(HttpSession session, @RequestBody String data) {
		//验证权限
		CurEnv curEnv = (CurEnv) session.getAttribute("CUR_ENV");
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
		int eachPage = curEnv.getSettingsInt().get("list_size");
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
