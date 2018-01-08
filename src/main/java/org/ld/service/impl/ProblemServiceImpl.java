package org.ld.service.impl;

import org.apache.log4j.Logger;
import org.ld.dao.*;
import org.ld.model.*;
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

	@Autowired
	private EmergencyProblemMapper emergencyProblemMapper;

	@Autowired
	private ProblemReplyMapper problemReplyMapper;

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
	public int getTotalManageProblems(String roomNum, Date from, Date to) {
		HashMap<String ,Object> map = new HashMap<>();
		map.put("ROOM_NUM",roomNum);
		map.put("FROM",from);
		map.put("TO",to);
		return problemMapper.selectTotalInManage(map);
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
	public List<Problem> getManageProblems(String roomNum, Date from, Date to, int startPage, int eachPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("FROM", from);
		map.put("TO", to);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);

		return problemMapper.selectInManage(map);
	}

	@Override
	public Problem selectById(Integer id) {

		return problemMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateProblem(Problem prob) {

		return problemMapper.updateByPrimaryKey(prob);
	}

	@Override
	public int insertEmergencyProblem(EmergencyProblem e) {
		return emergencyProblemMapper.insertSelective(e);
	}

	@Override
	public ProblemReply getProblemReplyByProblemID(int problemId) {
		return problemReplyMapper.selectByProblemID(problemId);
	}

	@Override
	public int deleteProblem(int ID) {
		return problemMapper.deleteByPrimaryKey(ID);
	}

	@Override
	public int deleteProblemReplys(int ID) {
		return problemReplyMapper.deleteByProblemID(ID);
	}

	@Override
	public int insertProblemManage(ProblemReply reply) {
		return problemReplyMapper.insert(reply);
	}

	@Override
	public List<ProblemReply> getAllProblemReplyByProblemID(int ID) {
		return problemReplyMapper.selectAllByProblemID(ID);
	}

	@Override
	public int deleteProblemReplyByID(int ID) {
		return problemReplyMapper.deleteByPrimaryKey(ID);
	}
}
