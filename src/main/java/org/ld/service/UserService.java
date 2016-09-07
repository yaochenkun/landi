package org.ld.service;

import org.ld.model.User;


public interface UserService {

	// 根据用户id查询用户
	User getUserById(int id);
	
	// 根据用户名查询用户
	User getUserByName(String name);
	
	// 插入一个用户
	int insert(User userInfo);
}
