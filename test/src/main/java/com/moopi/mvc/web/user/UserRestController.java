package com.moopi.mvc.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserServiceImpl userService;
	
	// [중간완료] 아이디 중복체크진행
		@RequestMapping("idCheck")
		@ResponseBody
		public int userIdCheck(@RequestParam("userId") String userid) {
			//System.out.println("UserRestController____id 중복확인 컨트롤러실행");
			return userService.userIdCheck(userid);
		}
	
	// 닉네임 중복체크진행
		@RequestMapping("nicknameCheck")
		@ResponseBody
		public int nicknameCheck(@RequestParam("nickname") String nickname) {
			System.out.println("UserRestController____닉네임 중복확인 컨트롤러실행");
			return userService.nicknameCheck(nickname);
		}	

}
