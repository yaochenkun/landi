package org.ld.dao;

import org.ld.model.MailReminder;

import java.util.List;
import java.util.Map;

public interface MailReminderMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(MailReminder record);

    int insertSelective(MailReminder record);

    MailReminder selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(MailReminder record);

    int updateByPrimaryKey(MailReminder record);

    //add by yck
    int selectTotal(Map<String, Object> map);
    List<MailReminder> selectByPage(Map<String, Object> map);

    int selectTotalInboxMail(Map<String, Object> map);
    List<MailReminder> selectInboxMailByPage(Map<String, Object> map);
    List<MailReminder> selectInboxMailByDate(Map<String, Object> map);

    List<String> selectRemindDaysInMonth(Map<String, Object> map);
}