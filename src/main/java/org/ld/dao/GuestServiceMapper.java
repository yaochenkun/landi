package org.ld.dao;

import java.util.Map;

import org.ld.model.GuestService;

public interface GuestServiceMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(GuestService record);

	int insertSelective(GuestService record);

	GuestService selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(GuestService record);

	int updateByPrimaryKey(GuestService record);
	
	GuestService selectCertainByGid_Item(Map<String, Object> map);
}