package org.ld.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.dao.EmergencyProblemMapper;
import org.ld.model.*;
import org.ld.service.ProblemService;
import org.ld.service.ReminderService;
import org.ld.service.UserService;
import org.ld.utils.Para;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 事务提醒相关
 * Created by ken on 2017/6/11.
 */

@Controller
@RequestMapping("/problem")
public class ProblemController {

	private static Logger logger = Logger.getLogger("logRec");

	@Autowired
	private ProblemService problemService;

	@Autowired
	private ReminderService reminderService;

	@Autowired
	private UserService userService;

	@RequestMapping("/getProbType") // 查询系统物品种类（家电、家具）
	@ResponseBody
	public Set<String> getProbType(HttpSession session) {
		return Config.getProb_type();
	}

	@RequestMapping("/getProbSubtype") // 根据物品种类type查询物品类别Cat
	@ResponseBody
	public Set<String> getProbSubtype(HttpSession session, @RequestBody String data) {
		JSONObject dataJson = JSONObject.parseObject(data);
		String type = dataJson.getString("type");

		return Config.getProb_subtype().get(type);
	}


	/**
	 * 分页查询
	 */
	@RequestMapping("/searchProblemsByPage")
	public @ResponseBody Map<String, Object> searchProblemsByPage(HttpSession session, @RequestBody Map<String, Object> params) throws ParseException {

		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		String roomNum = (String) params.get("roomNum");
		Date reflectDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("reflectDate"));

		int pageNumber = (Integer) params.get("pageNum");


		//分页
		int eachPage = Config.getSettingsInt().get("list_size");
		int recordTotal = problemService.getTotalProblems(roomNum, reflectDate);
		int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
		if(recordTotal != 0) {
			if(pageNumber > pageTotal)
				pageNumber = pageTotal;

			int startPage = (pageNumber - 1) * eachPage;
			List<Problem> record = problemService.getProblemsByPage(roomNum, reflectDate, startPage, eachPage);
			ans.put("pageList", record);
		}

		ans.put("pageNow", pageNumber);
		ans.put("pageTotal", pageTotal);
		ans.put("recordTotal", recordTotal);

