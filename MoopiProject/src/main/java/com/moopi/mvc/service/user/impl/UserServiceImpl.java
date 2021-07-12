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
		return userDao.getUser(userId);		
	}
	
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}
	
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	public Map<String, Object> getUserList(Search search) throws Exception{
		
		System.out.println("UserServiceImpl :: getUserList 시작");
		
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);		
		System.out.println("totalCount : "+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount); // 총 유저 수
		
		System.out.println("완료");
	
		return map;
	}

}