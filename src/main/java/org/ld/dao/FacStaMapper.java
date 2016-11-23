package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.FacSta;

public interface FacStaMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(FacSta record);

    int insertSelective(FacSta record);

    FacSta selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(FacSta record);

    int updateByPrimaryKey(FacSta record);
    
    //add
    List<FacSta> getFacByTypeCatBand(HashMap<String, Object> map);
    
    FacSta selectByNumber(String number);
}