package org.ld.controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.model.User;
import org.ld.service.ProblemService;
import org.ld.service.ReminderService;
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


}
