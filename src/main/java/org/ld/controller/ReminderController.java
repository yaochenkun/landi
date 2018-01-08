package org.ld.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.model.*;
import org.ld.service.ReminderService;
import org.ld.utils.BeanPrinter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * 事务提醒相关
 * Created by ken on 2017/6/11.
 */

@Controller
@RequestMapping("/reminder")
public class ReminderController {

	private static Logger logger = Logger.getLogger("logRec");

	@Autowired
	private ReminderService reminderService;

	/**
	 * 公用
	 */

	//根据日期查询所有站内信、个人日志、系统提醒reminder
	@RequestMapping("/searchReminderByDate")
	@ResponseBody
	public Map<String, Object> searchReminderByDate(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		Integer uid = dataJson.getInteger("uid");
		Date remindDate = dataJson.getDate("remindDate");

		//查询所有mailReminder
		List<MailReminder> mailReminders = reminderService.getInboxMailRemindersByDate(uid, remindDate);

		//查询所有diaryReminder
		List<DiaryReminder> diaryReminders = reminderService.getDiaryRemindersByDate(uid, remindDate);

		//查询所有systemReminder
		//....

		ans.put("mailReminder", mailReminders);
		ans.put("diaryReminder", diaryReminders);
		ans.put("systemReminder", null);
		return ans;
	}

	//根据月份查询当月所有有事务的天数
	@RequestMapping("/searchRemindDays")
	@ResponseBody
	public Map<String, Object> searchRemindDays(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<String, Object>();

//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		Integer uid = dataJson.getInteger("uid");
		Date month = dataJson.getDate("month");

		//将month转成当月1.1日
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(month);
		calendar.set(Calendar.DAY_OF_MONTH, 1);

		Date fromDate = calendar.getTime();
		System.out.println(fromDate);

		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		Date toDate = calendar.getTime();
		System.out.println(toDate);

		List<String> remindDays = reminderService.getRemindDaysInMonth(uid, fromDate, toDate);
		ans.put("dataList", remindDays);
		return ans;
	}

	/**
	 * 查询个人日志
	 */
	@RequestMapping("/searchReminderById_Type")
	@ResponseBody
	public Map<String, Object> searchReminderById_Type(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");
		String reminderType = dataJson.getString("reminderType");
		Object record = null;
		if("diaryReminder".equals(reminderType))
			record = reminderService.getDiaryReminderById(id);
		else if("mailReminder".equals(reminderType))
			record = reminderService.getMailReminderById(id);
		else
			record = null;
//			record = reminderService.getSystemReminderById(id);


		ans.put("State", "Valid");
		ans.put("record", record);
		return ans;
	}

	/**
	 * 更新完成状态
	 */
	@RequestMapping("/updateReminderStateById_Type") // 更新其它车费记录
	@ResponseBody
	public Integer updateReminderStateById_Type(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{

			Integer id = dataJson.getInteger("id");
			String reminderType = dataJson.getString("reminderType");

			if("diaryReminder".equals(reminderType)) {

				DiaryReminder reminder = reminderService.getDiaryReminderById(id);
				reminder.setSTATE("完成");
				reminder.setEDIT_TIME(new Date());
				return reminderService.updateDiaryReminder(reminder);

			} else if("mailReminder".equals(reminderType)) {

				MailReminder reminder = reminderService.getMailReminderById(id);
				reminder.setSTATE("完成");
				reminder.setEDIT_TIME(new Date());
				return reminderService.updateMailReminder(reminder);

			} else {

				//  reminder = reminderService.getSystemReminderById(id);
				return 1;
			}

		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}



	/**
	 * 1.个人日志
	 */


	/**
	 * 添加个人日志
	 */
	@RequestMapping("/addDiaryReminder")
	@ResponseBody
	public Integer addDiaryReminder(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
//		//权限
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		};

		JSONObject dataJson = JSONObject.parseObject(data);
		DiaryReminder dr = new DiaryReminder();
		dr.setUSER_ID(dataJson.getInteger("uid"));
		dr.setTITLE(dataJson.getString("title"));
		dr.setCONTENT(dataJson.getString("content"));
		dr.setREMIND_DATE(dataJson.getDate("remindDate"));
		dr.setSTATE("未完成");
		dr.setEDIT_TIME(new Date());


		if(reminderService.addDiaryReminder(dr) == 1) {
			logger.info(curUser.getNAME() + " successfully add a diary reminder");
			return 1;
		} else {
			logger.error(curUser.getNAME() + "failed to add a diary reminder");
			return 0;
		}
	}

