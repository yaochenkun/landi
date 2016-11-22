package org.ld.service;

import java.util.List;

import org.ld.model.DailyService;
import org.ld.model.RoomItem;
import org.ld.model.Sources;

public interface ItemService {

	List<RoomItem> getItems(Integer rid, Integer type, Integer st, Integer eachPage);
	
	int getTotal(Integer rid, Integer type);
}
