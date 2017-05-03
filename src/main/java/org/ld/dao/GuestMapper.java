package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.Guest;

public interface GuestMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Guest record);

	int insertSelective(Guest record);

	Guest selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Guest record);

	int updateByPrimaryKey(Guest record);

	// add
	List<Guest> selectByName(HashMap<String, Object> map);

	Guest selectByRoomNumber(String RN);

	Guest selectByContract(String CT);
	
	int getTotal();
	
	List<Guest> getGuestRange(HashMap<String, Object> map);
	
	//add by yck
	int getTotalByName_RoomNumber(HashMap<String, Object> map);
	
	List<Guest> selectByName_RoomNumber(HashMap<String, Object> map);
}