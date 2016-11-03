package org.ld.service;

import java.util.List;

import org.ld.model.DailyService;

public interface ServerService {

	int getTotalRow(String rn, int type);
	
	List<DailyService> searchBill(String rn, int type, int st, int eachPage); 
}
