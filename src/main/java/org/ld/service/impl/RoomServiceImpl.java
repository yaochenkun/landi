package org.ld.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.LaundryMapper;
import org.ld.dao.MaintainMapper;
import org.ld.dao.RoomItemMapper;
import org.ld.dao.RoomMapper;
import org.ld.dao.RoomMeterMapper;
import org.ld.dao.RoomPicMapper;
import org.ld.dao.RoomStateMapper;
import org.ld.dao.ShuttleBusMapper;
import org.ld.model.Laundry;
import org.ld.model.Maintain;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.ShuttleBus;
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
	@Autowired
	private LaundryMapper laundryMapper;
	@Autowired
	private ShuttleBusMapper shuttleBusMapper;
	@Autowired
	private MaintainMapper maintainMapper;

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
		try {
			roomMapper.insert(roomInfo);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int update(Room roomInfo) {
		// TODO Auto-generated method stub
		try {
			roomMapper.updateByPrimaryKeySelective(roomInfo);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateMeter(RoomMeter meterInfo) {
		// TODO Auto-generated method stub
		try {
			roomMeterMapper.updateByPrimaryKeySelective(meterInfo);
			return 1;
		} catch (Exception e) {
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
	public List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_ID", rid);
		map.put("TYPE", type);
		map.put("ST", st);
		map.put("EACH", eachPage);
		return roomItemMapper.getItems(map);
	}

	@Override
	public List<RoomPic> getPic(Integer rid) {
		// TODO Auto-generated method stub
		return roomPicMapper.getPicByRoomId(rid);
	}

	// add by pq
	@Override
	public int insertRoomPic(RoomPic roomPic) {
		return roomPicMapper.insertSelective(roomPic);
	}

	@Override
	public List<RoomMeter> getMeters(Integer rid, Integer type) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ROOM_ID", rid);
		map.put("TYPE", type);
		return roomMeterMapper.getMeters(map);
	}

	@Override
	public RoomMeter getMeter(String mn) {
		// TODO Auto-generated method stub
		return roomMeterMapper.getMeter(mn);
	}

	@Override
	public int totalRowByItem(Integer item_id) {
		// TODO Auto-generated method stub
		return roomItemMapper.getTotalByItemID(item_id);
	}

	@Override
	public List<RoomItem> getItemByItemID(Integer item_id, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ITEM_ID", item_id);
		map.put("ST", st);
		map.put("EACH", eachPage);
		return roomItemMapper.getItemsByItemID(map);
	}

	@Override
	public RoomItem getCertainRIRec(Integer id) {
		// TODO Auto-generated method stub
		return roomItemMapper.selectByPrimaryKey(id);
	}

	@Override
	public int insertRI(RoomItem ri) {
		// TODO Auto-generated method stub
		try {
			roomItemMapper.insert(ri);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int deleteRI(Integer id) {
		// TODO Auto-generated method stub
		try {
			roomItemMapper.deleteByPrimaryKey(id);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int totalLaundry(String rn) {
		// TODO Auto-generated method stub
		
		return laundryMapper.totalRec(rn);
	}

	@Override
	public List<Laundry> getLaundry(String rn, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("ST", st);
		map.put("EACH", eachPage);
		
		return laundryMapper.getRec(map);
	}

	@Override
	public int addWash(Laundry l) {
		// TODO Auto-generated method stub
		
		try{
			laundryMapper.insertSelective(l);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateWash(Laundry l) {
		// TODO Auto-generated method stub
		try{
			laundryMapper.updateByPrimaryKeySelective(l);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public Laundry getCertainLaundry(String rn, String name, Date date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("NAME", name);
		map.put("DATE", date);
		
		return laundryMapper.getCertainRec(map);
	}

	@Override
	public int totalShuttleBus(String rn, int year, int mon) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		
		return shuttleBusMapper.totalRec(map);
	}

	@Override
	public List<ShuttleBus> getShuttleBus(String rn, int year, int mon, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		map.put("ST", st);
		map.put("EACH", eachPage);
		
		return shuttleBusMapper.getRec(map);
	}

	@Override
	public ShuttleBus getCertainShuttleBus(String rn, String name, int year, int mon) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		map.put("NAME", name);
		
		return shuttleBusMapper.getCertainRec(map);
	}

	@Override
	public int addShuttleBus(ShuttleBus sb) {
		// TODO Auto-generated method stub
		try{
			shuttleBusMapper.insertSelective(sb);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateShuttleBus(ShuttleBus sb) {
		// TODO Auto-generated method stub
		try{
			shuttleBusMapper.updateByPrimaryKeySelective(sb);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addMaintain(Maintain m) {
		// TODO Auto-generated method stub
		try{
			maintainMapper.insertSelective(m);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateMaintain(Maintain m) {
		// TODO Auto-generated method stub
		try{
			maintainMapper.updateByPrimaryKeySelective(m);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int totalMaintain(Integer type, Integer cat, Integer state, String rn, Date from, Date to) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("STIME", from);
		map.put("TTIME", to);
		map.put("TYPE", type);
		map.put("CAT", cat);
		map.put("STATE", state);
		
		return maintainMapper.totalRec(map);
	}

	@Override
	public List<Maintain> getMaintain(Integer type, Integer cat, Integer state, String rn, Integer st, Integer eachPage, Date from,
			Date to, Integer order) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("STIME", from);
		map.put("TTIME", to);
		map.put("TYPE", type);
		map.put("CAT", cat);
		map.put("STATE", state);
		map.put("ST", st);
		map.put("EACH", eachPage);
		map.put("ORDER", order);
		
		return maintainMapper.getRec(map);
	}

	@Override
	public Maintain getCertainMaintain(int ID) {
		// TODO Auto-generated method stub
		return maintainMapper.selectByPrimaryKey(ID);
	}

	@Override
	public int updateRoomState(RoomState rs) {
		// TODO Auto-generated method stub
		try{
			roomStateMapper.updateByPrimaryKeySelective(rs);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
}