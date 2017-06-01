package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.FacSta;

public interface FacStaMapper {
	int deleteByPrimaryKey(Integer ID);

	int insert(FacSta record);

	int insertSelective(FacSta record);

	FacSta selectByPrimaryKey(Integer ID);

	int updateByPrimaryKeySelective(FacSta record);

	int updateByPrimaryKey(FacSta record);

	// add
	List<FacSta> getFacByTypeCatBand(HashMap<String, Object> map);

	List<FacSta> getAllFac(HashMap<String, Object> map);

	List<FacSta> getFacByType(HashMap<String, Object> map);

	List<FacSta> getFacByTypeCat(HashMap<String, Object> map);

	int getAllTotal();

	int getTotalByType(HashMap<String, Object> map);

	int getTotalByTypeCat(HashMap<String, Object> map);

	int getTotalByTypeCatBand(HashMap<String, Object> map);

	List<FacSta> getFacByTypeCatBandAll(HashMap<String, Object> map);

	FacSta selectByItemInfo(HashMap<String, Object> map);

	//查询库房物品
	int selectTotalRepoItemByType_RepoNum(HashMap<String, Object> map);
	List<FacSta> selectRepoItemByType_RepoNum(HashMap<String, Object> map);
	List<FacSta> selectAllRepoItemByType_RepoNum(HashMap<String, Object> map);
}