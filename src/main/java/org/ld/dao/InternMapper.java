package org.ld.dao;

import org.ld.model.Intern;

public interface InternMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Intern record);

	int insertSelective(Intern record);

	Intern selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Intern record);

	int updateByPrimaryKey(Intern record);
}