package org.ld.dao;

import org.ld.model.AgentPurchase;

public interface AgentPurchaseMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(AgentPurchase record);

    int insertSelective(AgentPurchase record);

    AgentPurchase selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(AgentPurchase record);

    int updateByPrimaryKey(AgentPurchase record);
}