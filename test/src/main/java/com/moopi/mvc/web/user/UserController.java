package com.moopi.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserServiceImpl userService;
	

	// [완료] 로그인페이지 (단순 네비게이션)
	@RequestMapping("loginView")
	public String loginView(@ModelAttribute("user") User user, HttpSession session) throws Exception{		
		return "user/loginView";
	}

	
//-- 로그아웃 구현 -------------------------------------------------------------------------------------------
	@RequestMapping("logout")
	public String logout(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		
		System.out.println("\n"+"UserController_____logout 로그아웃페이지를 띄워주는 단순 네비게이션"+"\n");
		
		// 가입경로 필요없을시 해당 문만 기재하면됨
		//session.invalidate();
			
		// [경로를 못가져옴] 가입경로에 따른 로그아웃 값을 주기위한 조건 
		if(user.getJoinPath() == "1") {
			System.out.println("유저의 조인패스는 1입니다.");
			session.invalidate();
			return "redirect:/";
		} else if(user.getJoinPath() == "2"){
			System.out.println("유저의 조인패스는 2번입니다");
			session.invalidate();
			return "redirect:/";
		} else if(user.getJoinPath() == "3"){
			System.out.println("유저의 조인패스는 3번입니다");
			session.invalidate();
			return "redirect:/";
		} else {
			System.out.println("유저의 조인패스는 4번입니다");
			session.invalidate();
			return "redirect:/";
		}
	
	}
//-----------------------------------------------------------------------------------------------------------------
	
	
//-- [완료] 로그인 진행 후 메인페이지 이동 : 로그인 세션 유지 -------------------------------------------------------------------------------------------
	@RequestMapping("loginUser")
	public String loginUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("\n"+"UserController_____loginUser 리퀘스트매핑");
		System.out.println("loginUser의 user를 확인해보자 : \n"+user+"\n");
		
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
	public String addUser (@ModelAttribute("user") User user,
						   @RequestParam("password") String password) throws Exception {
		
		System.out.println("\n"+"UserController_____addUser 시작"+"\n");
		System.out.println("추가정보를 입력받아 회원가입을 마무리 짓는 부분입니다.");
		
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
	
//-- searchUserPwd.jsp로 이동하는 단순네비게이션 ------------------------------------------------------------
	@RequestMapping("searchUserPwd")
	public String searchUserPwd() throws Exception {
			
		System.out.println("UserController_____searchUserPwd 시작");
		System.out.println("비밀번호를 찾기위한 아이디확인으로 이동하는 단순 네비게이션입니다.");
				
		return "user/searchUserPwd";	
	}
//-----------------------------------------------------------------------------------------------------------------

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

	@RequestMapping("getMyHomeBoard")
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
		
		System.out.println(userService.getUser(userId));
		
		System.out.println("\n"+"1 : UserController_____getMyHomeBoard 시작"+"\n");
		System.out.println("마이홈의 메인을 출력하는 페이지입니다. 여러 값들을 가져와야 하는 부분");		
		
		model.addAttribute("user",userService.getUser(userId));
		
		// 코인, 팔로잉, 게시판, 모임에서 사용해야하니 CommonRestController 보고 작성해보
		
		System.out.println("여기도 확인해보자 : "+userId);
		System.out.println("겟마이홈보드에서 model.addAttribute(user)를 불러오면? : "+userId);
		// 로그인유저 확인해보기 loginUser
		System.out.println(userService.getUser(userId));
		return "user/getMyHomeBoard";
	}	
////-----------------------------------------------------------------------------------------------------------------

	
//-- [완료] 프로필수 (단순 네비게이션) -------------------------------------------------------------------------------------------
	@RequestMapping("updateProfile")
	public String updateProfile(@RequestParam("userId") String userId, Model model) throws Exception{
				
		System.out.println("\n"+"UserController_____updateProfile 프로필수정 페이지"+"\n");
		
		model.addAttribute("user",userService.getUser(userId));
		
		System.out.println(userService.getUser(userId));
		return "user/updateProfile";
	}
//-----------------------------------------------------------------------------------------------------------------	
		
//	@RequestMapping("updateNickname")
//	public String updateUser(	@RequestParam("userId") String userId,
//								@RequestParam("nickname") String nickname,
//									@ModelAttribute("user") User user,
//									Model model) throws Exception {
//				
//		System.out.println("\n"+"UserRestController_____updateNickname 시작");
//		
//		user.setNickname(nickname);
//		System.out.println("변경해서 데리고 온 닉네임 확인하기 : "+nickname);
//		
//		System.out.println("데려온 userId : "+user.getUserId());
//		System.out.println("데려온 nickname : "+user.getNickname());
//
//		userService.updateUser(user);
//		System.out.println("변경되었는지 확인해보기 : "+user);
//		
//		model.addAttribute(nickname, user);
//		System.out.println("모델로 두었을 떄 변경되었는지 확인해보기 : "+user);
//		
////		user.getUser(user.getUserId());
////		user.addAttribute("nickname", user);
//		System.out.println("이것도 확인 : "+user.getUserId());
////		System.out.println("두번째 확인 : "+model.addAttribute("nickname", user));
//		return "user/updateUser";				
//	}

// [프로필 업데이트]-----------------------------------------------------------------------------------------------	
	
	// 1. [닉네임수정] - updateNickname
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
	
}