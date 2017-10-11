package org.ld.service.impl;

import org.apache.log4j.Logger;
import org.ld.dao.DiaryReminderMapper;
import org.ld.dao.MailReminderMapper;
import org.ld.dao.SystemReminderMapper;
import org.ld.model.DiaryReminder;
import org.ld.model.MailReminder;
import org.ld.model.SystemReminder;
import org.ld.service.ProblemService;
import org.ld.service.ReminderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by ken on 2017/6/11.
 */
@Service("problemService")
public class ProblemServiceImpl implements ProblemService {

	private static Logger logger = Logger.getLogger("logDev");


}
