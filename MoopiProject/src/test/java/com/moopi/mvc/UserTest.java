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
	
	// 회원가입 
//	@Test
//	public void addUser() throws Exception{
//		System.out.println("addUser Test Start");
//		
//		User user = new User();
//		user.setUserId("dbfdk2531");
//		user.setPassword("1234");
//		user.setUserName("박율아");
//		user.setPhone("01049670511");
//		user.setAge(29);
//		user.setGender("female");
//		user.setJoinPath("naver");
//		user.setNickname("유르앙");
//		
//		System.out.println(user);
//		
//		Assertions.assertEquals("dbfdk2531", user.getUserId());
//		Assertions.assertEquals("1234", user.getUserId());
//		Assertions.assertEquals("박율아", user.getUserId());
//		Assertions.assertEquals("01049670511", user.getUserId());
//		Assertions.assertEquals(29, user.getUserId());
//		Assertions.assertEquals("female", user.getUserId());
//		Assertions.assertEquals("naver", user.getUserId());
//		Assertions.assertEquals("유르앙", user.getUserId());
//		
//		System.out.println("addUser Test End");
//		
//	}
	
	// getUser
//	@Test
//	public void getUser() throws Exception{
//	      
//		System.out.println("1. UserTest.java_____getUser Test Start");
//		System.out.println(userService.getUser("ouneno"));
//		
//		User user = userService.getUser("ouneno");
//		System.out.println("getUser Test Start3");
//		System.out.println(user);
//		
//		System.out.println("getUser Test End");
//   }
	
//	@Test
//	public void updateUser() throws Exception{
//		
//		System.out.println("1. updateUser 시작");
//		
//		User user = userService.getUser("ouneno");
//		
//		user.setPhone("01086238243");
//		user.setPassword("8243");
//		
//		userService.updateUser(user);
//		System.out.println("여기확인 : "+user);
//		
//		Assertions.assertEquals("01086238243", user.getPhone());
//		Assertions.assertEquals("8243", user.getPassword());
//		
//	}
	
//	@Test
//	public void getUserList() throws Exception{
//		
//		System.out.println("UserTest :: getUserList 테스트 시작");
//		
//		Search search = new Search();
//		search.setSearchCondition(1);
//		search.setSearchKeyword("2");
//		
//		Map map = userService.getUserList(search);
//		
//		//System.out.println("유저 리스트 출력 : "+map.get("list"));
//		//System.out.println("유저 수 출력 : "+map.get("totalCount"));
//	}
	
//	@Test
//	public void updateLeaveUser() throws Exception {
//		
//		System.out.println("1. UserTest.java_____updateLeaveUser Test Start");
//		
//		User user = userService.getUser("ouneno");
//		
//		user.setUserRole("3");
//		
//		userService.updateLeaveUser(user);
//		System.out.println("여기까지 확인" +user);
//		
//		Assertions.assertEquals("3", user.getUserRole());
//		System.out.println(userService.getUser("ouneno"));
//	}

//	@Test
//	public void getUserId() throws Exception{
//	      
//		System.out.println("1. UserTest.java_____getUserId Test Start");
//		System.out.println(userService.getUser("ouneno"));
//		
//		User user = userService.getUser("ouneno");
//		System.out.println(user.getUserId());
//		
//		System.out.println("getUserId Test End");
//   }
	
//	@Test
//	public void updateUserPwd() throws Exception{
//		
//		System.out.println("1. UserTest.java_____updateUserPwd Test Start");
//		
//		User user = userService.getUser("ouneno");
//		
//		user.setPassword("01049670511");
//		
//		userService.updateUserPwd(user);
//		System.out.println("여기까지 확인");
//		
//		Assertions.assertEquals("01049670511", user.getPassword());
//		System.out.println(userService.getUser("ouneno"));
//		
//	}
	
//	@Test
//	public void updateProfile() throws Exception{
//		
//		System.out.println("1. UserTest.java_____updateProfile Test Start");
//		
//		User user = userService.getUser("ouneno");
//		
//		user.setNickname("빅마마");
//		user.setAddr("강북구");
//		user.setProfileImage("파일경로지정예정");
//		//user.setInterestFirst(null);
//		//user.setInterestSecond(null);
//		//user.setInterestThird(null);
//		user.setProfileContent("이별은 왜 계속 흔적만 남길까");
//		
//		userService.updateProfile(user);
//		System.out.println("잘들어왔나 확인해보자");
//		
//		System.out.println(userService.getUser("ouneno"));
//		
//	}

}
