package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.Maintain;
import org.ld.model.ShuttleBus;

public interface MaintainMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Maintain record);

    int insertSelective(Maintain record);

    Maintain selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Maintain record);

    int updateByPrimaryKey(Maintain record);
    
    //add
    Integer totalRec(HashMap<String, Object> map);
    
    List<Maintain> getRec(HashMap<String, Object> map);
}