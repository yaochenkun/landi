package org.ld.dao;

import org.ld.model.GuestBalance;

public interface GuestBalanceMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(GuestBalance record);

    int insertSelective(GuestBalance record);

    GuestBalance selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(GuestBalance record);

    int updateByPrimaryKey(GuestBalance record);
}