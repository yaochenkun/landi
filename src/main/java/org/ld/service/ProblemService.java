package org.ld.service;

import org.ld.model.Problem;

import java.util.Date;
import java.util.List;

public interface ProblemService {

	Integer addProblem(Problem prob);

	int getTotalProblems(String roomNum, Date reflectDate);
	List<Problem> getProblemsByPage(String roomNum, Date reflectDate, int startPage, int eachPage);

	Problem selectById(Integer id);

	int updateProblem(Problem prob);
}
