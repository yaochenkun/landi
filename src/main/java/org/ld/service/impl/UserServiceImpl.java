package org.ld.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	public User getUserByUserName(String name){
		return userInfoMapper.selectByUserName(name);
	}
	@Override
	public int insert(User userInfo) {
		
		int result = userInfoMapper.insert(userInfo);
		
		System.out.println(result);
		return result;
	}
	@Override
	public List<User> selectUserRange(int st, int ed){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ST", st);
		map.put("ED", ed);
		List<User> user_list = new ArrayList<User>();
		user_list = userInfoMapper.selectIdRange(map);
		
		return user_list;
	}
	@Override
	public int totalRow(){
		return userInfoMapper.totalRow();
	}
}
