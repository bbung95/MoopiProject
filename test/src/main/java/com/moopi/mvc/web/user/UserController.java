package com.moopi.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		User dbUser = userService.loginUser(user.getUserId());
		System.out.println("이건 왜 안될까 : "+dbUser);

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
	public String addUserInfo(@ModelAttribute("user") User user, Model model,
							  @RequestParam("password") String password) throws Exception {
		
		System.out.println("\n"+"UserController_____addUserInfo 시작"+"\n");
		System.out.println("아이디를 담아 추가입력 페이지로 이동하는 네비게이션 역할을 하는 부분입니다.");
		
		
		System.out.println("여기는 비밀번호 : "+password);
		model.addAttribute(user);
		return "user/addUserInfo";
	}
//-----------------------------------------------------------------------------------------------------------------

	
//-- [완료] ------------------------------------------------------------
	@RequestMapping("addUser")
	public String addUser (@ModelAttribute("user") User user,
						   @RequestParam("password") String password) throws Exception {
		
		System.out.println("\n"+"UserController_____addUser 시작"+"\n");
		System.out.println("추가정보를 입력받아 회원가입을 마무리 짓는 부분입니다.");
		System.out.println("여기는 password2 :"+password);
		
		userService.addUser(user);
		//System.out.println("addUser : "+addUser);
		//System.out.println("user : "+user);
		
		return "redirect:/";
	}
//-----------------------------------------------------------------------------------------------------------------

	
//-- addUserInfo.jsp에서 getMobileAuth.jsp로 이동하는 단순네비게이션 ------------------------------------------------------------
	@RequestMapping("getMobileAuth")
	public String getMobileAuth() throws Exception {
		
		System.out.println("UserController_____getMobileAuth 시작");
		System.out.println("모바일번호 인증페이지로 이동하기 위한 단순 네비게이션 부분입니다.");
				
		return "user/getMobileAuth";	
	}
//-----------------------------------------------------------------------------------------------------------------

}