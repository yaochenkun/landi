package org.ld.service;

import java.util.List;

import org.ld.model.Room;

public interface RoomService{
	
	Room getRoomById(int id);
	
	Room getRoomByNumber(String rn);
	
	List<Room> getRoomByType(String type);
	
	List<Room> getRoomByState(int state);
	
	List<Room> getAllRoom();
	
	int insert(Room roomInfo);
	
	int update(Room roomInfo);
	
	int totalRow();
}