package org.ld.service;

import java.util.Date;
import java.util.List;

import org.ld.model.DailyService;
import org.ld.model.FacSta;
import org.ld.model.GroceryItem;
import org.ld.model.GroceryRunning;
import org.ld.model.Plan;
import org.ld.model.PlanDetail;
import org.ld.model.PlanProgress;
import org.ld.model.RoomItem;
import org.ld.model.Sources;

public interface ItemService {

	List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage);

	int getTotal(String type, String cat, String band);

	List<Plan> getPlans(Integer st, Integer eachPage);

	Plan searchPlanByPlanid(Integer plan_id);

	int getTotalPlan();

	int addNewPlan(Plan p);
	
	int updatePlan(Plan p);

	int addNewPlanDetail(PlanDetail d);
	
	PlanDetail getPlanDetailByID(int id);
	
	int updatePlanDetain(PlanDetail d);
	
	int getTotalPlanDetail(int pid);
	
	List<PlanDetail> getPlanDetails(int pid, int st, int eachPage);
	
	int getTotalPlanProgress(int pid);
	
	int addNewPlanProgress(PlanProgress pg);
	
	List<PlanProgress> getPlanProgresses(int pid, int st, int eachPage);

	Plan getPlanByName(String s);



	//add by yck
	FacSta getFacByItemInfo(String type, String cat, String brand, String name, String owner, String repoNum);

	int addNewFac(FacSta f);

	List<FacSta> getFacByTypeCatBand(String type, String cat, String brand, String band, int st, int eachPage);

	List<FacSta> getFacByTypeCatBandAll(String type, String cat, String band);

	FacSta getFac(Integer id);
	
	int updateFac(FacSta fs);
//
//	FacSta getFacByNumber(String no);

	int totalItemByRoomType(int rid, String type);
	
	int totalGrocery(String goods);
	
	List<GroceryItem> getGrocery(String goods, int st, int eachPage);
	
	GroceryItem getCertainGrocery(int ID);
	
	int addGrocery(GroceryItem goods);
	
	int addGroceryRec(GroceryRunning gr);
	
	List<GroceryRunning> getGroceryRunning(int id, int st, int eachPage, Date from, Date to);
	
	int updateGrocery(GroceryItem goods);
	
	int totalGroceryRunning(int id, Date from, Date to);


}
