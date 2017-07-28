package org.ld.dao;

import java.util.List;
import java.util.Map;

import org.ld.model.Sources;

public interface SourcesMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(Sources record);

	int insertSelective(Sources record);

	Sources selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(Sources record);

	int updateByPrimaryKey(Sources record);

	// add
	int getTotalRow(Map<String, Object> map);

	int getExactTotalRow(Map<String, Object> map); //房间号采用精确查询

	List<Sources> getSourcesRange(Map<String, Object> map);

	List<Sources> getExactSourcesRange(Map<String, Object> map); //房间号采用精确查询

	Sources getSources(Map<String, Object> map);

	Sources getSingleSources(Map<String, Object> map);

}