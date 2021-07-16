package com.moopi.mvc.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moopi.mvc.service.domain.User;
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
		
		@RequestMapping("kakaoLogin")
		public String kakaoLogin (@PathVariable("email") String userId) throws Exception {
		//(@RequestParam("userId") User user, ModelMap model) throws Exception {
			//(@RequestParam(required = false) String userId, Model model) throws Exception {
			// false로 인하여 타입무시 하지만 못받아옴
			//(@RequestParam(required = false) String userId, Model model) throws Exception {
			// 기존 : (@RequestParam("email") String userId) throws Exception {
			
			System.out.println(userId);
			
			System.out.println("\n"+"UserRestController_____kakaoLogin 시작"+"\n");
			System.out.println("카카오 이메일형식을 입력받아 추가입력 페이지로 보내는 역할을 합니다.");
			
			//User user = new User();
			//user.setUserId(userId);
			//model.addAttribute("user",userService.addUser(user);
			//model.addAttribute("user", user);
	
			System.out.println("아이디 받았는지 확인 : "+userId);
			
			return "user/addUserInfo";
		}

}
