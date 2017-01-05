package org.ld.dao;

import org.ld.model.Laundry;

public interface LaundryMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Laundry record);

    int insertSelective(Laundry record);

    Laundry selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Laundry record);

    int updateByPrimaryKey(Laundry record);
}