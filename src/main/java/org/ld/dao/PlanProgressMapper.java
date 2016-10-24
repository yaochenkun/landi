package org.ld.dao;

import org.ld.model.PlanProgress;

public interface PlanProgressMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(PlanProgress record);

    int insertSelective(PlanProgress record);

    PlanProgress selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(PlanProgress record);

    int updateByPrimaryKey(PlanProgress record);
}