package org.ld.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.DailyServiceMapper;
import org.ld.dao.SourcesMapper;
import org.ld.model.DailyService;
import org.ld.model.Sources;
import org.ld.service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("serverService")
public class ServerServiceImpl implements ServerService {
	
	private static Logger logger = Logger.getLogger("logDev");
	
	@Autowired
	private DailyServiceMapper dailyServiceMapper;
	
	@Autowired
	private SourcesMapper sourcesMapper;

	@Override
	public int getTotalDailyServiceRow(String rn, int type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("TYPE", type);
		return dailyServiceMapper.getTotalRow(map);
	}

	@Override
	public List<DailyService> searchBill(String rn, int type, int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("RN", rn);
		map.put("TYPE", type);
		map.put("ST", st);
		map.put("EACH", eachPage);
		
		if(rn != null) 
			return dailyServiceMapper.getDailyServiceRange(map);
		else 
			return dailyServiceMapper.getAllDailyServiceRange(map);
	}

	@Override
	public List<Sources> searchSource(String rn, int type, int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("RN", rn);
		map.put("TYPE", type);
		map.put("ST", st);
		map.put("EACH", eachPage);
		
		if(rn != null)
			return sourcesMapper.getSourcesRange(map);
		else 
			return sourcesMapper.getAllSourcesRange(map);
	}
	
	@Override
	public int getTotalSourcesRow(String rn, int type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("TYPE", type);
		return sourcesMapper.getTotalRow(map);
	}

	@Override
	public int addDailyService(DailyService service) {
		// TODO Auto-generated method stub
		try{
			dailyServiceMapper.insert(service);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addSources(Sources source) {
		// TODO Auto-generated method stub
		try{
			sourcesMapper.insert(source);
			return 1;
		} catch(Exception e)
		{
			logger.error(e.getCause());
			return 0;
		}
	}
}