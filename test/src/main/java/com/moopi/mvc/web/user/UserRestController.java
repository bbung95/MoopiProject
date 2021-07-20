package com.moopi.mvc.web.user;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

import net.nurigo.java_sdk.api.GroupMessage;
import net.nurigo.java_sdk.api.Image;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.api.SenderID;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserServiceImpl userService;
	
	public static final String saveDir = 	ClassLoader.getSystemResource("./static/").getPath().
											substring(0, ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
											+"src/main/resources/static/images/uploadFiles";
	public UserRestController(){
		System.out.println(this.getClass());
	}
// 모바일 본인인증 구현 [본인번호 입력해서 테스트NO] -----------------------------------------------------------------------------------------------	
	
	// Cool SMS API_key 및 API_secret Number
	String api_key = "NCSFQV50UBMEXKK1";
	String api_secret = "HCNQNW9BUTL7MLYFDSHQWXVMZJUFXMKI";
	
	Message message = new Message(api_key, api_secret);
	SenderID senderID;
	JSONObject result;
	JSONArray result_array;
	
	HashMap<String, String> params = new HashMap<String, String>();
			
	@RequestMapping( value="json/sms/{phone}", method=RequestMethod.GET )
	public HashMap MessageTest (@PathVariable String phone) {
		
		System.out.println("MassageTest 시작");
		
		// 발송시간 시작
		//long start = System.currentTimeMillis();
	
		try {
	    	String[] array = new String[6];
			String key = new String();
			Random rd = new Random(); //랜덤 객체 생성
			
			for(int i=0; i<array.length; i++) {
	            array[i] = Integer.toString(rd.nextInt(10));
	            key += array[i];
	        }
	    
		// 문자보내기(테스트시 발신, 수신 둘다 내 번호로 하기)
		params.put("to", phone); // 수신번호
		params.put("from", "01049670511"); // 발신번호
		params.put("type", "SMS");
		params.put("text", "[Moopi 본인확인] 본인인증 확인번호 ["+key+"]를 입력하세요"); // 문자전송
		params.put("mode", "test");
		params.put("key", key);
		System.out.println("이거확인해봐 : "+key);	// 인증번호 6자리 숫자가 key가 됨
		result = message.send(params);
		System.out.println((result.get("group_id")));;
		
		// 발송시간 끝
		//long end = System.currentTimeMillis();
		
	      // balance
	      // result = message.balance();
	      // System.out.println((result.get("cash")));
	      
	      // sent
	      //params.clear();
	      try {
	        result = message.sent(params);
	        System.out.println(result.get("data"));
	      } catch (Exception e) {
	        result = (JSONObject) JSONValue.parse(e.getMessage());
	        System.out.println(result.get("code"));
	        System.out.println("NoSuchMessage");
	      }

	      // status
	      //result = message.getStatus(params);
	      System.out.println(result.get("data"));

	      // cancel
	      params.put("mid", "MIDTEST");
	      //result = message.cancel(params);
	      //assertTrue(!result.isEmpty());
	    } catch (Exception e) {
	      //fail(e.toString());
	    }
	    System.out.println(result);
	    System.out.println(params);
	    return params;
	  }
	
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
/*
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
*/		
		// 네이버 회원가입 [400Error발생]
		/* 
		 * naver 로 로그인시 개인에게 고유발급되는 아이디를 UserId에 담을 예정
		 * console과 alert창에서는 토큰과 회원의 고유 아이디가 출력되지만, URL에서도 출력이안되어 담기어려움
		 * 이 부분과 관련하여 의논필요함
		 */
		@RequestMapping("naverlogin")
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

// [프로필 업데이트]-----------------------------------------------------------------------------------------------	
		
		// ## 미구현 0. [프로필이미지수정] - updateNickname	
		@RequestMapping(value = "json/uploadProfileImage")
		public String uploadProfileImage(@RequestParam("profileImage") MultipartFile uploadFile) {

			System.out.println("RestController - 프로필이미지수정");
			long currentTime = System.currentTimeMillis();
			String fileName = currentTime + uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File(saveDir + "/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return fileName;
		}
		
		// 2. [프로필소개수정] - updateContent
		@RequestMapping(value = "json/updateContent/{userId}")
		public void updateContent(@PathVariable String userId, @PathVariable String profileContent) {
			System.out.println("프로필소개수정");		
			User user = new User();
			user.setUserId(userId);
			user.setProfileContent(profileContent);
			
			userService.updateContent(user);				
		}
		
}

