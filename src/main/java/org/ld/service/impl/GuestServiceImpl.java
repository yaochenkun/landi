package org.ld.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.GuestMapper;
import org.ld.dao.RoomMapper;
import org.ld.model.Guest;
import org.ld.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("guestService")
public class GuestServiceImpl implements GuestService {

	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private GuestMapper guestMapper;
	
	@Override
	public Guest getGuestById(int id) {
		// TODO Auto-generated method stub
		return guestMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Guest> getGuestByName(String name) {
		// TODO Auto-generated method stub
		return guestMapper.selectByName(name);
	}
	
	@Override
	public Guest getGuestByRoomNumber(String s) {
		// TODO Auto-generated method stub
		return guestMapper.selectByRoomNumber(s);
	}
}