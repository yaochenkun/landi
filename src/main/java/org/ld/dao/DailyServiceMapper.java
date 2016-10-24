package org.ld.dao;

import org.ld.model.DailyService;

public interface DailyServiceMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(DailyService record);

    int insertSelective(DailyService record);

    DailyService selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(DailyService record);

    int updateByPrimaryKey(DailyService record);
}