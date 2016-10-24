package org.ld.dao;

import org.ld.model.FacDetail;

public interface FacDetailMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(FacDetail record);

    int insertSelective(FacDetail record);

    FacDetail selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(FacDetail record);

    int updateByPrimaryKey(FacDetail record);
}