package org.ld.dao;

import org.ld.model.ContractIncome;

public interface ContractIncomeMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ContractIncome record);

    int insertSelective(ContractIncome record);

    ContractIncome selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ContractIncome record);

    int updateByPrimaryKey(ContractIncome record);
}