		return ans;

	}



	/**
	 * 添加问题分类
	 */
	@RequestMapping("/addProbType")
	public @ResponseBody Integer addProbType(HttpSession session, @RequestBody Map<String, String>  params) {
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			return 0;
//		}

		//添加
		Config.getProb_type().add(params.get("name"));

		if (Para.setPair("prob_type", Config.getProb_type()) == 1) {

			return 1;
		} else {

			return 0;
		}
	}

	/**
	 * 添加问题子类
	 */
	@RequestMapping("/addProbSubType")
	public @ResponseBody Integer addProbSubType(HttpSession session, @RequestBody Map<String, String>  params) {
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			return 0;
//		}

		String type = params.get("typeName");
		String name = params.get("name");

		//添加
		Map<String, String> subTypeMap = Para.getParaPair("prob_subtype", 0, 1);

		if(subTypeMap.containsKey(type)) {

			subTypeMap.put(type, subTypeMap.get(type) + "," + name);

		} else {

			subTypeMap.put(type, name);
		}


		if (Para.setPair("prob_subtype", subTypeMap) == 1) {

			return 1;
		} else {

			return 0;
		}
	}


	/**
	 * 添加问题（客房报修-非维修人员-首页）
	 */
	/**
	 * 添加问题（新增报修-维修人员, 返回ID号）
	 */
	@RequestMapping("/addProblemByOutsider")
	public @ResponseBody Integer addProblemByOutsider(HttpSession session, @RequestBody Map<String, Object>  params) throws ParseException {
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			return 0;
//		}

		String roomNum = (String) params.get("roomNum");
		String roomState = (String) params.get("roomState");
		String guestName = (String) params.get("guestName");
		Date reflectDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("reflectDate"));
		String description = (String) params.get("description");
		Date solveDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("solveDate"));
		String outsiderReason = (String) params.get("outsiderReason");
		String outsiderComment = (String) params.get("outsiderComment");


		Problem prob = new Problem();
		prob.setROOM_NUM(roomNum);
		prob.setROOM_STATE(roomState);
		prob.setGUEST_NAME(guestName);
		prob.setREFLECT_DATE(reflectDate);
		prob.setDESCRIPTION(description);
		prob.setSOLVE_DATE(solveDate);
		prob.setOUTSIDER_COMMENT(outsiderComment);
		prob.setOUTSIDER_REASON(outsiderReason);
		prob.setIS_LEMANAGE(0);


		//申报人
		prob.setREFLECTER_ID(curUser.getID());
		prob.setREFLECTER_NAME(curUser.getNAME());


		if(problemService.addProblem(prob) == 1) {

			return prob.getID();
		} else {

			return 0;
		}
	}



	/**
	 * 添加问题（新增报修-维修人员, 返回ID号）
	 */
	@RequestMapping("/addProblem")
	public @ResponseBody Integer addProblem(HttpSession session, @RequestBody Map<String, Object>  params) throws ParseException {
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			return 0;
//		}

		String roomNum = (String) params.get("roomNum");
		String roomState = (String) params.get("roomState");
		String guestName = (String) params.get("guestName");
		Date reflectDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("reflectDate"));
		String type = (String) params.get("type");
		String subType = (String) params.get("subType");
		Integer isLEManage = (Integer) params.get("isLEManage");
		String description = (String) params.get("description");
		String level = (String) params.get("level");
		Date solveDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("solveDate"));
		String repairerComment = (String) params.get("repairerComment");


		Problem prob = new Problem();
		prob.setROOM_NUM(roomNum);
		prob.setROOM_STATE(roomState);
		prob.setGUEST_NAME(guestName);
		prob.setREFLECT_DATE(reflectDate);
		prob.setTYPE(type);
		prob.setSUBTYPE(subType);
		prob.setIS_LEMANAGE(isLEManage);
		prob.setDESCRIPTION(description);
		prob.setLEVEL(level);
		prob.setSOLVE_DATE(solveDate);
		prob.setREPAIRER_COMMENT(repairerComment);

		//申报人
		prob.setREFLECTER_ID(curUser.getID());
		prob.setREFLECTER_NAME(curUser.getNAME());


		if(problemService.addProblem(prob) == 1) {

			return prob.getID();
		} else {

			return 0;
		}
	}


	/**
	 * 处理问题
	 */
	@RequestMapping("/dealProblem")
	public @ResponseBody Integer dealProblem(HttpSession session, @RequestBody Map<String, Object>  params) throws ParseException {
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rwRate"))) == 0) {
//			return 0;
//		}


		Integer id = (Integer) params.get("id");
		Problem prob = problemService.selectById(id);
		if(prob == null) {
			return 0;
		}

		String type = (String) params.get("type");
		String subType = (String) params.get("subType");
		Integer isLEManage = (Integer) params.get("isLEManage");
		String description = (String) params.get("description");
		String level = (String) params.get("level");
		Date solveDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) params.get("solveDate"));
		String repairerComment = (String) params.get("repairerComment");


		prob.setTYPE(type);
		prob.setSUBTYPE(subType);
		prob.setIS_LEMANAGE(isLEManage);
		prob.setDESCRIPTION(description);
		prob.setLEVEL(level);
		prob.setSOLVE_DATE(solveDate);
		prob.setREPAIRER_COMMENT(repairerComment);



		return problemService.updateProblem(prob);
	}


	/**
	 * 查询id对应的问题信息
	 */
	@RequestMapping("/searchProblemById")
	@ResponseBody
	public Map<String, Object> searchProblemById(HttpSession session, @RequestBody String data) {
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

		Problem record = problemService.selectById(id);
		ans.put("State", "Valid");
		ans.put("record", record);

		return ans;
	}


	/**
	 * 处理问题（处理-维修人员）
	 */


	// 多文件上传
	@RequestMapping(value = "/uploadProblemPicture", method = RequestMethod.POST)
	public String uploadProblemPicture(@RequestParam("file") MultipartFile[] file, Integer problemId, HttpServletRequest request) {
		// System.out.println(request.getSession().getServletContext().getRealPath(""));
		System.out.println("problemId：" + problemId);

		// 遍历文件
		String  foldersName = "problem_picture";
		for (MultipartFile mul : file) {
			System.out.println(mul.getName() + "---" + mul.getContentType() + "---" + mul.getOriginalFilename());
			try {
				if (!mul.isEmpty()) {
					Streams.copy(mul.getInputStream(),
							new FileOutputStream(request.getSession().getServletContext().getRealPath("")
									+ "/resources/"+ foldersName +"/" + problemId + mul.getOriginalFilename()
									.substring(mul.getOriginalFilename().lastIndexOf("."))),
							true);
				}

			} catch (IOException e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			}
		}

		return "redirect:/views/user/roomItem/assetRepairNew.jsp";
	}

	// 多文件上传
	@RequestMapping(value = "/uploadProblemPictureByDeal", method = RequestMethod.POST)
	public String uploadProblemPictureByDeal(@RequestParam("file") MultipartFile[] file, Integer problemId, HttpServletRequest request) {
		// System.out.println(request.getSession().getServletContext().getRealPath(""));
		System.out.println("problemId：" + problemId);

		// 遍历文件
		String  foldersName = "problem_picture";
		for (MultipartFile mul : file) {
			System.out.println(mul.getName() + "---" + mul.getContentType() + "---" + mul.getOriginalFilename());
			try {
				if (!mul.isEmpty()) {
					Streams.copy(mul.getInputStream(),
							new FileOutputStream(request.getSession().getServletContext().getRealPath("")
									+ "/resources/"+ foldersName +"/" + problemId + mul.getOriginalFilename()
									.substring(mul.getOriginalFilename().lastIndexOf("."))),
							true);
				}

			} catch (IOException e) {
				System.out.println("文件上传失败");
				e.printStackTrace();
			}
		}

		return "redirect:/views/user/roomItem/assetRepairDeal.jsp?id=" + problemId;
	}

	/**
	 * 添加紧急事件
	 */
	@RequestMapping("/addEmergencyProblem")
	@ResponseBody
	public Integer addEmergencyProblem(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}
		try{
			//放行，获取数据
			JSONObject dataJson = JSONObject.parseObject(data);
			String rnum = dataJson.getString("roomNum");
			String state = dataJson.getString("state");
			String guest = dataJson.getString("guest");
			String occurTime = dataJson.getString("occurTime");
			String arriveTime = dataJson.getString("arriveTime");
			String shenbaoren = dataJson.getString("shenbaoren");
			String dealing = dataJson.getString("dealing");
			String detail = dataJson.getString("detail");

			Date occur = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(occurTime);
			Date arrive = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(arriveTime);

			EmergencyProblem em = new EmergencyProblem();
			em.setROOM_NUM(rnum);
			em.setGUEST_NAME(guest);
			em.setROOM_STATE(state);
			em.setOCCUR_TIME(occur);
			em.setATTENDANCE_TIME(arrive);
			em.setDECLARANT(shenbaoren);
			em.setDEALING(dealing);
			em.setDAMAGE_DETAIL(detail);

			//发送给所有人
			List<User> recordList = userService.getAllUsers();
			String rid = "";
			String rname = "";
			for (User u :recordList){
				rid += u.getID() + ",";
				rname += u.getNAME() + ",";

			}
			String[] rids_t = rid.split(",");
			String[] rnames_t = rname.split(",");

			String[] rids = new String[rids_t.length-1];
			String[] rnames =  new String[rnames_t.length-1];
			System.arraycopy(rids_t,0,rids , 0,rids_t.length-1);
			System.arraycopy(rnames_t,0,rnames , 0,rnames_t.length-1);

			for(int i = 0; i < rids.length; i++) {

				MailReminder mr = new MailReminder();
				mr.setSENDER_ID(0);
				mr.setSENDER_NAME("ADMIN");
				mr.setRECEIVER_ID(Integer.parseInt(rids[i]));
				mr.setRECEIVER_NAME(rnames[i]);
				mr.setRECEIVE_STATE("待接受");
				mr.setREPLY("");
				mr.setTITLE("紧急事件处理");
				mr.setCONTENT("您有一个紧急事件亟待处理!");
				mr.setREMIND_DATE(occur);
				mr.setSTATE("未完成");
				mr.setEDIT_TIME(new Date());

				reminderService.addMailReminder(mr);
			}

			//发送到problem表中，level 默认为1
			Problem problem = new Problem();
			problem.setROOM_NUM(em.getROOM_NUM());
			problem.setROOM_STATE(em.getROOM_STATE());
			problem.setGUEST_NAME(em.getGUEST_NAME());
			problem.setREFLECT_DATE(em.getOCCUR_TIME());
			problem.setSOLVE_DATE(em.getATTENDANCE_TIME());
			problem.setREFLECTER_NAME(em.getDECLARANT());
			problem.setLEVEL("一级");
			problem.setDESCRIPTION(detail);  //紧急事件表中detail字段的数据 未处理放入problem表description中， 后续处理

			return problemService.insertEmergencyProblem(em);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}

	}

	@RequestMapping("/searchProblemsManage")  //维修管理
	@ResponseBody
	public  Map<String, Object> searchProblemsManage(HttpSession session, @RequestBody String data){
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}
		try{
			JSONObject dataJson = JSONObject.parseObject(data);

			String roomNum = dataJson.getString("rnum");
			if(roomNum.equals("")){
				roomNum = null;
			}
			int pageNumber = dataJson.getInteger("pageNum");

			Date from = null;
			if(!dataJson.getString("from").equals("")){
				from = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("from"));
			}

			Date to = null;
			if(!dataJson.getString("to").equals("")){
				to = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("to"));
			}

			//分页
			int eachPage = Config.getSettingsInt().get("list_size");
			int recordTotal = problemService.getTotalManageProblems(roomNum, from,to);

			int pageTotal = (int) Math.ceil((float) recordTotal / eachPage);
			if(recordTotal != 0) {
				if(pageNumber > pageTotal)
					pageNumber = pageTotal;

				int startPage = (pageNumber - 1) * eachPage;
				List<Problem> record = problemService.getManageProblems(roomNum , from , to ,startPage, eachPage);

				class Model{
					public Integer problemID;
					public String roomNum;
					public String roomState;
					public String des;
					public String comment;
					public String problemState; //问题状态
					public String level;
					public Date reportDate;
					public String problemType;
					public String subType;
					public Date solveDate;
					public Date last_replay_date;
					public String last_reply_des;
					public String infoSource;
					public String department;
					public Double fare;
					public Integer unSolveDay; //未解决天数
					public String reportState; //报修时间状态
				}

				List<Model> model = new ArrayList<>();
				//维修管理信息由 problem problem_reply 表合并产生
				for (Problem problem :record){
					ProblemReply replay = problemService.getProblemReplyByProblemID(problem.getID());
					Model temp = new Model();
					temp.problemID = problem.getID();
					temp.roomNum = problem.getROOM_NUM();
					temp.roomState = problem.getROOM_STATE();
					temp.des = problem.getDESCRIPTION();
					temp.comment = problem.getREPAIRER_COMMENT();
					temp.level = problem.getLEVEL();
					temp.reportDate = problem.getREFLECT_DATE();
					temp.problemType = problem.getTYPE();
					temp.subType = problem.getSUBTYPE();
					temp.solveDate = problem.getSOLVE_DATE();

					if(replay != null){
						temp.problemState = replay.getPROBLEM_STATE();
						temp.last_replay_date = replay.getLAST_REPLAY_DATE();
						temp.last_reply_des = replay.getLAST_REPLAY_DESCRIPTION();
						temp.infoSource = replay.getINFO_SOURCE();
						temp.department = replay.getDEPARTMENT();
						temp.fare = replay.getFARE();
					}
					if(temp.problemState == null){
						temp.problemState = "跟踪中";
					}
					model.add(temp);
				}
				ans.put("pageList", model);
			}

			ans.put("pageNow", pageNumber);
			ans.put("pageTotal", pageTotal);
			ans.put("recordTotal", recordTotal);

			return ans;
		}catch(ParseException e){
			System.out.println(5);

			logger.error(e.getCause());
			return null;
		}


	}

	/**
	 * 维修管理 删除
	 */
	@RequestMapping("/deleteInProblemManage")
	@ResponseBody
	public Integer deleteInProblemManage(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}


		JSONObject dataJson = JSONObject.parseObject(data);
		Integer ID = dataJson.getInteger("ID");
		problemService.deleteProblemReplys(ID);

		return problemService.deleteProblem(ID);


	}

	/**
	 * 维修管理 搁置处理
	 */
	@RequestMapping("/delayDealInProblemManage")
	@ResponseBody
	public Integer delayDealInProblemManage(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}


		JSONObject dataJson = JSONObject.parseObject(data);
		Integer ID = dataJson.getInteger("ID");
		ProblemReply reply = new ProblemReply();

		//当前只对最近回复日期 和问题状态进行填充    后续按需求更改
		reply.setPROBLEM_ID(ID);
		reply.setLAST_REPLAY_DATE(new Date());
		reply.setPROBLEM_STATE("搁置处理");


		return problemService.insertProblemManage(reply);


	}

	/**
	 * 维修管理 搁置处理
	 */
	@RequestMapping("/searchProblemReply")
	@ResponseBody
	public Map<String, Object> searchProblemReply(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
		Map<String, Object> ans = new HashMap<>();
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}


		JSONObject dataJson = JSONObject.parseObject(data);
		Integer ID = dataJson.getInteger("ID");
		List<ProblemReply> list = problemService.getAllProblemReplyByProblemID(ID);
		ans.put("recordTotal",list.size());
		ans.put("list",list);

		return ans;

	}

	/**
	 * 维修管理 增加
	 */
	@RequestMapping("/addProblemReply")
	@ResponseBody
	public Integer addProblemReply(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		try{
			JSONObject dataJson = JSONObject.parseObject(data);
			Integer ID = dataJson.getInteger("ID");
			Date replyDate = new SimpleDateFormat("yyyy-MM-dd").parse(dataJson.getString("replyDate")) ;
			String description = dataJson.getString("description");
			String infoSource = dataJson.getString("infoSourceInput");
			String department = dataJson.getString("department");
			String state = dataJson.getString("state");
			Double fare = dataJson.getDouble("fare");
			String fareDetail = dataJson.getString("fareDetail");
			String fareAffort = dataJson.getString("fareAfford");
			String thisMonthPay = dataJson.getString("thisMonthDay"); //当月月结
			String aleady = dataJson.getString("alreadyPay"); //已确认收款

			ProblemReply reply = new ProblemReply();
			reply.setPROBLEM_ID(ID);
			reply.setLAST_REPLAY_DATE(replyDate);
			reply.setLAST_REPLAY_DESCRIPTION(description);
			reply.setPROBLEM_STATE(state);
			reply.setINFO_SOURCE(infoSource);
			reply.setDEPARTMENT(department);
			reply.setFARE(fare);
			reply.setFARE_DETAIL(fareDetail);
			reply.setFARE_PAY(fareAffort);

			return problemService.insertProblemManage(reply);
		}catch(ParseException e){
			logger.error(e.getCause());
			return 0;
		}


	}

	/**
	 * 维修管理 删除某条记录
	 */
	@RequestMapping("/deleteCertainProblemReply")
	@ResponseBody
	public Integer deleteCertainProblemReply(HttpSession session, @RequestBody String data) {
		//验证权限
		User curUser = (User) session.getAttribute("curUser");
//		if ((curUser.getAUTH() & (0x01 << Config.getAuths().get("rRoom"))) == 0) {
//			ans.put("State", "Invalid");
//			return ans;
//		} else {
//			ans.put("State", "Valid");
//		}

		JSONObject dataJson = JSONObject.parseObject(data);
		Integer ID = dataJson.getInteger("ID");

		return problemService.deleteProblemReplyByID(ID);

	}

}
