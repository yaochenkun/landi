package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.RoomMeter;

public interface RoomMeterMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(RoomMeter record);

	int insertSelective(RoomMeter record);

	RoomMeter selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(RoomMeter record);

	int updateByPrimaryKey(RoomMeter record);

	// add
	List<RoomMeter> getMeters(HashMap<String, Integer> map);

	RoomMeter getMeter(String MN);
}