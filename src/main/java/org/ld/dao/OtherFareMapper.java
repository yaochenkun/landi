package org.ld.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.ld.model.OtherFare;

public interface OtherFareMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(OtherFare record);

    int insertSelective(OtherFare record);

    OtherFare selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(OtherFare record);

    int updateByPrimaryKey(OtherFare record);
    
    //
    
    int getTotal(Map<String, Object> map);
    List<OtherFare> getByPage(Map<String, Object> map);
    List<OtherFare> getAll(Map<String, Object> map);

    List<OtherFare> getCertainOtherFares(Map<String, Object> map);
    List<OtherFare> getCertainOtherFaresByDay(Map<String, Object> map);

}