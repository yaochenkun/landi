package org.ld.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ld.app.Config;
import org.ld.dao.*;
import org.ld.model.*;
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
	@Autowired
	private FlightPickingMapper flightPickingMapper;
	@Autowired
	private OtherFareMapper otherFareMapper;
	@Autowired
	private DrinkingWaterMapper drinkingWaterMapper;
	@Autowired
	private CostLeMapper costLeMapper;

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
	public int updateRoom(Room room) {
		//add by lyd
		try {
			roomMapper.updateByPrimaryKey(room);
			return 1;
		}catch(Exception e) {
			logger.error(e.getCause());
			return 0 ;
		}
	}

//	@Override
//	public int updateMeter(RoomMeter meterInfo) {
//		// TODO Auto-generated method stub
//		try {
//			roomMeterMapper.updateByPrimaryKeySelective(meterInfo);
//			return 1;
//		} catch (Exception e) {
//			logger.error(e.getCause());
//			return 0;
//		}
//	}

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
	public List<Room> getAllEditedTypeRoom() {

		return roomMapper.getAllTypeNotNullRoom();

	}

	@Override
	public int getTotalRoom(String rNum, String roomType) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Room_Number",rNum);
		map.put("Type",roomType);

		return roomMapper.totalRoom(map);
	}

	@Override
	public List<Room> searchRoom(String rNum, String roomType,Integer st, Integer eachPage) {
		HashMap<String,Object> map = new HashMap<String,Object>();

		map.put("Room_Number",rNum);
		map.put("Type",roomType);
		map.put("ST",st);
		map.put("EACH",eachPage);

		return roomMapper.getRoomBySearch(map);

	}

	@Override
	public List<Room> searchAllRoom(String rnum,String type){
		Map<String,Object> map = new HashMap<>();

		map.put("Room_Number",rnum);
		map.put("TYPE",type);
		return roomMapper.getAllRoomBySearch(map);
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
	public int getTotalExpense(String rNum, String type) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("Room_Number",rNum);
		map.put("TYPE",type);

		return costLeMapper.totalExpense(map);
	}

	@Override
	public List<CostLe> searchExpense(String rNum, String type,Integer st, Integer eachPage) {
		HashMap<String,Object> map = new HashMap<String,Object>();

		map.put("Room_Number",rNum);
		map.put("TYPE",type);
		map.put("ST",st);
		map.put("EACH",eachPage);

		return costLeMapper.getExpenseBySearch(map);

	}

	@Override
	public List<CostLe> searchAllExpense(String rnum,String type){
		Map<String,Object> map = new HashMap<>();

		map.put("Room_Number",rnum);
		map.put("TYPE",type);
		return costLeMapper.getAllExpenseBySearch(map);
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

//	@Override
//	public List<RoomMeter> getMeters(Integer rid, Integer type) {
//		// TODO Auto-generated method stub
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("ROOM_ID", rid);
//		map.put("TYPE", type);
//		return roomMeterMapper.getMeters(map);
//	}
//
//	@Override
//	public RoomMeter getMeter(String mn) {
//		// TODO Auto-generated method stub
//		return roomMeterMapper.getMeter(mn);
//	}

	@Override
	public int totalRowByItem(Integer fac_id) {
		// TODO Auto-generated method stub
		return roomItemMapper.getTotalByItemID(fac_id);
	}

	@Override
	public List<RoomItem> getItemByItemID(Integer fac_id, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("FAC_ID", fac_id);
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
	public int totalLaundry(String rn, Date date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		return laundryMapper.totalRec(map);
	}

	@Override
	public List<Laundry> getLaundry(String rn, Date date, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		map.put("ST", st);
		map.put("EACH", eachPage);
		
		return laundryMapper.getRec(map);
	}
	
	@Override
	public List<Laundry> getAllWashes(String rn, Date date) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		return laundryMapper.getAll(map);
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
	public Laundry getCertainLaundry(String rn, Integer gid, Date date) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("GID", gid);
		map.put("DATE", date);
		
		return laundryMapper.getCertainRec(map);
	}

	@Override
	public int deleteWash(Integer id) {
	
		try {
			return laundryMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public Laundry getWashById(Integer id) {
		// TODO Auto-generated method stub
		return laundryMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int totalShuttleBus(String rn, Integer year, Integer mon) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		
		return shuttleBusMapper.totalRec(map);
	}
	
	@Override
	public List<ShuttleBus> getAllShuttleBus(String rn, Integer year, Integer mon) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		return shuttleBusMapper.getAllRec(map);
	}

	@Override
	public List<ShuttleBus> getShuttleBus(String rn, Integer year, Integer mon, Integer st, Integer eachPage) {
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
	public ShuttleBus getCertainShuttleBus(String rn, Integer gid, Integer year, Integer mon) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("YEAR", year);
		map.put("MON", mon);
		map.put("GID", gid);
		
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
	public ShuttleBus getShuttleBusById(Integer id) {

		return shuttleBusMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteShuttleBus(Integer id) {
		try{
			return shuttleBusMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int getFareUnitPrice(String roomNum) {
		// TODO Auto-generated method stub
		String floor = "车费_" + roomNum.substring(0, 1) + "-" + roomNum.substring(1, roomNum.indexOf('-'));
		return Config.getCharge().get(floor);
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
		if(rn != null) map.put("RN", rn);
		if(from != null) map.put("STIME", from);
		if(to != null) map.put("TTIME", to);
		if(type != null) map.put("TYPE", type);
		if(cat != null) map.put("CAT", cat);
		if(state != null) map.put("STATE", state);
		
		return maintainMapper.totalRec(map);
	}

	@Override
	public List<Maintain> getMaintain(Integer type, Integer cat, Integer state, String rn, Integer st, Integer eachPage, Date from,
			Date to, Integer order) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(rn != null) map.put("RN", rn);
		if(from != null) map.put("STIME", from);
		if(to != null) map.put("TTIME", to);
		if(type != null) map.put("TYPE", type);
		if(cat != null) map.put("CAT", cat);
		if(state != null) map.put("STATE", state);
		if(order != null)map.put("ORDER", order);
		
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

	@Override
	public RoomState getCertainRSbyID(Integer id) {
		// TODO Auto-generated method stub
		return roomStateMapper.getCertainRoomStateByID(id);
	}

	@Override
	public RoomState getCertainRSbyNumber(String number) {
		// TODO Auto-generated method stub
		return roomStateMapper.getCertainRoomStateByNumber(number);
	}

	@Override
	public RoomState getCertainRSbyRoomNumber(String number) {
		// TODO Auto-generated method stub
		return roomStateMapper.getCertainRoomStateByRoomNumber(number);
	}

	/**
	 * 接送机
	 */
	
	@Override
	public int addFlightPicking(FlightPicking bean) {
		// TODO Auto-generated method stub
		try {
			flightPickingMapper.insert(bean);
			return 1;
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int getTotalFlightPickingByRoomNumber_Time(String roomNumber, Date time) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_NUMBER", roomNumber);
		map.put("TIME", time);
		return flightPickingMapper.getTotalByRoomNumber_Time(map);
	}

	@Override
	public List<FlightPicking> getFlightPickingByRoomNumber_Time(String roomNumber, Date time, int startPage, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_NUMBER", roomNumber);
		map.put("TIME", time);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);
		return flightPickingMapper.selectByRoomNumber_Time(map);
	}

	@Override
	public FlightPicking getFlightPickingById(Integer id) {
		
		return flightPickingMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteFlightPickingById(Integer id) {
		// TODO Auto-generated method stub
		try {
			return flightPickingMapper.deleteByPrimaryKey(id);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateFlightPicking(FlightPicking fp) {
		try{
			return flightPickingMapper.updateByPrimaryKeySelective(fp);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public List<FlightPicking> getAllFlightPickings(String roomNumber, Date time) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_NUMBER", roomNumber);
		map.put("TIME", time);
		return flightPickingMapper.getAll(map);
	}

	
	/**
	 * 其它车费
	 */
	@Override
	public int addOtherFare(OtherFare bean) {
		
		try{
			return otherFareMapper.insertSelective(bean);
		}catch(Exception e){
			System.out.println("===========" + e.getCause());
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int getTotalOtherFares(String roomNum, Date occurTime) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);
		return otherFareMapper.getTotal(map);
	}

	@Override
	public List<OtherFare> getOtherFaresByPage(String roomNum, Date occurTime, int startPage, int eachPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);
		return otherFareMapper.getByPage(map);
	}
	
	@Override
	public List<OtherFare> getAllOtherFares(String roomNum, Date occurTime) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);

		return otherFareMapper.getAll(map);
	}

	@Override
	public int deleteOtherFareById(Integer id) {
		try {
			return otherFareMapper.deleteByPrimaryKey(id);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public OtherFare getOtherFareById(Integer id) {
		
		return otherFareMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateOtherFare(OtherFare bean) {
		try {
			return otherFareMapper.updateByPrimaryKey(bean);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}
	
	/**
	 * 饮用水费
	 */
	
	@Override
	public double getDrinkingWaterUnitPrice(String roomNum) {
		// TODO Auto-generated method stub
		String floor = "桶装水费_" + roomNum.substring(0, 1) + "-" + roomNum.substring(1, roomNum.indexOf('-'));
		return Config.getCharge().get(floor);
	}

	@Override
	public DrinkingWater getLastDrinkingWater(Integer gid) {
		// TODO Auto-generated method stub
		
		return drinkingWaterMapper.selectLastByGid(gid);
	}

	@Override
	public int addDrinkingWater(DrinkingWater bean) {
		try {
			return drinkingWaterMapper.insertSelective(bean);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public List<DrinkingWater> getDrinkingWatersByPage(String roomNum, Date occurTime, int startPage, int eachPage) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);
		map.put("START_PAGE", startPage);
		map.put("EACH_PAGE", eachPage);
		
		return drinkingWaterMapper.selectByPage(map);
	}

	@Override
	public int getTotalDrinkingWaters(String roomNum, Date occurTime) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);
		
		return drinkingWaterMapper.selectTotal(map);
	}

	@Override
	public List<DrinkingWater> getAllDrinkingWaters(String roomNum, Date occurTime) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("ROOM_NUM", roomNum);
		map.put("OCCUR_TIME", occurTime);
		
		return drinkingWaterMapper.selectAll(map);
	}

	@Override
	public int deleteWaterBillById(Integer id) {
		try {
			return drinkingWaterMapper.deleteByPrimaryKey(id);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public DrinkingWater getDrinkingWater(Integer id) {
		// TODO Auto-generated method stub
		return drinkingWaterMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateDrinkingWater(DrinkingWater bean) {
		try {
			return drinkingWaterMapper.updateByPrimaryKey(bean);
		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public DrinkingWater getLastBeforeDrinkingWater(Integer gid, Date time) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("GUEST_ID", gid);
		map.put("IMPORT_TIME", time);
		
		return drinkingWaterMapper.selectLastBeforeByGidAndTime(map);
	}

	@Override
	public int updateAfterDrinkingWaters(Integer guestId, Date importTime, int barrelCountDiff, int bottleCountDiff,
			double excessPriceDiff, Date editTime) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("GUEST_ID", guestId);
		map.put("IMPORT_TIME", importTime);
		map.put("BARREL_COUNT_DIFF", barrelCountDiff);
		map.put("BOTTLE_COUNT_DIFF", bottleCountDiff);
		map.put("EXCESS_PRICE_DIFF", excessPriceDiff);
		map.put("EDIT_TIME", editTime);
		
		try{
			drinkingWaterMapper.updateAfterTime(map);
		}catch(Exception e){
			return 0;
		}
		
		return 1;
	}
	
	
	
}