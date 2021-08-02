package com.moopi.mvc.web.user;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimService;
import com.moopi.mvc.service.user.impl.UserService;

@Controller 
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MoimService moimService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("getMyHomeBoard")
	public String getMyHomeBoard () {
		System.out.println("확인");
		
		return "user/getMyHomeBoard";
	}
		
	// 카카오 로그인 및 회원가입
	@RequestMapping("kakaoLogin")
	public String kakaoLogin (	@ModelAttribute("user") User user,
								HttpSession session) throws Exception {	
		System.out.println("\n"+"UserRestController_____kakaoLogin 시작");				
		User dbUser = userService.getUser(user.getUserId());		
		// db에 유저값 존재시 addUserInfo로 이동, db에 유저값이 없을 경우 메인페이지 출력		
		if( dbUser != null ) {
			session.setAttribute("dbUser", dbUser);
			return "redirect:/";
		} else {
			user.setJoinPath("4"); // 가입경로 [4.카카오] 지정 후 추가입력페이지 전달
			return "user/addUserInfo";
		}
	}	
	
	// [완료] 로그인페이지 (단순 네비게이션)
	@RequestMapping("loginView")
	public String loginView() throws Exception{
		return "user/loginView";
	}

	// [완료] 로그인 
	@RequestMapping("loginUser")
	public String login(	@ModelAttribute("user") User user, 
							@RequestParam("userId") String userId,
							HttpSession session, 
							Model model) throws Exception{
		User dbUser = userService.loginUser(user.getUserId());	
		String dbId = user.getUserId();
		String dbPw = user.getPassword();
		
		if (dbUser.getUserRole().equals("6")) {
			System.out.println("유저롤 6번으로 완전탈퇴 복구불가 회원입니다.");
			session.invalidate();		
			return "user/loginView";
		
		} else if (dbUser.getUserRole().equals("5")) {
			System.out.println("유저롤 5번으로 복구가능 회원입니다.");
			model.addAttribute("userId", userId);
			session.invalidate();
			return "user/loginView";
		
		} else {
			dbUser = userService.getUser(dbId);	
			if (dbId != null && dbPw.equals(dbUser.getPassword())) {
					System.out.println("아이디 및 비밀번호가 일치합니다.");
					session.setAttribute("dbUser", dbUser);
					return "redirect:/";
				} else {
					model.addAttribute("message", "이건뭐지");
					System.out.println("아이디 및 비밀번호가 일치하지 않습니다.");
					return "user/loginView";
				}

		}
		
		}
	// 탈퇴복구 네비게이션
	@RequestMapping("updateRestoreUser")
	public String updateRestoreUser( @RequestParam("userId") String userId,
									@RequestParam("profileImage") String profileImage,
									@RequestParam("nickname") String nickname,
									Model model) {		
		model.addAttribute("userId", userId);
		model.addAttribute("profileImage", profileImage);
		model.addAttribute("nickname", nickname);		
		System.out.println("탈퇴회원이 복구를요청할때 뜨는 페이지입니다.");
		return "user/updateRestoreUser";
	}
	
	// 블랙복구 네비게이션
	@RequestMapping("getBlackUser")
	public String getBlackUser( @RequestParam("userId") String userId,
								@RequestParam("profileImage") String profileImage,
								@RequestParam("nickname") String nickname,
								@RequestParam("stateReason") String stateReason,
								Model model) {		
		model.addAttribute("userId", userId);
		model.addAttribute("profileImage", profileImage);
		model.addAttribute("nickname", nickname);	
		model.addAttribute("stateReason", stateReason);
		System.out.println("");
		return "user/getBlackUser";
	}


//-- 로그아웃 구현 -------------------------------------------------------------------------------------------
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception {
		
		System.out.println("\n"+"UserController_____logout 로그아웃페이지를 띄워주는 단순 네비게이션"+"\n");
		
		// 가입경로 필요없을시 해당 문만 기재하면됨
		session.invalidate();
		System.out.println();
		return "redirect:/";		
	}	
	
