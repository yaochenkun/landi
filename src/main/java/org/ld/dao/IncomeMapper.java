package org.ld.dao;

import org.ld.model.Income;

public interface IncomeMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Income record);

    int insertSelective(Income record);

    Income selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Income record);

    int updateByPrimaryKey(Income record);
}