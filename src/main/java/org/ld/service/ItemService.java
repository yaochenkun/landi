package org.ld.service;

import java.util.Date;
import java.util.List;

import org.ld.model.*;

public interface ItemService {

	//add by yck
	int getTotalItemsByRoomNum_Type(String roomNum, String type);
	List<RoomItem>  getItemsByRoomNum_Type(String roomNum, String type, Integer st, Integer eachPage);
	List<RoomItem> getAllRoomItemByType_RoomNum(String roomNum, String type);

	boolean isRoomItemExist(String tag);



	List<RoomItem> getItems(String roomNum, String type, Integer st, Integer eachPage);

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

	int deleteGrocery(int id);



	//库房物品
	int getTotalRepoItemByType_RepoNum(String type, String repoNum);
	List<FacSta> getRepoItemByType_RepoNum(String type, String repoNum, int startPage, int eachPage);
	List<FacSta> getAllRepoItemByType_RepoNum(String type, String repoNum);

	//房间物品
	int updateRoomItem(RoomItem roomItem);

	//库房查询
	Repository getRepoByRepoNum(String repoNum);
}
