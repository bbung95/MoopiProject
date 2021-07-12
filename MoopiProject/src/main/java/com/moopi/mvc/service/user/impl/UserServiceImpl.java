package com.moopi.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.UserDao;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserDao userDao;
	
	public User getUser(String userId) {
		System.out.println("2. UserServiceImpl_____getUser Start");
		return userDao.getUser(userId);		
	}
	
	public void addUser(User user) throws Exception {
		System.out.println("유저 : 에드유저 스타트");
		userDao.addUser(user);
	}
	
	public Map<String, Object> getUserList(Search search) throws Exception{
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

}