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

	FacSta selectByNumber(String NUMBER);

	int getAllTotal();

	int getTotalByType(HashMap<String, Object> map);

	int getTotalByTypeCat(HashMap<String, Object> map);

	int getTotalByTypeCatBand(HashMap<String, Object> map);

	List<FacSta> getFacByTypeCatBandAll(HashMap<String, Object> map);
}