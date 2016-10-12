package org.ld.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.RoomItemMapper;
import org.ld.dao.RoomMapper;
import org.ld.dao.RoomMeterMapper;
import org.ld.dao.RoomPicMapper;
import org.ld.dao.RoomStateMapper;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private RoomMapper roomMapper;
	@Autowired
	private RoomMeterMapper roomMeterMapper;
	@Autowired
	private RoomItemMapper roomItemMapper;
	@Autowired
	private RoomPicMapper roomPicMapper;
	@Autowired
	private RoomStateMapper roomStateMapper;

	@Override
	public Room getRoomById(int id) {
		// TODO Auto-generated method stub
		return roomMapper.selectByPrimaryKey(id);
	}

	@Override
	public Room getRoomByNumber(String rn) {
		// TODO Auto-generated method stub
		return roomMapper.selectByNumber(rn);
	}

	@Override
	public List<Room> getRoomByType(String type) {
		// TODO Auto-generated method stub
		return roomMapper.getRoomByType(type);
	}

	@Override
	public List<Room> getRoomByState(int state) {
		// TODO Auto-generated method stub
		return roomMapper.getRoomByState(state);
	}

	@Override
	public int insert(Room roomInfo) {
		// TODO Auto-generated method stub
		try{
			roomMapper.insert(roomInfo);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int update(Room roomInfo) {
		// TODO Auto-generated method stub
		try{
			roomMapper.updateByPrimaryKeySelective(roomInfo);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int totalRow() {
		// TODO Auto-generated method stub
		return roomMapper.totalRow();
	}

	@Override
	public List<Room> getAllRoom() {
		// TODO Auto-generated method stub
		return roomMapper.getAllRoom();
	}
	
	@Override
	public List<RoomState> getAllRoomState() {
		// TODO Auto-generated method stub
		return roomStateMapper.getAllRoomState();
	}

	@Override
	public List<RoomItem> getItems(Integer rid, Integer type) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("room_id", rid);
		map.put("type", type);
		return roomItemMapper.getItems(map);
	}
	
	@Override
	public List<RoomPic> getPic(Integer rid) {
		// TODO Auto-generated method stub
		return roomPicMapper.getPicByRoomId(rid);
	}
}