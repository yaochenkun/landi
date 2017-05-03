package org.ld.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.ld.dao.FlightPickingMapper;
import org.ld.model.FlightPicking;
import org.ld.service.FlightPickingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

@Service("flightPickingService")
public class FlightPickingServiceImpl implements FlightPickingService{

	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private FlightPickingMapper flightPickingMapper;
	
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
}
