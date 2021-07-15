package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.UserDao;
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
//		user.setUserId("user07");
//		user.setPassword("1234");
//		user.setUserName("회원07");
//		user.setGender("Female");
//		user.setNickname("이");
//		user.setBirth("19891201");
//		///user.setBirth1(1995);
//		//user.setBirth2(03);
//		//user.setBirth3(01);
//		user.setAge(34);
//		user.setPhone("01029373826");
//		user.setFullAddr("서울시 가좌");
//		user.setAddr("가좌");
//		user.setJoinPath("1");
//		user.setRegDate(null);
//		user.setUserRole("2");
//	
//		userService.addUser(user);
//		System.out.println(user);
//		
//		System.out.println("addUser Test End");		
//	}
	
	// 로그인 *
//	@Test
//	public void login() throws Exception{
//		
//		System.out.println("1. UserTest.java_____login TEST START");
//		
//		User user = new User();
//		
//		// 아이디 및 비밀번호 일치할 경우 
//		user.setUserId("ouneno");
//		user.setPassword("01049670511");
//		
//		// 아이디 및 비밀번호가 일치하지 않을 경우
//		user.setUserId("ouneno");
//		user.setPassword("1234");
//		
//		System.out.println(userService.getUser("ouneno"));
//		
//		userService.login(user);
//		userService.getUser("ouneno");
//		System.out.println("여기까지왔음");
//
//	}
	
	// 관리자권한 - 회원상세보기
//	@Test
//	public void getUser() throws Exception{
//	      
//		System.out.println("getUser Test Start");
//			
//		User user = userService.getUser("user0511");
//		System.out.println(user);
//		
//		System.out.println("getUser Test End");
//   }
	
	// 계정정보수정
//	@Test
//	public void updateUser() throws Exception{
//		
//		System.out.println("updateUser TEST START");
//		
//		User user = userService.getUser("ouneno");	
//		user.setPhone("01049670511");
//		user.setPassword("example1234");
//		
//		userService.updateUser(user);
//		System.out.println(user);
//		
//		System.out.println("updateUser TEST END");
//	}
	
	// 회원 탈퇴
//	@Test
//	public void updateLeaveUser() throws Exception {
//		
//		System.out.println("updateLeaveUser TEST START");
//		
//		User user = userService.getUser("user0511");
//		user.setUserRole("5");
//		
//		userService.updateLeaveUser(user);
//		System.out.println(user);
//	}
	
	// 관리자권한 - 회원목록조회
//	@Test
//	public void getUserList() throws Exception{
//		
//		System.out.println("UserTest :: getUserList 테스트 시작");
//		
//		Search search = new Search();
//		search.setSearchCondition(2);
//		//search.setSearchCondition(2);
//		//search.setSearchKeyword("2");
//		
//		Map map = userService.getUserList(search);
//		System.out.println("유저 리스트 출력 : "+map.get("list"));
//		System.out.println("유저 수 출력 : "+map.get("totalCount"));
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
