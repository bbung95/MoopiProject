package com.moopi.mvc.web.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.domain.User;
import com.moopi.mvc.service.user.UserServiceImpl;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("getUser")
	public String getUser(@RequestParam("userId") String userId, Model model) {
		
//		System.out.println("getUser :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		User user = userService.getUser(userId);
		System.out.println(user);
		
		model.addAttribute("user", userService.getUser(userId));
		return "test";
	}
}
