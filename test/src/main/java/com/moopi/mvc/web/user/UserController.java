package com.moopi.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String loginView(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("\n"+"UserController_____loginView 로그인페이지를 띄워주는 단순 네비게이션"+"\n");
		
		return "user/loginView";
	}
//-----------------------------------------------------------------------------------------------------------------

	
//-- 로그아웃 구현 -------------------------------------------------------------------------------------------
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
			
		System.out.println("\n"+"UserController_____logout 로그아웃페이지를 띄워주는 단순 네비게이션"+"\n");
		session.invalidate();
			
		return "redirect:/";
	}
//-----------------------------------------------------------------------------------------------------------------
	
//-- [완료] 로그인 진행 후 메인페이지 이동 : 로그인 세션 유지 -------------------------------------------------------------------------------------------
	@RequestMapping("loginUser")
	public String loginUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("\n"+"UserController_____loginUser 리퀘스트매핑");
		System.out.println("loginUser의 user를 확인해보자 : \n"+user+"\n");
			
		//User dbUser = userService.getUser(user.getUserId());
		User dbUser = userService.loginUser(user.getUserId());

		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}
	
		System.out.println("여기는 로그인을 할 수 있으며, 세션을 담아주는 페이지입니다.\n"+user+"\n");
		
		return "redirect:/";
	}
//-----------------------------------------------------------------------------------------------------------------

//-- [완료] 회원가입 addUserView.jsp로 단순 네비게이션  -------------------------------------------------------------------------------------------
	@RequestMapping("addUserView")
	public String addUserView() throws Exception {
			
		System.out.println("UserController_____addUserView 시작");
		System.out.println("단순하게 회원가입 페이지로 이동하는 네비게이션 역할을 하는 부분입니다.");
			
		return "user/addUserView";
	}
//-----------------------------------------------------------------------------------------------------------------

//-- [완료] addUserView.jsp에서 addUser.jsp로 아이디와 비밀번호(hidden) 담아 네비게이션 ------------------------------------------------------------
	@RequestMapping("addUserInfo")
	public String addUserInfo(@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("\n"+"UserController_____addUserInfo 시작"+"\n");
		System.out.println("아이디를 담아 추가입력 페이지로 이동하는 네비게이션 역할을 하는 부분입니다.");
		
		return "user/addUserInfo";
	}
//-----------------------------------------------------------------------------------------------------------------
	
	@RequestMapping("addUser")
	public String addUser (@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("\n"+"UserController_____addUser 시작"+"\n");
		System.out.println("추가정보를 입력받아 회원가입을 마무리 짓는 부분입니다.");
		
		User addUser = userService.addUser(user);
		
		return "user/addUser";
	}
	
//-- [완료] 로그인 / 세션유지 -------------------------------------------------------------------------------------------
//	@RequestMapping("login")
//	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
//		
//		User dbUser = userService.getUser(user.getUserId());
//		
//		// 로그인 한 유저의 정보가 없거나, 패스워드가 일치하지 않을 경우
//		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())) {
//			session.setAttribute("user", dbUser);
//		}
//		
//		userService.addUser(user);
//		System.out.println("이거확인###### : "+user);
//		
//		return "redirect:/";
//	}
//-----------------------------------------------------------------------------------------------------------------
 

//-- [완료] 회원가입 addUser.jsp로 단순 네비게이션 -------------------------------------------------------------------------------------------
//	@RequestMapping("addUserInfo")
//	public String main() throws Exception {
//		//System.out.println("addUser 시작");
//		return "user/addUserInfo";
//	}
//-----------------------------------------------------------------------------------------------------------------
	 	
////-- [완료] 회원추가입력 addUserInfo.jsp로 단순 네비게이션 -------------------------------------------------------------------------------------------
//	// addUser.jsp -> '가입'버튼 -> addUserInfo.jsp / 회원가입 추가페이지
//	// 입력값(userId, Password)을 user에 담은 상태로 addUserInfo 로 넘김
//	
//	@RequestMapping("addUser")
//	public String addUser (@ModelAttribute("user") User user) throws Exception {
//		
//		System.out.println("UserController_____addUser 시작");
//		System.out.println("addUser 끝");
//		
//		return "user/addUser";
//	}
//-----------------------------------------------------------------------------------------------------------------
	
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
