package org.ld.dao;

import java.util.List;

import org.ld.model.Room;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
    
    //add
    Room selectByNumber(String rn);
    
    List<Room> getRoomByType(String type);
    
    List<Room> getRoomByState(int state);
    
    List<Room> getAllRoom();
    
    int totalRow();
}