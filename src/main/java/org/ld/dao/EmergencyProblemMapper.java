package org.ld.dao;

import org.ld.model.EmergencyProblem;

public interface EmergencyProblemMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(EmergencyProblem record);

    int insertSelective(EmergencyProblem record);

    EmergencyProblem selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(EmergencyProblem record);

    int updateByPrimaryKey(EmergencyProblem record);
}