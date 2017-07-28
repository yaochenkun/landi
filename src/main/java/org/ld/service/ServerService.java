package org.ld.service;

import java.util.Date;
import java.util.List;

import org.ld.model.*;

public interface ServerService {

	int getTotalDailyServiceRow(String rn, int type);

	int getTotalSourcesRow(String rn, String type);

	int getExactTotalSourcesRow(String rn, String type);//房间号精确查询

	List<DailyService> searchBill(String rn, int type, int st, int eachPage);

	List<Sources> searchSource(String rn, String type, int st, int eachPage);

	List<Sources> searchExactSource(String rn, String type, int st, int eachPage);//房间号精切查询

	int addDailyService(DailyService service);

	int addSources(Sources source);

	Sources getSource(String num, String type);

	List<Sources> getPairSource(String num);
	
	//by lyd
	List<Staff> searchStaff(String DUTY);

	int addTakeaway(Meal meal);
	
	int getTotalMealRow(String rn , Date date);
	
	List<Meal> searchMeal(String rn, Date date ,int st, int eachPage);
	
	int deleteMeal(Integer id);
	
	int updateMeal(Meal l);
	
	Meal getMealById(Integer id);
	
	int addShoeCleaning(ShoesPolishing shoe);
	
	int getTotalShoeCleaningRow(String rn , Date date);
	
	List<ShoesPolishing> searchShoeCleaning(String rn, Date date , int st, int eachPage);
	
	int deleteShoesPolishing(Integer id);
	
	ShoesPolishing getShoesPolishingById(Integer id);
	
	int updateShoesPolishing(ShoesPolishing shoe);
	
	int addAgentPurchase(AgentPurchase agent);
	
	int getTotalAgentPurchaseRow(String rn , Date date);
	
	List<AgentPurchase> searchAgentPurchase(String rn,Date date, int st, int eachPage);
	
	int deleteAgentPurchase(Integer id);
	
	AgentPurchase getAgentPurchaseById(Integer id);
	
	int updateAgentPurchase(AgentPurchase agent);
	
	List<AgentPurchase> getAllAgentPurchase(String rn , Date date);
	
	List<ShoesPolishing> getAllShoesPolishing(String rn , Date date);
	
	List<Meal> getAllMeal(String rn , Date date);

	int addExpenseOfLE(CostLe cost);
}
