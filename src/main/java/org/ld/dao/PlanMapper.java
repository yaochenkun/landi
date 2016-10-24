package org.ld.dao;

import org.ld.model.Plan;

public interface PlanMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Plan record);

    int insertSelective(Plan record);

    Plan selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Plan record);

    int updateByPrimaryKey(Plan record);
}