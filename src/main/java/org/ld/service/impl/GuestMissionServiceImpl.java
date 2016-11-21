package org.ld.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.GuestMapper;
import org.ld.dao.HostMapper;
import org.ld.dao.RoomMapper;
import org.ld.model.Guest;
import org.ld.model.GuestBalance;
import org.ld.model.GuestService;
import org.ld.model.Host;
import org.ld.model.Intern;
import org.ld.service.GuestMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("guestService")
public class GuestMissionServiceImpl implements GuestMissionService {

	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private GuestMapper guestMapper;
	
	@Autowired
	private HostMapper hostMapper;
	
	@Override
	public Guest getGuestById(int id) {
		// TODO Auto-generated method stub
		return guestMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Guest> getGuestByName(String name) {
		// TODO Auto-generated method stub
		return guestMapper.selectByName("%" + name + "%");
	}
	
	@Override
	public Guest getGuestByRoomNumber(String s) {
		// TODO Auto-generated method stub
		return guestMapper.selectByRoomNumber(s);
	}

	@Override
	public Guest getGuestByContract(String ct) {
		// TODO Auto-generated method stub
		return guestMapper.selectByContract(ct);
	}

	@Override
	public int addGuest(Guest t) {
		// TODO Auto-generated method stub
		try{
			guestMapper.insert(t);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addHost(Host t) {
		// TODO Auto-generated method stub
		try{
			hostMapper.insert(t);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addIntern(Intern t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addGuestBalance(GuestBalance t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addGuestService(GuestService t) {
		// TODO Auto-generated method stub
		return 0;
	}
}