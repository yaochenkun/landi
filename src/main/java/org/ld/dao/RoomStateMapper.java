package org.ld.dao;

import java.util.List;

import org.ld.model.Room;
import org.ld.model.RoomState;

public interface RoomStateMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(RoomState record);

	int insertSelective(RoomState record);

	RoomState selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(RoomState record);

	int updateByPrimaryKey(RoomState record);

	// add

	List<RoomState> getAllRoomState();
	
	RoomState getCertainRoomStateByID(Integer RID);
	
	RoomState getCertainRoomStateByNumber(String RN);
}