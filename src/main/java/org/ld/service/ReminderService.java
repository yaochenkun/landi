package org.ld.service;

import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.model.SystemReminder;

import java.util.Date;
import java.util.List;

public interface ReminderService {


	List<String> getRemindDaysInMonth(Integer uid, Date fromDate, Date toDate);

	/**
	 * 个人日志
	 */
	int addDiaryReminder(DiaryReminder diaryReminder);

	int getTotalDiaryReminders(Integer uid, String keyword, Date remindDate);

	List<DiaryReminder> getDiaryRemindersByPage(Integer uid, String keyword, Date remindDate, int startPage, int eachPage);

	int deleteDiaryReminderById(Integer id);

	int updateDiaryReminder(DiaryReminder diaryReminder);

	DiaryReminder getDiaryReminderById(Integer id);

	List<DiaryReminder> getDiaryRemindersByDate(Integer uid, Date remindDate);

	/**
	 * 站内信
	 */
	int addMailReminder(MailReminder mailReminder);

	int getTotalMailReminders(Integer sid, String keyword, Date remindDate);

	List<MailReminder> getMailRemindersByPage(Integer sid, String keyword, Date remindDate, int startPage, int eachPage);

	int deleteMailReminderById(Integer id);

	int updateMailReminder(MailReminder mailReminder);

	MailReminder getMailReminderById(Integer id);

	//收件人
	int getTotalInBoxMailReminders(Integer rid, String keyword, Date remindDate);

	List<MailReminder> getInboxMailRemindersByPage(Integer rid, String keyword, Date remindDate, int startPage, int eachPage);

	List<MailReminder> getInboxMailRemindersByDate(Integer uid, Date remindDate);

	/**
	 * 系统提醒
	 */

	int addSystemReminder(SystemReminder systemReminder);
}
