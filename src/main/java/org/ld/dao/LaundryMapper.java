package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.Laundry;

public interface LaundryMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Laundry record);

    int insertSelective(Laundry record);

    Laundry selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Laundry record);

    int updateByPrimaryKey(Laundry record);
    
    //add
    Integer totalRec(String RN);
    
    List<Laundry> getRec(HashMap<String, Object> map);
    
    Laundry getCertainRec(HashMap<String, Object> map);
}