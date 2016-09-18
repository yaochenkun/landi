package org.ld.dao;

import org.ld.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    // add
    
    User selectByUserName(String Name);
}