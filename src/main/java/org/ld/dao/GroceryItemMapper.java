package org.ld.dao;

import org.ld.model.GroceryItem;

public interface GroceryItemMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(GroceryItem record);

    int insertSelective(GroceryItem record);

    GroceryItem selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(GroceryItem record);

    int updateByPrimaryKey(GroceryItem record);
}