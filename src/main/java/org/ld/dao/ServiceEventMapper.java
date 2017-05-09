package org.ld.dao;

import org.ld.model.ServiceEvent;

public interface ServiceEventMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(ServiceEvent record);

    int insertSelective(ServiceEvent record);

    ServiceEvent selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(ServiceEvent record);

    int updateByPrimaryKey(ServiceEvent record);
}