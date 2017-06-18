package org.ld.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.AgentPurchaseMapper;
import org.ld.dao.DailyServiceMapper;
import org.ld.dao.SourcesMapper;
import org.ld.dao.StaffMapper;
import org.ld.dao.MealMapper;
import org.ld.dao.ShoesPolishingMapper;
import org.ld.model.AgentPurchase;
import org.ld.model.DailyService;
import org.ld.model.Laundry;
import org.ld.model.Meal;
import org.ld.model.ShoesPolishing;
import org.ld.model.Sources;
import org.ld.model.Staff;
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
	
	@Autowired
	private StaffMapper staffMapper;
	
	@Autowired
	private MealMapper mealMapper;
	
	@Autowired
	private ShoesPolishingMapper shoesPolishingMapper;
	
	@Autowired
	private AgentPurchaseMapper agentPurchaseMapper;

	@Override
	public int getTotalDailyServiceRow(String rn, int type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(rn != null) map.put("RN", rn);
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

		if (rn != null)
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

		if (rn != null)
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
		try {
			dailyServiceMapper.insert(service);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int addSources(Sources source) {
		// TODO Auto-generated method stub
		try {
			sourcesMapper.insert(source);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public List<Staff> searchStaff(String DUTY){ 
		try{
			return staffMapper.selectByDuty(DUTY);
		} catch(Exception e) {
			logger.error(e.getCause());
			return null;
		}
	}
	
	//餐费
	@Override
	public int addTakeaway(Meal meal){
	   try{
			mealMapper.insertSelective(meal);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int getTotalMealRow(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		return mealMapper.getTotalRow(map);
	}
	
	@Override
	public List<Meal> searchMeal(String rn, Date date,int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("RN", rn);
		map.put("DATE", date);
		map.put("ST", st);
		map.put("EACH", eachPage);

		if (rn != null)
			return mealMapper.getMealRange(map);
		else
			return mealMapper.getAllMealRange(map);
		
	}
	@Override
	public int deleteMeal(Integer id) { 
	
		try {
			return mealMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int updateMeal(Meal l) {
		// TODO Auto-generated method stub
		try{
			mealMapper.updateByPrimaryKeySelective(l);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public Meal getMealById(Integer id) {
		// TODO Auto-generated method stub
		return mealMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int addShoeCleaning(ShoesPolishing shoe){		
		try{
			shoesPolishingMapper.insertSelective(shoe);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public List<ShoesPolishing> searchShoeCleaning(String rn, Date date , int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("RN", rn);
		map.put("ST", st);
		map.put("DATE", date);
		map.put("EACH", eachPage);

		if (rn != null)
			return shoesPolishingMapper.getShoesPolishingRange(map);
		else
			return shoesPolishingMapper.getAllShoesPolishingServiceRange(map);
	}
	
	@Override
	public int getTotalShoeCleaningRow(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("OCCUR_TIME", date);
		return shoesPolishingMapper.getTotalRow(map);
	}
	
	@Override
	public int deleteShoesPolishing(Integer id) { 	
		try {
			return shoesPolishingMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public ShoesPolishing getShoesPolishingById(Integer id){
		// TODO Auto-generated method stub
		return shoesPolishingMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<ShoesPolishing> getAllShoesPolishing(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("OCCUR_TIME", date);
		return shoesPolishingMapper.getAll(map);
	}
	
	@Override
	public int updateShoesPolishing(ShoesPolishing shoe){
		// TODO Auto-generated method stub
		try{
			shoesPolishingMapper.updateByPrimaryKeySelective(shoe);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int addAgentPurchase(AgentPurchase agent){
		try{
			agentPurchaseMapper.insertSelective(agent);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public int getTotalAgentPurchaseRow(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		return agentPurchaseMapper.getTotalRow(map);
	}
	
	@Override
	public List<AgentPurchase> searchAgentPurchase(String rn,Date date, int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("RN", rn);
		map.put("ST", st);
		map.put("DATE", date);
		map.put("EACH", eachPage);

		if (rn != null)
			return agentPurchaseMapper.getAgentPurchaseRange(map);
		else
			return agentPurchaseMapper.getAllAgentPurchaseServiceRange(map);
	}
	
	@Override
	public int deleteAgentPurchase(Integer id){
		try {
			return agentPurchaseMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public AgentPurchase getAgentPurchaseById(Integer id){
		// TODO Auto-generated method stub
		return agentPurchaseMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int updateAgentPurchase(AgentPurchase agent){
		// TODO Auto-generated method stub
		try{
			agentPurchaseMapper.updateByPrimaryKeySelective(agent);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}
	
	@Override
	public List<AgentPurchase> getAllAgentPurchase(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("DATE", date);
		return agentPurchaseMapper.getAll(map);
	}
	
	@Override
	public List<Meal> getAllMeal(String rn , Date date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("OCCUR_TIME", date);
		return mealMapper.getAll(map);
	}
	
}