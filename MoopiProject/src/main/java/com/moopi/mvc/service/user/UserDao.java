package com.moopi.mvc.service.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;

@Mapper
public interface UserDao {
	
	// 회원가입 : 회원가입시 UserRole - 2.정상회원
	public void addUser(User user) throws Exception;
	
	// 내정보확인
	public User getUser(@Param("userId") String userId);
	
	// 로그인 
	public User login(User user) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;
	
	// 관리자용 - 회원리스트
	public List<User> getUserList(Search search);
	
	// 회원탈퇴 : 회원탈퇴시 UserRole - 5.탈퇴회원
	public void updateLeaveUser(User user) throws Exception;
	
	// 회원용 - 팔로우리스트 / 팔로워, 팔로잉 수 
	public List<User> getFollowList(Search search);
	
	// 팔로우추가
	public void addFollow(@Param("userId") String userId) throws Exception;
	
	// 팔로우삭제
	public void deleteFollow(@Param("userId") String userId) throws Exception;
	
	// 패스워드수정
	public void updatePwd(User user) throws Exception;
	
	//getAtnCount()
	
	// 검색관련 - 유저리스트 조회시 회원 수
	public int getTotalCount(Search search) throws Exception;

	// 유저아이디찾기 
	public User getUserId(@Param("userId") String userId);

	// 유저비밀번호변경
	public void updateUserPwd(User user) throws Exception;
	
	// 유저프로필수정 
	public void updateProfile(User user) throws Exception;
	
	
}