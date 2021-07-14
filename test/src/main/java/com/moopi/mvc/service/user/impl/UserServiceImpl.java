package com.moopi.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	
	// 유저정보조회 
	public User getUser(String userId) {
		return userDao.getUser(userId);		
	}
	
	// 회원가입 
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}
	
	// 로그인
	public void login(User user) throws Exception {
		userDao.login(user);
	}
	
	// 유저아이디찾기 
	public User getUserId(String userId) {
		return userDao.getUserId(userId);
	}
	
	// 유저정보변경 
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	// 관리자권한 - 유저리스트조회 
	public Map<String, Object> getUserList(Search search, int searchState) throws Exception{
		
		System.out.println("UserServiceImpl :: getUserList 시작");
		
		List<User> list = userDao.getUserList(search, searchState);
		int totalCount = userDao.getTotalCount(search);		
		System.out.println("totalCount : "+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount); // 총 유저 수
		
		System.out.println("완료");
	
		return map;
	}
	
	// 회원탈퇴 
	public void updateLeaveUser(User user) throws Exception {
		userDao.updateLeaveUser(user);
	}
	
	// 유저비밀번호변경
	public void updateUserPwd(User user) throws Exception{
		userDao.updateUserPwd(user);
	}
	
	// 유저프로필수정 
	public void updateProfile(User user) throws Exception{
		userDao.updateProfile(user);
	}

}