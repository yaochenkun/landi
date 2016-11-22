package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.RoomItem;

public interface RoomItemMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(RoomItem record);

    int insertSelective(RoomItem record);

    RoomItem selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(RoomItem record);

    int updateByPrimaryKey(RoomItem record);
    
    //add
    List<RoomItem> getItems(HashMap<String, Integer> map);
    
    List<RoomItem> getAllItems(HashMap<String, Integer> map);
    
    List<RoomItem> getItemsByType(HashMap<String, Integer> map);
    
    List<RoomItem> getItemsByRoom(HashMap<String, Integer> map);
    
    int getTotal(HashMap<String, Integer> map);
    
    int getTotal();
    
    int getTotalByType(int type);
    
    int getTotalByRoom(int rid);
}