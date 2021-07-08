package com.moopi.mvc.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.domain.User;
import com.moopi.mvc.mapper.UserMapper;

@Service
public class UserServiceImpl {

	@Autowired
	private UserMapper userMapper;
	
	public User getUser(String userId) {
		
		return userMapper.getUser(userId);
	}

}
