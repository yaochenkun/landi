package org.ld.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.DailyServiceMapper;
import org.ld.dao.RoomItemMapper;
import org.ld.dao.SourcesMapper;
import org.ld.model.DailyService;
import org.ld.model.RoomItem;
import org.ld.model.Sources;
import org.ld.service.ItemService;
import org.ld.service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("itemService")
public class ItemServiceImpl implements ItemService {
	
	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private DailyServiceMapper dailyServiceMapper;
	
	@Autowired
	private SourcesMapper sourcesMapper;
	
	@Autowired
	private RoomItemMapper roomItemMapper;

	@Override
	public List<RoomItem> getItems(Integer rid, Integer type, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("st", st);
		map.put("each", eachPage);
		if(rid == null && type == null) {
			return roomItemMapper.getAllItems(map);
		} else if(rid != null && type != null) {
				
				map.put("room_id", rid);
				map.put("type", type);
				return roomItemMapper.getItems(map);
		}
		else if(rid != null)
			return roomItemMapper.getItemsByRoom(map);
		else
			return roomItemMapper.getItemsByType(map);
	}

	@Override
	public int getTotal(Integer rid, Integer type) {
		// TODO Auto-generated method stub
		if(rid == null && type == null) {
			return roomItemMapper.getTotal();
		} else if(rid != null && type != null) {
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("room_id", rid);
				map.put("type", type);
				return roomItemMapper.getTotal(map);
		}
		else if(rid != null)
			return roomItemMapper.getTotalByRoom(rid);
		else
			return roomItemMapper.getTotalByType(type);
	}	
}