//package com.moopi.mvc.service.user.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Service;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.domain.User;
//import com.moopi.mvc.service.user.UserMapper;
//
//@Service
//public class UserServiceImpl{
//
////	@Autowired
//	private UserMapper userMapper;
//
//	public void addUser(User user) {
//		return userMapper.addUser(user);
//	}
//	
//	public User getUser(String userId) {
//		return userMapper.getUser(userId);
//	}
//	
//	public Map<String, Object> getUserlist(Search search) {
//		return userMapper.getUserList(search);
//	}
//	 
//	public void updateUser(User user) {
//		return userMapper.updateUser(user);
//	}
//	
////	// 회원 수정
////	public void updateUser(User user) throws Exception{
////		userDao.updateUser(user);
////	}
//	
////	// 회원 가입
////	public void addUser(User user) throws Exception {
////		userDao.addUser(user);
////	}
////	
////	// 회원 조회
////	public User getUser(String userId) throws Exception {
////		return userDao.getUser(userId);
////	}
////	
////	// 회원 목록조회
////	public Map<String, Object> getUserList(Search search) throws Exception {
////		
////		List<User> list = userDao.getUserList(search);
////		int totalCount = userDao.getTotalCount(search);
////		
////		Map<String, Object> map = new HashMap<String, Object>();
////		map.put("list", list);
////		map.put("totalCount", new Integer(totalCount));
////		
////		return map;
////	}
////	
////	// 회원 수정
////	public void updateUser(User user) throws Exception{
////		userDao.updateUser(user);
////	}
//
//}
