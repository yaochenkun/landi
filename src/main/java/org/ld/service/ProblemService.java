package org.ld.service;

import org.ld.model.EmergencyProblem;
import org.ld.model.Problem;
import org.ld.model.ProblemReply;

import java.util.Date;
import java.util.List;

public interface ProblemService {

	Integer addProblem(Problem prob);

	int getTotalProblems(String roomNum, Date reflectDate);
	List<Problem> getProblemsByPage(String roomNum, Date reflectDate, int startPage, int eachPage);

	Problem selectById(Integer id);

	int updateProblem(Problem prob);

	// lyd
	int insertEmergencyProblem(EmergencyProblem e);

	int getTotalManageProblems(String room , Date from,Date to);
	List<Problem> getManageProblems(String roomNum , Date from , Date to, int startPage, int eachPage);

	//problem_replay

	ProblemReply getProblemReplyByProblemID(int problemId);  //根据ID挑选最后的一条记录
	int deleteProblem(int ID);
	int deleteProblemReplys(int ID);
	int insertProblemManage(ProblemReply reply);
	List<ProblemReply> getAllProblemReplyByProblemID(int ID); //根据ID 挑选所有的记录
	int deleteProblemReplyByID(int ID);
}
