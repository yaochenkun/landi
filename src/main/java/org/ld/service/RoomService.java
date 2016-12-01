package org.ld.service;

import java.util.List;

import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;

public interface RoomService {

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

	List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage);

	List<RoomPic> getPic(Integer rid);

	// add by pq
	int insertRoomPic(RoomPic roomPic);

	List<RoomMeter> getMeters(Integer rid, Integer type);

	RoomMeter getMeter(String mn);
	
	// add
	
	int totalRowByItem(Integer item_id);
	
	List<RoomItem> getItemByItemID(Integer item_id, Integer st, Integer eachPage);
	
	RoomItem getCertainRIRec(Integer id);
	
	int insertRI(RoomItem ri);
	
	int deleteRI(Integer id);
}