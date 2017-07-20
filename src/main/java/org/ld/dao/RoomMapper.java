package org.ld.dao;

import java.util.List;
import java.util.Map;

import org.ld.model.Room;

public interface RoomMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Room record);

	int insertSelective(Room record);

	Room selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Room record);

	int updateByPrimaryKey(Room record);

	// add
	Room selectByNumber(String RN);

	List<Room> getRoomByType(String ROOM_TYPE);

	List<Room> getRoomByState(int STATE);

	List<Room> getAllRoom();

	int totalRow();

	List<Room> getAllTypeNotNullRoom();

	int totalRoom(Map<String,Object> map);

	List<Room> getRoomBySearch(Map<String,Object> map);

	List<Room> getAllRoomBySearch(Map<String,Object> map);
}