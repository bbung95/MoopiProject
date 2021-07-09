package com.moopi.mvc.service.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.User;

//@Mapper
public interface UserDao {
	
	// 회원가입
	public void addUser(@Param("user") User user);
	
	// 내정보확인 / 로그인
	public User getUser(@Param("userId") String userId);
	
	// 회원정보리스트
	public List<User> getUserList(@Param("search") Map map);
	
	// 회원정보수정
	public void updateUser(@Param("user") User user);
	
}