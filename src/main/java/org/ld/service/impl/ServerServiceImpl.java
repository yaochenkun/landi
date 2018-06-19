package org.ld.service.impl;

import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.log4j.Logger;
import org.ld.dao.*;
import org.ld.model.*;
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

	@Autowired
	private CostLeMapper costLeMapper;

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
	public List<Sources> searchSource(String rn, String type, int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("RN", rn);
		map.put("TYPE", type);
		map.put("ST", st);
		map.put("EACH", eachPage);

		return sourcesMapper.getSourcesRange(map);
	}

	@Override //房间号精确查询
	public List<Sources> searchExactSource(String rn, String type, int st, int eachPage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("RN", rn);
		map.put("TYPE", type);
		map.put("ST", st);
		map.put("EACH", eachPage);

		return sourcesMapper.getExactSourcesRange(map);
	}


	@Override
	public int getTotalSourcesRow(String rn, String type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("TYPE", type);
		return sourcesMapper.getTotalRow(map);
	}

	@Override
	public int getExactTotalSourcesRow(String rn, String type) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("TYPE", type);
		return sourcesMapper.getExactTotalRow(map);
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
			sourcesMapper.insertSelective(source);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public Sources getSource(String num, String type){
		HashMap<String,Object>  map = new HashMap<String,Object>();
		map.put("ROOM_NUMBER",num);
		map.put("TYPE",type);

        return sourcesMapper.getSources(map);
	}

	@Override
	public Sources getGasSource(String num, String type , String meter){
		HashMap<String,Object>  map = new HashMap<String,Object>();
		map.put("ROOM_NUMBER",num);
		map.put("TYPE",type);
		System.out.println(meter);
		map.put("METER",meter);

		return sourcesMapper.getGasSources(map);
	}

	@Override
	public List<Sources> getPairSource(String num){ //取一对最新的gas数据
		List<Sources> ans = new ArrayList<Sources>();
		HashMap<String,Object>  map = new HashMap<String,Object>();
		map.put("ROOM_NUMBER",num);
		map.put("METER",num+"_1");

		HashMap<String,Object>  map2 = new HashMap<String,Object>();
		map2.put("ROOM_NUMBER",num);
		map2.put("METER",num+"_2");

		ans.add(sourcesMapper.getSingleSources(map));
		ans.add(sourcesMapper.getSingleSources(map2));


		return ans;
	}

	@Override
	public List<Sources> getLookupSource(String rn, String type, String guest) {
		Map<String,Object> map = new HashMap<>();
		map.put("ROOM_NUMBER",rn);
		map.put("TYPE",type);
		map.put("GUEST",guest);

		return sourcesMapper.getLookupSource(map);
	}

	@Override
	public List<Sources> getHistoryLookupSource(String rn, String type) {
		Map<String,Object> map = new HashMap<>();
		map.put("ROOM_NUMBER",rn);
		map.put("TYPE",type);
		map.put("GUEST",null);
		return sourcesMapper.getLookupSource(map);

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
	public int getTotalMealRow(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String startDate = date.split(" ")[0];
		String endDate = date.split(" ")[2];
		try{
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
			map.put("RN", rn);
			map.put("STARTDATE", start);
			map.put("ENDDATE",end);
			return mealMapper.getTotalRow(map);

		}catch(Exception e){
			logger.error(e.getCause());
			return 0;
		}

	}

	@Override
	public List<Meal> getCertainMeals(String num,String guestId,String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", num);
		map.put("GID", guestId);
		map.put("DATE", date);

		return mealMapper.getCertainMeals(map);
	}

	@Override
	public List<Meal> getCertainMealsByDay(String num,String guestId,String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[0]);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[2]);
			map.put("RN", num);
			map.put("GID", guestId);
			map.put("STARTDATE", start);
			map.put("ENDDATE", end);

			return mealMapper.getCertainMealsByDay(map);

		}catch (Exception e){
			logger.error(e.getCause());
			return null;
		}

	}


	@Override
	public List<Meal> searchMeal(String rn, String date,int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String startDate = date.split(" ")[0];
		String endDate = date.split(" ")[2];
		try{
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
			map.put("RN", rn);
			map.put("STARTDATE", start);
			map.put("ENDDATE",end);
			map.put("ST", st);
			map.put("EACH", eachPage);
			return mealMapper.getMealRange(map);

		} catch (Exception e){
			logger.error(e.getCause());
			return null;
		}
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
	public List<ShoesPolishing> searchShoeCleaning(String rn, String date , int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN", rn);
			map.put("ST", st);
			map.put("START_DATE", startDate);
			map.put("END_DATE",endDate);
			map.put("EACH", eachPage);
			return shoesPolishingMapper.getShoesPolishingRange(map);
		}catch(Exception e ){
			logger.error(e.getCause());
			return null;
		}

	}
	
	@Override
	public int getTotalShoeCleaningRow(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN", rn);
			map.put("START_OCCUR_TIME", startDate);
			map.put("END_OCCUR_TIME", endDate);
			System.out.println(shoesPolishingMapper.getTotalRow(map));
			return shoesPolishingMapper.getTotalRow(map);
		}catch(Exception e ){
			logger.error(e.getCause());
			return 0;
		}

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
	public List<ShoesPolishing> getAllShoesPolishing(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN",rn);
			map.put("START_OCCUR_TIME",startDate);
			map.put("END_OCCUR_TIME",endDate);
			return shoesPolishingMapper.getAll(map);
		}catch(Exception e){
			logger.error(e.getCause());
			return null;
		}

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
	public int getTotalAgentPurchaseRow(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN",rn);
			map.put("START_DATE",startDate);
			map.put("END_DATE",endDate);
			return agentPurchaseMapper.getTotalRow(map);

		}catch (Exception e ){
			logger.error(e.getCause());
			return 0;
		}

	}
	
	@Override
	public List<AgentPurchase> searchAgentPurchase(String rn,String date, int st, int eachPage){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN", rn);
			map.put("ST", st);
			map.put("START_DATE", startDate);
			map.put("END_DATE",endDate);
			map.put("EACH", eachPage);

			return agentPurchaseMapper.getAgentPurchaseRange(map);
		}catch(Exception e) {
			logger.error(e.getMessage());
			return null;
		}


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
	public List<AgentPurchase> getAllAgentPurchase(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			String start = date.split(" ")[0];
			String end = date.split(" ")[2];
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
			map.put("RN", rn);
			map.put("START_DATE", startDate);
			map.put("END_DATE",endDate);

			return agentPurchaseMapper.getAll(map);

		}catch(Exception e){
			logger.error(e.getCause());
			return null;
		}

	}
	
	@Override
	public List<Meal> getAllMeal(String rn , String date){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String startDate = date.split(" ")[0];
		String endDate = date.split(" ")[2];
		try{
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
			map.put("RN", rn);
			map.put("STARTDATE", start);
			map.put("ENDDATE",end);
			return mealMapper.getAll(map);

		} catch (Exception e){
			logger.error(e.getCause());
			return null;
		}
	}

	@Override
	public int addExpenseOfLE(CostLe cost){
		try{
			costLeMapper.insertSelective(cost);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}


	@Override
	public List<ShoesPolishing> getCertainShoesPolishings(String num, String guestId, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", num);
		map.put("GID", guestId);
		map.put("DATE", date);

		return shoesPolishingMapper.getCertainShoesPolishings(map);
	}

	@Override
	public List<ShoesPolishing> getCertainShoesPolishingsByDay(String num, String guestId, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			map.put("RN", num);
			map.put("GID", guestId);
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[0]);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[2]);
			map.put("STARTDATE", start);
			map.put("ENDDATE", end);

			return shoesPolishingMapper.getCertainShoesPolishingsByDay(map);
		}catch(Exception e){
			logger.error(e.getCause());
			return null;
		}

	}

	@Override
	public List<AgentPurchase> getCertainAgentPurchases(String num, String guestId, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", num);
		map.put("GID", guestId);
		map.put("DATE", date);

		return agentPurchaseMapper.getCertainAgentPurchases(map);
	}

	@Override
	public List<AgentPurchase> getCertainAgentPurchasesByDay(String num, String guestId, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			map.put("RN", num);
			map.put("GID", guestId);
			Date start= new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[0]);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[2]);
			map.put("STARTDATE", start);
			map.put("ENDDATE", end);

			return agentPurchaseMapper.getCertainAgentPurchasesByDay(map);
		}catch(Exception e){
			logger.error(e.getCause());
			return null;
		}

	}

	@Override
	public List<Sources> getCertainSources(String rn, String guestname , String type, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("RN", rn);
		map.put("GNAME", guestname);
		map.put("TYPE", type);
		map.put("DATE", date);

		return sourcesMapper.getCertainSources(map);
	}

	@Override
	public List<Sources> getCertainSourcesByDay(String rn, String guestname , String type, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try{
			map.put("RN", rn);
			map.put("GNAME", guestname);
			map.put("TYPE", type);
			Date start = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[0]);
			Date end = new SimpleDateFormat("yyyy-MM-dd").parse(date.split(" ")[2]);
			map.put("STARTDATE", start);
			map.put("ENDDATE", end);

			return sourcesMapper.getCertainSourcesByDay(map);
		}catch (Exception e){
			logger.error(e.getCause());
			return null;
		}

	}
}