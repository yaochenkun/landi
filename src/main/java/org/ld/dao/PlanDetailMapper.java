package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.PlanDetail;

public interface PlanDetailMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(PlanDetail record);

    int insertSelective(PlanDetail record);

    PlanDetail selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(PlanDetail record);

    int updateByPrimaryKey(PlanDetail record);
    
    //add
    int getTotalByPlanId(Integer PID);
    
    List<PlanDetail> getPlanDetails(HashMap<String, Object> map);
}