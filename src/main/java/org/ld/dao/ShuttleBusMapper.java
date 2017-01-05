package org.ld.dao;

import org.ld.model.ShuttleBus;

public interface ShuttleBusMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ShuttleBus record);

    int insertSelective(ShuttleBus record);

    ShuttleBus selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ShuttleBus record);

    int updateByPrimaryKey(ShuttleBus record);
}