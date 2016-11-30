package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.PlanDetail;
import org.ld.model.PlanProgress;

public interface PlanProgressMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(PlanProgress record);

	int insertSelective(PlanProgress record);

	PlanProgress selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(PlanProgress record);

	int updateByPrimaryKey(PlanProgress record);
	
	//add
    int getTotalByPlanId(Integer PID);
    
    List<PlanProgress> getPlanProgresses(HashMap<String, Object> map);
}