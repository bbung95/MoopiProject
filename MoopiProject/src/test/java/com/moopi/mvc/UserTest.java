package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
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
	
	//@Test
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
		
		System.out.println("1. updateUser 시작");
		
		User user = userService.getUser("ouneno");
		
		user.setPhone("01086238243");
		user.setPassword("8243");
		
		userService.updateUser(user);
		System.out.println("여기확인 : "+user);
		
		Assertions.assertEquals("01086238243", user.getPhone());
		Assertions.assertEquals("8243", user.getPassword());
		
	}
	@Test
	public void getUserList() throws Exception{
		
		System.out.println("UserTest :: getUserList 테스트 시작");
		
		Search search = new Search();
		search.setSearchCondition(1);
		search.setSearchKeyword("2");
		
		Map map = userService.getUserList(search);
		
		//System.out.println("유저 리스트 출력 : "+map.get("list"));
		//System.out.println("유저 수 출력 : "+map.get("totalCount"));
		
	}

}
