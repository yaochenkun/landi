package org.ld.dao;

import org.ld.model.DrinkingWater;

public interface DrinkingWaterMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(DrinkingWater record);

    int insertSelective(DrinkingWater record);

    DrinkingWater selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(DrinkingWater record);

    int updateByPrimaryKey(DrinkingWater record);
}