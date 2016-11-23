package org.ld.service;

import java.util.List;

import org.ld.model.DailyService;
import org.ld.model.FacSta;
import org.ld.model.Plan;
import org.ld.model.PlanDetail;
import org.ld.model.RoomItem;
import org.ld.model.Sources;

public interface ItemService {

	List<RoomItem> getItems(Integer rid, String type, Integer st, Integer eachPage);
	
	int getTotal(Integer rid, String type);
	
	List<Plan> getPlans(Integer st, Integer eachPage);
	
	int getTotalPlan();
	
	int addNewPlan(Plan p);
	
	int addNewPlanDetail(PlanDetail d);
	
	Plan getPlanByName(String s);
	
	int addNewFac(FacSta f);
	
	List<FacSta> getFacByTypeCatBand(String type, String cat, String band);
	
	FacSta getFac(Integer id);
	
	FacSta getFacByNumber(String no);
}
