package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.GroceryItem;

public interface GroceryItemMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(GroceryItem record);

	int insertSelective(GroceryItem record);

	GroceryItem selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(GroceryItem record);

	int updateByPrimaryKey(GroceryItem record);
	
	//add
	
	int totalRec(String NAME);
	
	List<GroceryItem> getRec(HashMap<String, Object> map);
}