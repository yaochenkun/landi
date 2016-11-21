package org.ld.service;

import java.util.List;

import org.ld.model.DailyService;
import org.ld.model.Sources;

public interface ServerService {

	int getTotalDailyServiceRow(String rn, int type);
	
	int getTotalSourcesRow(String rn, int type);
	
	List<DailyService> searchBill(String rn, int type, int st, int eachPage);
	
	List<Sources> searchSource(String rn, int type, int st, int eachPage);
}
