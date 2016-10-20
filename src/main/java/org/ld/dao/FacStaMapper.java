package org.ld.dao;

import org.ld.model.FacSta;

public interface FacStaMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(FacSta record);

    int insertSelective(FacSta record);

    FacSta selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(FacSta record);

    int updateByPrimaryKey(FacSta record);
}