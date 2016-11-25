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

	// add
	List<RoomItem> getItems(HashMap<String, Object> map);

	List<RoomItem> getAllItems(HashMap<String, Object> map);

	List<RoomItem> getItemsByType(HashMap<String, Object> map);

	List<RoomItem> getItemsByRoom(HashMap<String, Object> map);

	int getTotal(HashMap<String, Object> map);

	int getAllTotal();

	int getTotalByType(String type);

	int getTotalByRoom(int rid);

}