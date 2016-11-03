package org.ld.service;

import java.util.List;

import org.ld.model.Guest;

public interface GuestService{
	
	Guest getGuestById(int id);
	
	List<Guest> getGuestByName(String name);
	
	Guest getGuestByRoomNumber(String s);
}