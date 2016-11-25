package org.ld.dao;

import org.ld.model.GroceryRunning;

public interface GroceryRunningMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(GroceryRunning record);

	int insertSelective(GroceryRunning record);

	GroceryRunning selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(GroceryRunning record);

	int updateByPrimaryKey(GroceryRunning record);
}