//-- [완료] 회원가입 addUserView.jsp로 단순 네비게이션  -------------------------------------------------------------------------------------------
	@RequestMapping("addUserView")
	public String addUserView() throws Exception {			
		return "user/addUserView";
	}
//-----------------------------------------------------------------------------------------------------------------

//-- [완료] addUserView.jsp에서 addUser.jsp로 아이디와 비밀번호(hidden) 담아 네비게이션 ------------------------------------------------------------
	@RequestMapping("addUserInfo")
	public String addUserInfo(@ModelAttribute("user") User user, Model model,
							  @RequestParam("password") String password) throws Exception {
		
		System.out.println("\n"+"UserController_____addUserInfo 시작"+"\n");
		System.out.println("아이디를 담아 추가입력 페이지로 이동하는 네비게이션 역할을 하는 부분입니다.");
		
		model.addAttribute(user);
		return "user/addUserInfo";
	}
//-----------------------------------------------------------------------------------------------------------------

	
//-- [완료] ------------------------------------------------------------
	@RequestMapping("addUser")
	public String addUser (@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("\n"+"UserController_____addUser 시작"+"\n");
		System.out.println("추가정보를 입력받아 회원가입을 마무리 짓는 부분입니다.");

		// Age
		Calendar cal = Calendar.getInstance();	
		int year = cal.get(Calendar.YEAR);
		
		// user의 Birth 출력
		String birth = user.getBirth();
		
		// birth 중 생년만 parsing
		String str = birth;
		String[] num = str.split("-");
		String yy = num[0];
	
		int birthday = Integer.parseInt(yy);
		int age = year - birthday;
		user.setAge(age);
		
		user.setProfileImage("default-profileImg.png");
		
		userService.addUser(user);
		
		return "redirect:/";
	}
//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping("getMobileAuthPW")
	public String getMobileAuthPW(	Model model, 
									@RequestParam("userId") String userId) throws Exception {	
		User id = userService.getUser(userId);
		model.addAttribute("dbUser", id);		
		return "user/getMobileAuth";	
	}
	
	@RequestMapping("getMobileAuth")
	public String getMobileAuth() throws Exception {
		return "user/getMobileAuth";	
	}
	
	@RequestMapping("updatePwdViewError")
	public String updatePwdViewError() throws Exception {
		return "user/updatePwdViewError";
	}

	@RequestMapping("updatePwdViewMobile")
	public String updatePwdViewMobile( @RequestParam("userId") String userId) throws Exception {
		System.out.println("여기로 진입완료");
		return "user/updatePwdViewMobile";
	}
	
	// 아이디와 비번이 맞는지 확인
	@RequestMapping("getAuthValidity")
	public String getAuthValidity (	@RequestParam("userId") String userId,
									@RequestParam("phone") String phone, User user,
									Model model) throws Exception {		
		User Id = userService.getId(phone);
		if ( userId.equals(Id.getUserId())) {
			model.addAttribute("dbUser", Id);
			return "/user/updatePwdView";
		} else {
			model.addAttribute("user", user);
		return "redirect:/user/updatePwdViewError";
		}
	}		
	
//-- [리턴수정필요] 비밀번호찾기 - 아이디, 모바일번호인증 일치 여부 확인
	@RequestMapping("updatePwdView")
	public String updatePwdView(	@RequestParam("userId") String userId,								
									Model model) throws Exception {
		User id = userService.getUser(userId);
		model.addAttribute("dbUser", id);
		return "user/updatePwdView";
	}
	


//-- searchUserPwd.jsp로 이동하는 단순네비게이션 ------------------------------------------------------------
	@RequestMapping("searchUserPwd")
	public String searchUserPwd() {
			
		System.out.println("UserController_____searchUserPwd 시작");
		System.out.println("비밀번호를 변경을 위한 아이디확인으로 이동하는 단순 네비게이션입니다.");
						
		return "user/searchUserPwd";	
	}
//-----------------------------------------------------------------------------------------------------------------

