package org.ld.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ld.model.Room;
import org.ld.model.RoomMeter;

public interface RoomMeterMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(RoomMeter record);

	int insertSelective(RoomMeter record);

	RoomMeter selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(RoomMeter record);

	int updateByPrimaryKey(RoomMeter record);

	// add
	List<RoomMeter> getMeters(HashMap<String, Object> map);

	RoomMeter getMeter(Map<String,Object> map);

	RoomMeter getOneGasMeter(Map<String,Object> map);

	List<RoomMeter> getMetersByID(Integer ROOM_ID);

	int getTotalRow(Map<String, Object> map);

//	List<RoomMeter> getRoomMeterRange(Map<String, Object> map);
	List<RoomMeter> getMeterById(Integer ID);
}