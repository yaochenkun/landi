package org.ld.dao;

import org.ld.model.Meal;

public interface MealMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Meal record);

    int insertSelective(Meal record);

    Meal selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Meal record);

    int updateByPrimaryKey(Meal record);
}