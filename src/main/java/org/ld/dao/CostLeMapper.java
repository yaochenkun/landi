package org.ld.dao;

import org.ld.model.CostLe;
import java.util.Map;
import java.util.List;

public interface CostLeMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(CostLe record);

    int insertSelective(CostLe record);

    CostLe selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(CostLe record);

    int updateByPrimaryKey(CostLe record);

    //add by lyd
    int totalExpense(Map<String,Object> map);

    List<CostLe> getExpenseBySearch(Map<String,Object> map);

    List<CostLe> getAllExpenseBySearch(Map<String,Object> map);

    List<CostLe> getCertainCostLes(Map<String,Object> map);

    List<CostLe> getCertainCostLesByDay(Map<String,Object> map);

}