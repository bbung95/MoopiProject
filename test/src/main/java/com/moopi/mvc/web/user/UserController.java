package com.moopi.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserServiceImpl userService;
	
//-- [완료] 로그인페이지 (단순 네비게이션) -------------------------------------------------------------------------------------------
	@RequestMapping("loginView")
	public String loginView(@ModelAttribute("user") User user) throws Exception{
		return "user/loginView";
	}
//-----------------------------------------------------------------------------------------------------------------

	
//-- [완료] 로그인 / 세션유지 -------------------------------------------------------------------------------------------
	@RequestMapping("login")
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		
		User dbUser = userService.getUser(user.getUserId());
		
		// 로그인 한 유저의 정보가 없거나, 패스워드가 일치하지 않을 경우
		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/";
	}
//-----------------------------------------------------------------------------------------------------------------

	// 회원가입 단순 네비게이션
	@RequestMapping("addUser")
	public String main() throws Exception {
		System.out.println("addUser 시작");
		return "user/addUser";
	}
	
	// 회원가입 추가페이지
	@RequestMapping("addUserInfo")
	public String addUserInfo (@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("UserController_____addUserInfo 시작");
		//userService.addUser(user);
		System.out.println("addUserInfo 끝");
		
		return "user/addUserInfo";
	}
	

	

	
}	


//	// 로그아웃
//	@RequestMapping(value = "logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) throws Exception {
//		session.invalidate();
//
//		return "redirect:/main.jsp";
//	}
//
//
//
//	// 회원가입 이후 추가 정보입력
//	@RequestMapping(value = "addUserInfo", method = RequestMethod.POST)
//	public String addUserInfo() throws Exception {
//		return "redirect:/main.jsp";
//	}
//
////	public void addUser(User user) throws Exception;
////	
////	public User getUser(String userId) throws Exception;
////	
////	public List<User> getUserList(Search search) throws Exception;
////	
////	public void updateUser(User user) throws Exception;
////	
////	public int getTotalCount(Search search) throws Exception;
//
//}
