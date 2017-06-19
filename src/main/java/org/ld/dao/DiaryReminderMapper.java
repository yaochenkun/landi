package org.ld.dao;

import org.ld.model.DiaryReminder;

import java.util.List;
import java.util.Map;

public interface DiaryReminderMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(DiaryReminder record);

    int insertSelective(DiaryReminder record);

    DiaryReminder selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(DiaryReminder record);

    int updateByPrimaryKey(DiaryReminder record);


    //add by yck
    int selectTotal(Map<String, Object> map);
    List<DiaryReminder> selectByPage(Map<String, Object> map);
    List<DiaryReminder> selectByDate(Map<String, Object> map);
}