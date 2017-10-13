package org.ld.service.impl;

import org.apache.log4j.Logger;
import org.ld.dao.DiaryReminderMapper;
import org.ld.dao.MailReminderMapper;
import org.ld.dao.ProblemMapper;
import org.ld.dao.SystemReminderMapper;
import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.model.Problem;
import org.ld.model.SystemReminder;
import org.ld.service.ProblemService;
import org.ld.service.ReminderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by ken on 2017/6/11.
 */
@Service("problemService")
public class ProblemServiceImpl implements ProblemService {

	private static Logger logger = Logger.getLogger("logDev");


	@Autowired
	private ProblemMapper problemMapper;


	@Override
	public Integer addProblem(Problem prob) {

		return problemMapper.insert(prob);
	}

	@Override
	public int getTotalProblems(String roomNum, Date reflectDate) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("REFLECT_DATE", reflectDate);

		return problemMapper.selectTotal(map);
	}

	@Override
	public List<Problem> getProblemsByPage(String roomNum, Date reflectDate, int startPage, int eachPage) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("REFLECT_DATE", reflectDate);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);

		return problemMapper.selectByPage(map);
	}

	@Override
	public Problem selectById(Integer id) {

		return problemMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateProblem(Problem prob) {

		return problemMapper.updateByPrimaryKey(prob);
	}


}
