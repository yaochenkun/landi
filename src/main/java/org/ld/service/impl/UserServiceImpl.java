package org.ld.service.impl;

import org.ld.dao.UserMapper;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userInfoMapper;

	@Override
	public User getUserById(int id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}

	public User getUserByName(String name){
		return userInfoMapper.selectUserByName(name);
	}
	@Override
	public int insert(User userInfo) {
		
		int result = userInfoMapper.insert(userInfo);
		
		System.out.println(result);
		return result;
	}

}