//	//-- searchUserPwd.jsp로 이동하는 단순네비게이션 ------------------------------------------------------------
//		@RequestMapping("searchUserPwd")
//		public String searchUserPwd(	@RequestParam("userId") String userId,
//										Model model ) throws Exception {
//				
//			System.out.println("UserController_____updateUserPwd 시작");
//			System.out.println("비밀번호를 변경을 위한 아이디확인으로 이동하는 단순 네비게이션입니다.");
//			
//			User user = userService.getUser(userId);
//			model.addAttribute("dbUser", user);
//							
//			return "user/searchUserPwd";	
//		}
//	//-----------------------------------------------------------------------------------------------------------------
		
	
//-- getMyHomeBoard.jsp로 이동하는 단순네비게이션 ------------------------------------------------------------
//	@RequestMapping("getMyHomeBoard")
//	public String getMyHomeBoard() throws Exception {
//			
//		System.out.println("UserController_____searchUserPwd 시작");
//		System.out.println("비밀번호를 찾기위한 아이디확인으로 이동하는 단순 네비게이션입니다.");
//				
//		return "user/getMyHomeBoard";	
//	}
//-----------------------------------------------------------------------------------------------------------------

//-- getMyHomeBoard.jsp  ------------------------------------------------------------

	@RequestMapping("getMyHome")
	public String getUser(@RequestParam("userId") String userId, HttpSession session, Model model) throws Exception {
		
		System.out.println(userService.getUser(userId));
		
		System.out.println("\n"+"1 : UserController_____getMyHomeBoard 시작"+"\n");
		System.out.println("마이홈의 메인을 출력하는 페이지입니다. 여러 값들을 가져와야 하는 부분");		
		
		// ! 세션이 존재하기에 초기화됨
		//model.addAttribute("dbUser",userService.getUser(userId));
		
		// 코인, 팔로잉, 게시판, 모임에서 사용해야하니 CommonRestController 보고 작성해보
		
		System.out.println("여기도 확인해보자 : "+userId);
		System.out.println("겟마이홈보드에서 model.addAttribute(user)를 불러오면? : "+userId);
		// 로그인유저 확인해보기 loginUser
		System.out.println(userService.getUser(userId));
		
		
		/////// 추가부분
		User user = (User)session.getAttribute("dbUser");
		
		// 팔로우 유무체크
		boolean check = false;
		if(user != null) {
			if(userService.getFollow(user.getUserId(), userId) != null) {
				check = true;
			}
		}
		
		System.out.println("ddddddd"+moimService.getMyMoimList(userId).get("list"));
		
		model.addAttribute("user", userService.getUser(userId));
		model.addAttribute("moim", moimService.getMyMoimList(userId).get("list2"));
		model.addAttribute("folloingCount", userService.getFollowCount(userId, 1));
		model.addAttribute("followerCount", userService.getFollowCount(userId, 2));
		model.addAttribute("followCheck", check);
		///////
		return "user/getMyHome";
	}	
////-----------------------------------------------------------------------------------------------------------------

	
//-- [완료] 프로필수정 (단순 네비게이션) -------------------------------------------------------------------------------------------
	@RequestMapping("updateProfile")
	public String updateProfile(@RequestParam("userId") String userId,
								@ModelAttribute("user") User user,
								Model model) throws Exception{
				
		System.out.println("\n"+"UserController_____updateProfile 프로필수정 페이지"+"\n");
		
		model.addAttribute("dbUser",userService.getUser(userId));
		model.addAttribute("interest",commonService.getInterest());
		
		System.out.println(userService.getUser(userId));
		return "user/updateProfile";
		
	}
	
