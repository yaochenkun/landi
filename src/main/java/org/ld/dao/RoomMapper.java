package org.ld.dao;

import org.ld.model.Room;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
}