	/**
	 * 查询个人日志
	 */
	@RequestMapping("/searchDiaryRemindersByPage")
	@ResponseBody
	public Map<String, Object> searchDiaryRemindersByPage(HttpSession session, @RequestBody String data) {


		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer uid = dataJson.getIntValue("uid");
		int pageNumber = dataJson.getIntValue("pageNum");
		Date remindDate = dataJson.getDate("remindDate");
		String keyword = dataJson.getString("keyword");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = reminderService.getTotalDiaryReminders(uid, keyword, remindDate);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;

			int startPage = (pageNumber - 1) * eachPage;
			List<DiaryReminder> record = reminderService.getDiaryRemindersByPage(uid, keyword, remindDate, startPage, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}


	/**
	 * 删除个人日志
	 */
	@RequestMapping("/deleteDiaryReminderById") // 添加车费记录
	@ResponseBody
	public Integer deleteDiaryReminderById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
//		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{
			Integer id = dataJson.getInteger("id");
			return reminderService.deleteDiaryReminderById(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 更新个人日志
	 */
	@RequestMapping("/updateDiaryReminderById") // 更新其它车费记录
	@ResponseBody
	public Integer updateDiaryReminderById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{

			Integer id = dataJson.getInteger("id");
			DiaryReminder bean = reminderService.getDiaryReminderById(id);
			bean.setTITLE(dataJson.getString("title"));
			bean.setCONTENT(dataJson.getString("content"));
			bean.setREMIND_DATE(dataJson.getDate("remindDate"));
			bean.setEDIT_TIME(new Date());

			return reminderService.updateDiaryReminder(bean);

		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}

	/**
	 * 查询个人日志
	 */
	@RequestMapping("/searchDiaryReminderById")
	@ResponseBody
	public Map<String, Object> searchDiaryReminderById(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");

		DiaryReminder record = reminderService.getDiaryReminderById(id);
		ans.put("State", "Valid");
		ans.put("record", record);

		return ans;
	}


	/**
	 * 2.站内信
	 */

	/**
	 * 添加站内信
	 */
	@RequestMapping("/addMailReminder")
	@ResponseBody
	public Integer addMailReminder(HttpSession session, @RequestBody String data) {
		User curUser = (User) session.getAttribute("curUser");
//		//权限
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		};

		JSONObject dataJson = JSONObject.parseObject(data);
		String rid = dataJson.getString("rid");
		String rname = dataJson.getString("rname");
		String[] rids = rid.split(",");
		String[] rnames = rname.split(",");

		int result = 1;
		for(int i = 0; i < rids.length; i++) {

			MailReminder mr = new MailReminder();
			mr.setSENDER_ID(dataJson.getInteger("sid"));
			mr.setSENDER_NAME(dataJson.getString("sname"));
			mr.setRECEIVER_ID(Integer.parseInt(rids[i]));
			mr.setRECEIVER_NAME(rnames[i]);
			mr.setRECEIVE_STATE("待接受");
			mr.setREPLY("");
			mr.setTITLE(dataJson.getString("title"));
			mr.setCONTENT(dataJson.getString("content"));
			mr.setREMIND_DATE(dataJson.getDate("remindDate"));
			mr.setSTATE("未完成");
			mr.setEDIT_TIME(new Date());


			if(reminderService.addMailReminder(mr) == 1) {
				logger.info(curUser.getNAME() + " successfully add a mail reminder");
				result &= 1;
			} else {
				logger.error(curUser.getNAME() + "failed to add a mail reminder");
				result &= 0;
			}
		}

		return result;
	}

	/**
	 * 查询站内信(由发件人找)
	 */
	@RequestMapping("/searchMailRemindersByPage")
	@ResponseBody
	public Map<String, Object> searchMailRemindersByPage(HttpSession session, @RequestBody String data) {


		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer sid = dataJson.getIntValue("sid");
		int pageNumber = dataJson.getIntValue("pageNum");
		Date remindDate = dataJson.getDate("remindDate");
		String keyword = dataJson.getString("keyword");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = reminderService.getTotalMailReminders(sid, keyword, remindDate);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;

			int startPage = (pageNumber - 1) * eachPage;
			List<MailReminder> record = reminderService.getMailRemindersByPage(sid, keyword, remindDate, startPage, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	/**
	 * 查询站内信(由收件人找)
	 */
	@RequestMapping("/searchInboxMailRemindersByPage")
	@ResponseBody
	public Map<String, Object> searchInboxMailRemindersByPage(HttpSession session, @RequestBody String data) {


		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer rid = dataJson.getIntValue("rid");
		int pageNumber = dataJson.getIntValue("pageNum");
		Date remindDate = dataJson.getDate("remindDate");
		String keyword = dataJson.getString("keyword");

		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = reminderService.getTotalInBoxMailReminders(rid, keyword, remindDate);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;

			int startPage = (pageNumber - 1) * eachPage;
			List<MailReminder> record = reminderService.getInboxMailRemindersByPage(rid, keyword, remindDate, startPage, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;
	}

	/**
	 * 删除站内信
	 */
	@RequestMapping("/deleteMailReminderById") // 添加车费记录
	@ResponseBody
	public Integer deleteMailReminderById(HttpSession session,  @RequestBody String data){
		JSONObject dataJson = JSONObject.parseObject(data);
//		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{
			Integer id = dataJson.getInteger("id");
			return reminderService.deleteMailReminderById(id);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 更新站内信
	 */
	@RequestMapping("/updateMailReminderById") // 更新其它车费记录
	@ResponseBody
	public Integer updateMailReminderById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{

			Integer id = dataJson.getInteger("id");
			MailReminder bean = reminderService.getMailReminderById(id);
			bean.setRECEIVER_ID(bean.getRECEIVER_ID());
			bean.setRECEIVER_NAME(bean.getRECEIVER_NAME());
			bean.setTITLE(dataJson.getString("title"));
			bean.setCONTENT(dataJson.getString("content"));
			bean.setREMIND_DATE(dataJson.getDate("remindDate"));
			bean.setRECEIVE_STATE(bean.getRECEIVE_STATE());
			bean.setREPLY(bean.getREPLY());
			bean.setEDIT_TIME(new Date());

			return reminderService.updateMailReminder(bean);

		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}

	/**
	 * 查询站内信
	 */
	@RequestMapping("/searchMailReminderById")
	@ResponseBody
	public Map<String, Object> searchMailReminderById(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		//放行，获取数据
		JSONObject dataJson = JSONObject.parseObject(data);
		Integer id = dataJson.getInteger("id");

		MailReminder record = reminderService.getMailReminderById(id);
		ans.put("State", "Valid");
		ans.put("record", record);

		return ans;
	}


	/**
	 * 接受站内信
	 */
	@RequestMapping("/acceptMailById")
	@ResponseBody
	public Integer acceptMailById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{

			Integer id = dataJson.getInteger("id");
			MailReminder bean = reminderService.getMailReminderById(id);
			bean.setRECEIVER_ID(bean.getRECEIVER_ID());
			bean.setRECEIVER_NAME(bean.getRECEIVER_NAME());
			bean.setTITLE(bean.getTITLE());
			bean.setCONTENT(bean.getCONTENT());
			bean.setREMIND_DATE(bean.getREMIND_DATE());
			bean.setREPLY(bean.getREPLY());
			bean.setRECEIVE_STATE("已接受");
			bean.setEDIT_TIME(new Date());

			return reminderService.updateMailReminder(bean);

		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}


	/**
	 * 回复站内信
	 */
	@RequestMapping("/replyMailById")
	@ResponseBody
	public Integer replyMailById(HttpSession session,  @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("wRoom"))) == 0) {
//			return 0;
//		}

		try{

			Integer id = dataJson.getInteger("id");
			MailReminder bean = reminderService.getMailReminderById(id);
			bean.setRECEIVER_ID(bean.getRECEIVER_ID());
			bean.setRECEIVER_NAME(bean.getRECEIVER_NAME());
			bean.setTITLE(bean.getTITLE());
			bean.setCONTENT(bean.getCONTENT());
			bean.setREMIND_DATE(bean.getREMIND_DATE());
			bean.setREPLY(dataJson.getString("reply"));
			bean.setRECEIVE_STATE("已回复");
			bean.setEDIT_TIME(new Date());

			return reminderService.updateMailReminder(bean);

		}catch(Exception e){
			System.err.println(e);
			return 0;
		}
	}




	/**
	 * 3.系统提醒
	 */
}
