package org.ld.dao;

import org.ld.model.Sources;

public interface SourcesMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Sources record);

    int insertSelective(Sources record);

    Sources selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Sources record);

    int updateByPrimaryKey(Sources record);
}