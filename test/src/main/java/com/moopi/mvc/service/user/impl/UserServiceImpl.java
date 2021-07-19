package com.moopi.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.UserDao;

@Service
public class UserServiceImpl {
	
	@Autowired
	private SqlSessionTemplate userSqlSession;
	@Autowired
	private UserDao userDao;
	
	// [완료] 로그인
	public User loginUser(String userId) {

		System.out.println("UserServiceImpl_____loginUser : "+userId);
		System.out.println("여기 진입완료");
		
		return userDao.loginUser(userId);
	}
	
	// [완료] 회원가입
	public void addUser(User user) throws Exception {
		System.out.println("\naddUSer쪽으로 진입했습니다");
		System.out.println("user를 확인해볼까요 : "+user+"\n");
		
		userDao.addUser(user);
	}
	
	// 유저정보조회 
	public User getUser(String userId) {
		return userDao.getUser(userId);		
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
	
	// [중간완료] 아이디 중복체크 관련 Ajax - RestController에서 받아옴 
	public int userIdCheck(String user_id) {
		userDao = userSqlSession.getMapper(UserDao.class);
		return userDao.userIdCheck(user_id);
	}
	
	// 닉네임 중복체크 관련 Ajax - RestController에서 받아옴 
	public int nicknameCheck(String nickname) {
		userDao = userSqlSession.getMapper(UserDao.class);
		return userDao.nicknameCheck(nickname);
	}
	
// 형우 Flash 관련 추가
	
	//make flash coin count 플래쉬 생성시 코인차감
	public void makeFlashCoin(User user) throws Exception{
		userDao.makeFlashCoin(user);
	}
	
	public void joinFlashCoin(User user) throws Exception{
		userDao.joinFlashCoin(user);
	}
	
	//결제후 유저 코인 Up
	public void paymentUpdateCoin(User user) throws Exception{
		userDao.paymentUpdateCoin(user);
	}
	
}