package com.moopi.mvc.web.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}

	// @Value("#{commonProperties['pageUnit']}")
	// int pageUnit;
	// @Value("#{commonProperties['pageSize']}")
	// int pageSize;

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		// 2021-07-08 12:37 : VO쪽 getter, setter Annotaion지정했으나, 끌고오지 못함 알아봐야함
		User dbUser = userService.getUser(user.getUserId());
		return "redirect:/index";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:/main.jsp";
	}

	// 회원가입
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser() throws Exception {

		// userService.addUser(user);

		return "redirect:/user/addUserInfo.jsp";
	}

	// 회원가입 이후 추가 정보입력
	@RequestMapping(value = "addUserInfo", method = RequestMethod.POST)
	public String addUserInfo() throws Exception {
		return "redirect:/main.jsp";
	}

//	public void addUser(User user) throws Exception;
//	
//	public User getUser(String userId) throws Exception;
//	
//	public List<User> getUserList(Search search) throws Exception;
//	
//	public void updateUser(User user) throws Exception;
//	
//	public int getTotalCount(Search search) throws Exception;

}
