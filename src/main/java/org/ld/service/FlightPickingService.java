package org.ld.service;

import java.util.Date;
import java.util.List;

import org.ld.model.FlightPicking;

public interface FlightPickingService {
	
	int addFlightPicking(FlightPicking bean);
	int getTotalFlightPickingByRoomNumber_Time(String roomNumber, Date time);
	List<FlightPicking> getFlightPickingByRoomNumber_Time(String roomNumber, Date time, int startPage, int eachPage);
}
