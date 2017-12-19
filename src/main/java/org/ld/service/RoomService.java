package org.ld.service;

import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.MediaSize.Other;

import org.ld.model.*;

public interface RoomService {

	Room getRoomById(int id);

	Room getRoomByNumber(String rn);

	List<Room> getRoomByType(String type);

	List<Room> getRoomByState(int state);

	List<Room> getAllRoom();

	List<RoomState> getAllRoomState();

	List<RoomState> getTotalRoomState();

	int insert(Room roomInfo);

	int update(Room roomInfo);


	int totalRow();


	List<RoomPic> getPic(Integer rid);
	//房间更新
	int updateRoom(Room room);

	List<Room> getAllEditedTypeRoom();

	int getTotalRoom(String rNum, String roomType);

	List<Room> searchRoom(String rNum, String roomType,Integer st, Integer eachPage);

	List<Room> searchAllRoom(String rnum,String type);

	//LE 承担费用
	int getTotalExpense(String rNum, String type);

	List<CostLe> searchExpense(String rNum, String type, Integer st, Integer eachPage);

	List<CostLe> searchAllExpense(String rnum,String type);


	/**
	 * 能源
	 */
	int insertRoomPic(RoomPic roomPic);


	
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
	int totalLaundry(String rn,String date); //时间段日期查询，参数由Date 更改为String
	
	List<Laundry> getLaundry(String rn, String date, Integer st, Integer eachPage); //date parameter changed
	
	Laundry getCertainLaundry(String rn, Integer gid, Date date);
	
	int addWash(Laundry l);
	
	int updateWash(Laundry l);
	
	int deleteWash(Integer id);
	
	Laundry getWashById(Integer id);
	
	List<Laundry> getAllWashes(String rn, String date); //lyd
	
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
	
	List<ShuttleBus> getAllShuttleBus(String rn, Integer year, Integer mon);
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
	
	RoomState getCertainRSbyNumber(String number); //要求 state=1

	RoomState getCertainRSbyRoomNumber(String number);
	
	/**
	 * 接送机
	 */
	int addFlightPicking(FlightPicking bean);
	int getTotalFlightPickingByRoomNumber_Time(String roomNumber, String time);//lyd
	List<FlightPicking> getAllFlightPickings(String roomNumber, String time); //lyd
	List<FlightPicking> getFlightPickingByRoomNumber_Time(String roomNumber, String time, int startPage, int eachPage);//lyd
	FlightPicking getFlightPickingById(Integer id);
	int deleteFlightPickingById(Integer id);
	int updateFlightPicking(FlightPicking fp);

	
	/**
	 * 其它车费
	 */
	int addOtherFare(OtherFare bean);
	int getTotalOtherFares(String roomNum, String occurTime); //lyd
    List<OtherFare> getOtherFaresByPage(String roomNum, String occurTime, int startPage, int eachPage);//lyd
    List<OtherFare> getAllOtherFares(String roomNum, String occurTime); //lyd
    int deleteOtherFareById(Integer id);
    OtherFare getOtherFareById(Integer id);
    int updateOtherFare(OtherFare bean);
    
    /**
     * 饮用水费
     */
    double getDrinkingWaterUnitPrice(String roomNum);
    DrinkingWater getLastDrinkingWater(Integer gid);
    DrinkingWater getLastBeforeDrinkingWater(Integer gid, Date time);
    int addDrinkingWater(DrinkingWater dw);
    int getTotalDrinkingWaters(String roomNum, String occurTime);//lyd
    List<DrinkingWater> getDrinkingWatersByPage(String roomNum, String occurTime, int startPage, int eachPage);//lyd
    List<DrinkingWater> getAllDrinkingWaters(String roomNum, String occurTime); //lyd
    int deleteWaterBillById(Integer id);
    DrinkingWater getDrinkingWater(Integer id);
    int updateDrinkingWater(DrinkingWater bean);
    int updateAfterDrinkingWaters(Integer guestId, Date importTime, int barrelCountDiff, int bottleCountDiff, double excessPriceDiff, Date editTime);

//	room_meter
	List<RoomMeter> getRoomMeterByNumber(Integer roomNum);
	int updateRoomMeter(RoomMeter roomMeter);
	int getRoomMeterRow(Integer nm,String type);
	List<RoomMeter> searchRoomMeter(String nm,String type,int st,int eachpage);
	List<RoomMeter> getMeters(Integer rid, String type,int st,int eachPage);
	List<RoomMeter> getMeterById(Integer id);

	RoomMeter getMeter(Integer ID,String type);
	RoomMeter getGasMeter(Integer ID,String type,String meterNum);

//	int updateMeter(RoomMeter MeterInfo);

	/**
	 * sources
	 */
//	int updateSources(Sources s);
	int addSources(Sources s);
}