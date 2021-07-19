package com.moopi.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

	// 카카오 로그인 및 회원가입
		@RequestMapping("kakaoLogin")
		public String kakaoLogin (	@ModelAttribute("user") User user, 
									HttpSession session) throws Exception {
			
			System.out.println("\n"+"UserRestController_____kakaoLogin 시작");
			System.out.println("카카오 이메일형식을 입력받아 추가입력 페이지로 보내는 역할을 합니다.");
			
			// 카카오 고유 아이디 받아올 시 ','가 출력되어 해당부분 split으로 제거하는 작업 거침
			String kId = user.getUserId();
			String spot = ",";
			
			String[] temp = kId.split(spot);	
			for(int i=0; i<temp.length; i++) {
			}
			
			String kakaoId = temp[1];
			user.setUserId(kakaoId);
			user.setJoinPath("4");
			
			System.out.println("가입경로 확인 : "+userService.getUser(user.getJoinPath()));
			
			User dbUser = userService.getUser(user.getUserId());

			// db에 유저값 존재시 추가정보입력, db에 유저값이 없을 경우 메인페이지 출력
			if( dbUser != null ) {
				session.setAttribute("user", dbUser);
				return "redirect:/";
			} else {
				return "user/addUserInfo";
			}
		}
		
		// 네이버 회원가입 [400Error발생]
		/* 
		 * naver 로 로그인시 개인에게 고유발급되는 아이디를 UserId에 담을 예정
		 * console과 alert창에서는 토큰과 회원의 고유 아이디가 출력되지만, URL에서도 출력이안되어 담기어려움
		 * 이 부분과 관련하여 의논필요함
		 */
		@RequestMapping("/user/naverlogin")
		public String naverlogin( 	@RequestParam("naverId") String userId,
									@ModelAttribute("user") User user,
									HttpSession session) throws Exception {
			
			System.out.println("\n"+"UserRestController_____naverlogin 시작");
			
			User dbUser = userService.getUser(user.getUserId());

			// db에 유저값 존재시 추가정보입력, db에 유저값이 없을 경우 메인페이지 출력
			if( dbUser != null ) {
				session.setAttribute("user", dbUser);
				return "redirect:/";
			} else {
				return "user/addUserInfo";
			}
		}
		
		// [완료]구글 로그인, 회원가입
		@RequestMapping("googleLogin")
		public String googleLogin (	@ModelAttribute("user") User user, 
									HttpSession session) throws Exception {			
			User googleId = userService.getUser(user.getUserId());	
			if( googleId != null ) {
				session.setAttribute("user", googleId);
				return "redirect:/";
			} else {
				return "user/addUserInfo";
			}
		}		
}

