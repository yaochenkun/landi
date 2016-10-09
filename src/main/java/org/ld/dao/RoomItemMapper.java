package org.ld.dao;

import org.ld.model.RoomItem;

public interface RoomItemMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(RoomItem record);

    int insertSelective(RoomItem record);

    RoomItem selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(RoomItem record);

    int updateByPrimaryKey(RoomItem record);
}