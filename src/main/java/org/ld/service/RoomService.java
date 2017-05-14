package org.ld.service;

import java.util.Date;
import java.util.List;

import org.ld.model.FlightPicking;
import org.ld.model.Laundry;
import org.ld.model.Maintain;
import org.ld.model.Room;
import org.ld.model.RoomItem;
import org.ld.model.RoomMeter;
import org.ld.model.RoomPic;
import org.ld.model.RoomState;
import org.ld.model.ShuttleBus;

public interface RoomService {

	Room getRoomById(int id);

	Room getRoomByNumber(String rn);

	List<Room> getRoomByType(String type);

	List<Room> getRoomByState(int state);

	List<Room> getAllRoom();

	List<RoomState> getAllRoomState();

	int insert(Room roomInfo);

	int update(Room roomInfo);


	int totalRow();


	List<RoomPic> getPic(Integer rid);

	/**
	 * 能源
	 */
	int insertRoomPic(RoomPic roomPic);

	List<RoomMeter> getMeters(Integer rid, Integer type);

	RoomMeter getMeter(String mn);
	
	int updateMeter(RoomMeter MeterInfo);
	
	/**
	 * 房间物品
	 */
	
	int totalRowByItem(Integer item_id);
	
	List<RoomItem> getItemByItemID(Integer item_id, Integer st, Integer eachPage);
	
	RoomItem getCertainRIRec(Integer id);
	
	int insertRI(RoomItem ri);
	
	int deleteRI(Integer id);
	
	List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage);
	
	/**
	 * 洗衣
	 */
	int totalLaundry(String rn,Date date);
	
	List<Laundry> getLaundry(String rn, Date date, Integer st, Integer eachPage);
	
	Laundry getCertainLaundry(String rn, Integer gid, Date date);
	
	int addWash(Laundry l);
	
	int updateWash(Laundry l);
	
	int deleteWash(Integer id);
	
	Laundry getWashById(Integer id);
	
	/**
	 * 通勤车
	 */
	ShuttleBus getShuttleBusById(Integer id);
	
	int totalShuttleBus(String rn, Integer year, Integer mon);
	
	List<ShuttleBus> getShuttleBus(String rn, Integer year, Integer mon, Integer st, Integer eachPage);
	
	ShuttleBus getCertainShuttleBus(String rn, Integer gid, Integer year, Integer mon);
	
	int addShuttleBus(ShuttleBus sb);
	
	int updateShuttleBus(ShuttleBus sb);
	
	int deleteShuttleBus(Integer id);
	
	int getFareUnitPrice(String roomNum);
	
	/**
	 * 维修报修
	 */
	int addMaintain(Maintain m);
	
	int updateMaintain(Maintain m);
	
	int totalMaintain(Integer type, Integer cat, Integer state, String rn, Date from, Date to);
	
	Maintain getCertainMaintain(int ID);
	
	List<Maintain> getMaintain(Integer type, Integer cat, Integer state, String rn, Integer st, Integer eachPage, Date from, Date to, Integer order);
	
	int updateRoomState(RoomState rs);
	
	RoomState getCertainRSbyID(Integer id);
	
	RoomState getCertainRSbyNumber(String number);
	
	/**
	 * 接送机
	 */
	int addFlightPicking(FlightPicking bean);
	int getTotalFlightPickingByRoomNumber_Time(String roomNumber, Date time);
	List<FlightPicking> getFlightPickingByRoomNumber_Time(String roomNumber, Date time, int startPage, int eachPage);
	FlightPicking getFlightPickingById(Integer id);
	int deleteFlightPickingById(Integer id);
	int updateFlightPicking(FlightPicking fp);
}