// [프로필 업데이트]-----------------------------------------------------------------------------------------------	
	

	 //1. [닉네임수정] - updateNickname
	@RequestMapping("updateNickname")
	public String updateNickname(	@RequestParam("userId") String userId,
									@RequestParam("nickname") String nickname,
									@ModelAttribute("user") User user) {
		System.out.println("닉네임수정");		
		userService.updateNickname(user);
		return "user/updateUser";				
	}
	
	// 2. [프로필소개수정] - updateContent
	@RequestMapping("updateContent")
	public String updateContent(	@RequestParam("userId") String userId,
									@RequestParam("profileContent") String profileContent,
									@ModelAttribute("user") User user) {
		System.out.println("프로필소개수정");		
		userService.updateContent(user);
		return "user/updateContent";				
	}
		
	// 3. [관심사수정] - updateInterest
	@RequestMapping("updateInterest")
	public String updateInterest(	@RequestParam("userId") String userId,
									@RequestParam("interestFirst") String interestFirst,
									@RequestParam("interestSecond") String interestSecond,
									@RequestParam("interestThird") String interestThird,
									@ModelAttribute("user") User user) {
		System.out.println("관심사수정");		
		userService.updateInterest(user);
		return "user/updateInterest";				
	}
	

	
	// 회원탈퇴
	@RequestMapping("updateLeaveUser")
	public String updateLeaveUser (	@RequestParam("userId") String userId,
									@RequestParam("userRole") String userRole,
									@RequestParam("stateReason") String stateReason,
									HttpSession session,
									Model model) throws Exception {		
		User user = new User();
		user.setUserId(userId);
		user.setStateReason(stateReason);		
		model.addAttribute("dbUser", userId);
		model.addAttribute("dbUser", stateReason);		
		userService.updateLeaveUser(user);	
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원블랙
		@RequestMapping("updateBlackUser")
		public String updateBlackUser (	@RequestParam("userId") String userId,
										@RequestParam("userRole") String userRole,
										@RequestParam("stateReason") String stateReason,
										HttpSession session,
										Model model) throws Exception {		
			User user = new User();
			user.setUserId(userId);
			user.setStateReason(stateReason);		
			model.addAttribute("dbUser", userId);
			model.addAttribute("dbUser", stateReason);		
			userService.updateBlackUser(user);
			session.invalidate();
			return "redirect:/";
		}
	

	

//-- [완료] 회원가입 addUserView.jsp로 단순 네비게이션  -------------------------------------------------------------------------------------------
	@RequestMapping("getIdView")
	public String getIdView() throws Exception {
		
		System.out.println("UserController_____getIdView 시작");
		System.out.println("아이디찾기 진행시 아이디를 띄워주는 뷰입니다.");
				
		return "user/getIdView";
	}
//-----------------------------------------------------------------------------------------------------------------
	
//-- 아이디찾기 -------------------------------------------------------------------------------------------
	@RequestMapping("searchIdView")
	public String searchIdView(	@RequestParam("phone") String phone,
								Model model,
								@ModelAttribute("user") User user) throws Exception{		
		
		model.addAttribute("dbUser", userService.getId(phone));			
		
		
		User dbUser = userService.getId(user.getPhone());		
		
		if (dbUser == null) {
			System.out.println("널임");
		} else if (dbUser != null) {
			System.out.println("널이아님");
		}		
		
		return "user/searchIdView";
		}
//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping("googleLogin")
	public String googleLogin (	@ModelAttribute("user") User user, 
								HttpSession session) throws Exception {			
		User googleId = userService.getUser(user.getUserId());	
		if( googleId != null ) {
			session.setAttribute("user", googleId);
			return "redirect:/";
		} else {
			user.setJoinPath("2");
			return "user/addUserInfo";
		}
	}	
	
//-- [완료] 회원가입 addUserView.jsp로 단순 네비게이션  -------------------------------------------------------------------------------------------
	@GetMapping("updateUserView")
	public String updateUserView() throws Exception {					
		return "redirect:/user/passwordConfirm";
	}
	
	@PostMapping("updateUserView")
	public String updateUserView(HttpSession session, Model model) throws Exception {			
		return "user/updateUserView";
	}
	
	@RequestMapping("passwordConfirm")
	public String passwordConfirm ( HttpSession session, Model model ) throws Exception {		
		User user = (User)session.getAttribute("dbUser");		
		if(user == null) {
			return "redirect:/";
		}						
		return "user/passwordConfirm";
	}	
	
	@RequestMapping(value="myInformation")
	public String myInformation() {
		
		System.out.println("myInformation 시작");
		return "user/myInformation";
	}
	
	@RequestMapping("findPwd")
	public String findPwd() {
		
		System.out.println("myInformation 시작");
		return "user/findPwd";
	}
	
	
	
}
