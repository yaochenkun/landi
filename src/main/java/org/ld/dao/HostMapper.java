package org.ld.dao;

import org.ld.model.Host;

public interface HostMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Host record);

	int insertSelective(Host record);

	Host selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Host record);

	int updateByPrimaryKey(Host record);
}