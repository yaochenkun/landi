package org.ld.service;

import java.util.List;

import org.ld.model.Guest;
import org.ld.model.GuestBalance;
import org.ld.model.Host;
import org.ld.model.Intern;
import org.ld.model.GuestService;

public interface GuestMissionService {

	Guest getGuestById(int id);

	List<Guest> getGuestByName(String name, int st, int eachPage);

	Guest getGuestByRoomNumber(String s);

	Guest getGuestByContract(String ct);

	int addGuest(Guest t);

	int addHost(Host t);

	int addIntern(Intern t);

	int addGuestBalance(GuestBalance t);

	int addGuestService(GuestService t);
	
	int delGuest(int id);
	
	int getTotal();
	
	List<Guest> getGuestList(int st, int eachPage);
}