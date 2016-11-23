package org.ld.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.DailyServiceMapper;
import org.ld.dao.FacStaMapper;
import org.ld.dao.PlanDetailMapper;
import org.ld.dao.PlanMapper;
import org.ld.dao.RoomItemMapper;
import org.ld.dao.SourcesMapper;
import org.ld.model.DailyService;
import org.ld.model.FacSta;
import org.ld.model.Plan;
import org.ld.model.PlanDetail;
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
	private FacStaMapper facStaMapper;
	
	@Autowired
	private RoomItemMapper roomItemMapper;
	
	@Autowired
	private PlanMapper planMapper;
	
	@Autowired
	private PlanDetailMapper planDetailMapper;
	
	@Override
	public List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
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
	public int getTotal(Integer rid, String type) {
		// TODO Auto-generated method stub
		if(rid == null && type == null) {
			return roomItemMapper.getAllTotal();
		} else if(rid != null && type != null) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("room_id", rid);
				map.put("type", type);
				return roomItemMapper.getTotal(map);
		}
		else if(rid != null)
			return roomItemMapper.getTotalByRoom(rid);
		else
			return roomItemMapper.getTotalByType(type);
	}

	@Override
	public List<Plan> getPlans(Integer st, Integer eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("st", st);
		map.put("each", eachPage);
		return planMapper.getPlans(map);
	}

	@Override
	public int getTotalPlan() {
		// TODO Auto-generated method stub
		return planMapper.getTotal();
	}

	@Override
	public int addNewPlan(Plan p) {
		// TODO Auto-generated method stub
		try{
			planMapper.insert(p);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addNewPlanDetail(PlanDetail d) {
		// TODO Auto-generated method stub
		try{
			planDetailMapper.insert(d);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public Plan getPlanByName(String s) {
		// TODO Auto-generated method stub
		return planMapper.selectByName(s);
	}

	@Override
	public int addNewFac(FacSta f) {
		// TODO Auto-generated method stub
		try{
			facStaMapper.insert(f);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public List<FacSta> getFacByTypeCatBand(String type, String cat, String band) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("cat", cat);
		map.put("band", band);
		return facStaMapper.getFacByTypeCatBand(map);
	}

	@Override
	public FacSta getFac(Integer id) {
		// TODO Auto-generated method stub
		return facStaMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public FacSta getFacByNumber(String no) {
		// TODO Auto-generated method stub
		return facStaMapper.selectByNumber(no);
	}	
}