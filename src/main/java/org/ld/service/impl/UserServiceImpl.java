package org.ld.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.ld.dao.UserMapper;
import org.ld.model.User;
import org.ld.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/* 用户service实现类  */
@Service("userService")
public class UserServiceImpl implements UserService {

	private static Logger logger = Logger.getLogger("logDev");

	@Autowired
	private UserMapper userInfoMapper;

	@Override
	public User getUserById(int id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public User getUserByUserName(String name) {
		return userInfoMapper.selectByUserName(name);
	}

	@Override
	public int insert(User userInfo) {

		try {
			userInfoMapper.insert(userInfo);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public int updateUserInfo(User userInfo) {

		try {
			userInfoMapper.updateByPrimaryKeySelective(userInfo);
			return 1;
		} catch (Exception e) {
			logger.error(e.getCause());
			return 0;
		}
	}

	@Override
	public List<User> selectUserRange(int st, int each) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ST", st);
		map.put("EACH", each);
		List<User> user_list = new ArrayList<User>();
		user_list = userInfoMapper.selectIdRange(map);

		return user_list;
	}

	@Override
	public int totalRow() {
		return userInfoMapper.totalRow();
	}

	@Override
	public List<User> getAllUsers() {
		return userInfoMapper.selectAll();
	}
}
