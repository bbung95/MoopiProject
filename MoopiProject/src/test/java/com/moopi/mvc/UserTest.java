package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@SpringBootTest
public class UserTest {
	
	@Autowired
	private UserServiceImpl userService;
	
	//@Test
	public void addUser() throws Exception{
		System.out.println("addUser Test Start");
		
		User user = new User();
		user.setUserId("dbfdk2531");
		user.setPassword("1234");
		user.setUserName("박율아");
		user.setPhone("01049670511");
		user.setAge(29);
		user.setGender("female");
		user.setJoinPath("naver");
		user.setNickname("유르앙");
		
		System.out.println(user);
		
		Assertions.assertEquals("dbfdk2531", user.getUserId());
		Assertions.assertEquals("1234", user.getUserId());
		Assertions.assertEquals("박율아", user.getUserId());
		Assertions.assertEquals("01049670511", user.getUserId());
		Assertions.assertEquals(29, user.getUserId());
		Assertions.assertEquals("female", user.getUserId());
		Assertions.assertEquals("naver", user.getUserId());
		Assertions.assertEquals("유르앙", user.getUserId());
		
		System.out.println("addUser Test End");
		
	}
	
	@Test
	public void getUser() throws Exception{
	      
		System.out.println("1. UserTest.java_____getUser Test Start");
		System.out.println(userService.getUser("ouneno"));
		
		User user = userService.getUser("ouneno");
		System.out.println("getUser Test Start3");
		System.out.println(user);
		
		System.out.println("getUser Test End");
   }
	
	//@Test
	public void updateUser() throws Exception{
		
		System.out.println("updateUser 시작");
		System.out.println("수정 전 User : "+userService.getUser("ouneno"));
		
		User user = userService.getUser("ouneno");
		user.setUserName("박율아");
		System.out.println(user);
		
		Assertions.assertEquals("박율아", user.getUserName());
		
	}
//	@Test
//	public void updateMoim() throws Exception{
//		
//		System.out.println("Test updateMoim :::");
//		System.out.println("수정전 모임 : "+moimService.getMoim(1));
//		Moim moim = moimService.getMoim(1);
//		moim.setMmAddr("중랑구");
//		moim.setMmMaxAge(96);
//		moimService.updateMoim(moim);
//		System.out.println(moim);
//		Assertions.assertEquals("중랑구", moim.getMmAddr());
//		Assertions.assertEquals(96, moim.getMmMaxAge());
//	}

}
