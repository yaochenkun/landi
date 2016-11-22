package org.ld.service;

import java.util.List;

import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;

public interface RoomService{
	
	Room getRoomById(int id);
	
	Room getRoomByNumber(String rn);
	
	List<Room> getRoomByType(String type);
	
	List<Room> getRoomByState(int state);
	
	List<Room> getAllRoom();
	
	List<RoomState> getAllRoomState();
	
	int insert(Room roomInfo);
	
	int update(Room roomInfo);
	
	int updateMeter(RoomMeter MeterInfo);
	
	int totalRow();
	
	List<RoomItem> getItems(Integer rid, Integer type);
	
	List<RoomPic> getPic(Integer rid);
	
	// add by pq
	int insertRoomPic(RoomPic roomPic);
	
	List<RoomMeter> getMeters(Integer rid, Integer type);
	
	RoomMeter getMeter(String mn);
}