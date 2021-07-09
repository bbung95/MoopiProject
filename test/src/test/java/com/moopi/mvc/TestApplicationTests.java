package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.domain.User;
import com.moopi.mvc.service.user.UserServiceImpl;

@SpringBootTest
class TestApplicationTests {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Test
	void contextLoads() {
	}
	
	@Test
	public void getUser() {
		
		System.out.println("Test getUser :::");
		System.out.println(userService.getUser("user04"));
		User user = userService.getUser("user04");
		System.out.println(user);
		
		Assertions.assertEquals("user04", user.getUserId());
		Assertions.assertEquals("박성", user.getUserName());
	}
	

}
