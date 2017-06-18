package org.ld.dao;

import java.util.List;
import java.util.Map;

import org.ld.model.AgentPurchase;
import org.ld.model.ShoesPolishing;

public interface AgentPurchaseMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(AgentPurchase record);

    int insertSelective(AgentPurchase record);

    AgentPurchase selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(AgentPurchase record);

    int updateByPrimaryKey(AgentPurchase record);
    
  //add by lyd
    int getTotalRow(Map<String, Object> map);
    
    List<AgentPurchase> getAgentPurchaseRange(Map<String, Object> map);
    
    List<AgentPurchase> getAllAgentPurchaseServiceRange(Map<String, Object> map);
    
    List<AgentPurchase> getAll(Map<String, Object> map);
}