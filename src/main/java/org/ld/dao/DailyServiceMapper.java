package org.ld.dao;

import java.util.List;
import java.util.Map;

import org.ld.model.DailyService;

public interface DailyServiceMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(DailyService record);

    int insertSelective(DailyService record);

    DailyService selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(DailyService record);

    int updateByPrimaryKey(DailyService record);
    
    //add
    int getTotalRow(Map<String, Object> map);
    
    List<DailyService> getDailyServiceRange(Map<String, Object> map);
    
    List<DailyService> getAllDailyServiceRange(Map<String, Object> map);
}