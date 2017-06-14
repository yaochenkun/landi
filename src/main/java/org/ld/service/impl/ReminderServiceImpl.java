package org.ld.service.impl;

import org.apache.log4j.Logger;
import org.ld.dao.DiaryReminderMapper;
import org.ld.dao.MailReminderMapper;
import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.service.ReminderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by ken on 2017/6/11.
 */
@Service("reminderService")
public class ReminderServiceImpl implements ReminderService{

	private static Logger logger = Logger.getLogger("logDev");

	@Autowired
	private DiaryReminderMapper diaryReminderMapper;

	@Autowired
	private MailReminderMapper mailReminderMapper;

	@Override
	public int addDiaryReminder(DiaryReminder diaryReminder) {

		try{
			return diaryReminderMapper.insert(diaryReminder);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public int getTotalDiaryReminders(Integer uid, String keyword, Date remindDate) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("USER_ID", uid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);

		return diaryReminderMapper.selectTotal(map);
	}

	@Override
	public List<DiaryReminder> getDiaryRemindersByPage(Integer uid, String keyword, Date remindDate, int startPage, int eachPage) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("USER_ID", uid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);

		return diaryReminderMapper.selectByPage(map);
	}

	@Override
	public int deleteDiaryReminderById(Integer id) {
		try{
			return diaryReminderMapper.deleteByPrimaryKey(id);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateDiaryReminder(DiaryReminder diaryReminder) {
		try{
			return diaryReminderMapper.updateByPrimaryKey(diaryReminder);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public DiaryReminder getDiaryReminderById(Integer id) {
		return diaryReminderMapper.selectByPrimaryKey(id);
	}


	/**
	 * 站内信
	 */
	@Override
	public int addMailReminder(MailReminder mailReminder) {
		try{
			return mailReminderMapper.insert(mailReminder);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public int getTotalMailReminders(Integer sid, String keyword, Date remindDate) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("SENDER_ID", sid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);

		return mailReminderMapper.selectTotal(map);
	}

	@Override
	public List<MailReminder> getMailRemindersByPage(Integer sid, String keyword, Date remindDate, int startPage, int eachPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("SENDER_ID", sid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);

		return mailReminderMapper.selectByPage(map);
	}

	@Override
	public int deleteMailReminderById(Integer id) {
		try{
			return mailReminderMapper.deleteByPrimaryKey(id);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateMailReminder(MailReminder mailReminder) {
		try{
			return mailReminderMapper.updateByPrimaryKey(mailReminder);
		} catch(Exception e){
			System.err.println(e.getCause());
			return 0;
		}
	}

	@Override
	public MailReminder getMailReminderById(Integer id) {
		return mailReminderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int getTotalInBoxMailReminders(Integer rid, String keyword, Date remindDate) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("RECEIVER_ID", rid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);

		return mailReminderMapper.selectTotalInboxMail(map);
	}

	@Override
	public List<MailReminder> getInboxMailRemindersByPage(Integer rid, String keyword, Date remindDate, int startPage, int eachPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("RECEIVER_ID", rid);
		map.put("KEYWORD", keyword);
		map.put("REMIND_DATE", remindDate);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);

		return mailReminderMapper.selectInboxMailByPage(map);
	}
}
