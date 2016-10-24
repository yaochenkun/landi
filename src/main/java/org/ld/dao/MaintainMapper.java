package org.ld.dao;

import org.ld.model.Maintain;

public interface MaintainMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Maintain record);

    int insertSelective(Maintain record);

    Maintain selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Maintain record);

    int updateByPrimaryKey(Maintain record);
}