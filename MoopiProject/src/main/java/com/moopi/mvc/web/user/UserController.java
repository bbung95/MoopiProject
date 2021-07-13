package com.moopi.mvc.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserServiceImpl userService;
	
	// 회원가입
	@RequestMapping(value="addUser")
	public String addUser(@ModelAttribute("user") User user) throws Exception {
		userService.addUser(user);
		System.out.println("UserController 시작");
		
		return "forwrd:메인페이지로 이동";
	}
}
	
//	// 로그인
//	@RequestMapping(value = "login", method = RequestMethod.POST)
//	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
//		// 2021-07-08 12:37 : VO쪽 getter, setter Annotaion지정했으나, 끌고오지 못함 알아봐야함
//		User dbUser = userService.getUser(user.getUserId());
//		return "redirect:/index";
//	}

	// @Value("#{commonProperties['pageUnit']}")
	// int pageUnit;
	// @Value("#{commonProperties['pageSize']}")
	// int pageSize;



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
