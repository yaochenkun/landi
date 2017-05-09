package org.ld.dao;

import org.ld.model.ShoesPolishing;

public interface ShoesPolishingMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ShoesPolishing record);

    int insertSelective(ShoesPolishing record);

    ShoesPolishing selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ShoesPolishing record);

    int updateByPrimaryKey(ShoesPolishing record);
}