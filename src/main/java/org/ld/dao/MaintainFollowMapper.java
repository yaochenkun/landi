package org.ld.dao;

import org.ld.model.MaintainFollow;

public interface MaintainFollowMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(MaintainFollow record);

	int insertSelective(MaintainFollow record);

	MaintainFollow selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(MaintainFollow record);

	int updateByPrimaryKey(MaintainFollow record);
}