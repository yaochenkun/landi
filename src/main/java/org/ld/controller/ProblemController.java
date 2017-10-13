package org.ld.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.model.Problem;
import org.ld.model.User;
import org.ld.service.ProblemService;
import org.ld.service.ReminderService;
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
}
