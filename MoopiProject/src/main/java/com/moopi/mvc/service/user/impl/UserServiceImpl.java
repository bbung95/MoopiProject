package com.moopi.mvc.service.user.impl;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {
	
	public UserServiceImpl() {
		
	}

}
	
//	// 회원 수정
//	public void updateUser(User user) throws Exception{
//		userDao.updateUser(user);
//	}
	
//	// 회원 가입
//	public void addUser(User user) throws Exception {
//		userDao.addUser(user);
//	}
//	
//	// 회원 조회
//	public User getUser(String userId) throws Exception {
//		return userDao.getUser(userId);
//	}
//	
//	// 회원 목록조회
//	public Map<String, Object> getUserList(Search search) throws Exception {
//		
//		List<User> list = userDao.getUserList(search);
//		int totalCount = userDao.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
//	
//	// 회원 수정
//	public void updateUser(User user) throws Exception{
//		userDao.updateUser(user);
//	}