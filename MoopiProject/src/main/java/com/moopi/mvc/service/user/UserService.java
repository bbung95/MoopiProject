package com.moopi.mvc.service.user;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;

public interface UserService {
	
	// 회원 가입
	public void addUser(User user) throws Exception;
	
	// 회원 조회
	public User getUser(String userId) throws Exception;
	
	// 회원 리스트
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	// 회원 수정
	public void updateUser(User user) throws Exception;
 
}
