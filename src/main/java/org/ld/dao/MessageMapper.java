package org.ld.dao;

import org.ld.model.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}