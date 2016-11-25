package org.ld.dao;

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
	List<Guest> selectByName(String NAME);

	Guest selectByRoomNumber(String RN);

	Guest selectByContract(String CT);
}