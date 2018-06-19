package org.ld.dao;

import java.util.List;
import java.util.Map;

import org.ld.model.DailyService;
import org.ld.model.ShoesPolishing;

public interface ShoesPolishingMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ShoesPolishing record);

    int insertSelective(ShoesPolishing record);

    ShoesPolishing selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ShoesPolishing record);

    int updateByPrimaryKey(ShoesPolishing record);
    
    //add by lyd
    int getTotalRow(Map<String, Object> map);
    
    List<ShoesPolishing> getShoesPolishingRange(Map<String, Object> map);
    
    List<ShoesPolishing> getAllShoesPolishingServiceRange(Map<String, Object> map);
    
    List<ShoesPolishing> getAll(Map<String , Object> map);

    List<ShoesPolishing> getCertainShoesPolishings(Map<String , Object> map);

    List<ShoesPolishing> getCertainShoesPolishingsByDay(Map<String , Object> map);

}