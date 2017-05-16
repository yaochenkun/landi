package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.ShuttleBus;

public interface ShuttleBusMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ShuttleBus record);

    int insertSelective(ShuttleBus record);

    ShuttleBus selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ShuttleBus record);

    int updateByPrimaryKey(ShuttleBus record);
    
    //add
    Integer totalRec(HashMap<String, Object> map);
    
    List<ShuttleBus> getAllRec(HashMap<String, Object> map);
    
    List<ShuttleBus> getRec(HashMap<String, Object> map);
    
    ShuttleBus getCertainRec(HashMap<String, Object> map);
}