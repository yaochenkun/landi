package org.ld.service;

import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;

import java.util.Date;
import java.util.List;

public interface ReminderService {


	/**
	 * 个人日志
	 */
	int addDiaryReminder(DiaryReminder diaryReminder);

	int getTotalDiaryReminders(Integer uid, String keyword, Date remindDate);

	List<DiaryReminder> getDiaryRemindersByPage(Integer uid, String keyword, Date remindDate, int startPage, int eachPage);

	int deleteDiaryReminderById(Integer id);

	int updateDiaryReminder(DiaryReminder diaryReminder);

	DiaryReminder getDiaryReminderById(Integer id);

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

	/**
	 * 系统提醒
	 */
}
