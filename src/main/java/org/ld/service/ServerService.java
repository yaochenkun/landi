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

	List<Sources> getCertainSources(String rn,String guestname, String type,String date);

	List<Sources> getCertainSourcesByDay(String rn,String guestname, String type,String date);

	List<Sources> searchExactSource(String rn, String type, int st, int eachPage);//房间号精切查询

	int addDailyService(DailyService service);

	int addSources(Sources source);

	Sources getSource(String num, String type);

	Sources getGasSource(String num, String type ,String meter);



	List<Sources> getPairSource(String num);

	//lyd
	List<Sources> getLookupSource(String rn, String type,String guest);
	List<Sources> getHistoryLookupSource(String rn, String type);


	//by lyd
	List<Staff> searchStaff(String DUTY);

	int addTakeaway(Meal meal);
	
	int getTotalMealRow(String rn , String date);  //liyidan
	
	List<Meal> searchMeal(String rn, String date ,int st, int eachPage); //liyidan
	
	int deleteMeal(Integer id);
	
	int updateMeal(Meal l);
	
	Meal getMealById(Integer id);
	
	int addShoeCleaning(ShoesPolishing shoe);
	
	int getTotalShoeCleaningRow(String rn , String date);//lyd
	
	List<ShoesPolishing> searchShoeCleaning(String rn, String date , int st, int eachPage);//lyd

	List<ShoesPolishing> getCertainShoesPolishings(String num,String guestId,String date);

	List<ShoesPolishing> getCertainShoesPolishingsByDay(String num,String guestId,String date);

	int deleteShoesPolishing(Integer id);
	
	ShoesPolishing getShoesPolishingById(Integer id);
	
	int updateShoesPolishing(ShoesPolishing shoe);
	
	int addAgentPurchase(AgentPurchase agent);
	
	int getTotalAgentPurchaseRow(String rn , String date);//lyd
	
	List<AgentPurchase> searchAgentPurchase(String rn,String date, int st, int eachPage);//lyd
	
	int deleteAgentPurchase(Integer id);
	
	AgentPurchase getAgentPurchaseById(Integer id);
	
	int updateAgentPurchase(AgentPurchase agent);
	
	List<AgentPurchase> getAllAgentPurchase(String rn , String date);//lyd

	List<AgentPurchase> getCertainAgentPurchases(String num,String guestId,String date);

	List<AgentPurchase> getCertainAgentPurchasesByDay(String num,String guestId,String date);

	List<ShoesPolishing> getAllShoesPolishing(String rn , String date);//lyd
	
	List<Meal> getAllMeal(String rn , String date);//by liyidan

	List<Meal> getCertainMeals(String num,String guestId,String date);

	List<Meal> getCertainMealsByDay(String num,String guestId,String date);

	int addExpenseOfLE(CostLe cost);
}
