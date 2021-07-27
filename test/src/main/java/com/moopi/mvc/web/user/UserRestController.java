package com.moopi.mvc.web.user;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
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

	@Autowired
	private CommonServiceImpl commonService;

	@Autowired
	private BoardServiceImpl boardService;

	@Autowired
	private MoimServiceImpl moimService;
	
	@Value("6")
	private int pageSize;
	
	@Value("10")
	private int pageUnit;

	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().substring(0,
			ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
			+ "src/main/resources/static/images/uploadFiles";

	public UserRestController() {
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

	@RequestMapping(value = "json/sms/{phone}", method = RequestMethod.GET)
	public HashMap MessageTest(@PathVariable String phone) {

		System.out.println("MassageTest 시작");

		// 발송시간 시작
		// long start = System.currentTimeMillis();

		try {
			String[] array = new String[6];
			String key = new String();
			Random rd = new Random(); // 랜덤 객체 생성

			for (int i = 0; i < array.length; i++) {
				array[i] = Integer.toString(rd.nextInt(10));
				key += array[i];
			}

			// 문자보내기(테스트시 발신, 수신 둘다 내 번호로 하기)
			params.put("to", phone); // 수신번호
			params.put("from", "01049670511"); // 발신번호
			params.put("type", "SMS");
			params.put("text", "[Moopi 본인확인] 본인인증 확인번호 [" + key + "]를 입력하세요"); // 문자전송
			params.put("mode", "test");
			params.put("key", key);
			System.out.println("이거확인해봐 : " + key); // 인증번호 6자리 숫자가 key가 됨
			result = message.send(params);
			System.out.println((result.get("group_id")));
			;

			// 발송시간 끝
			// long end = System.currentTimeMillis();

			// balance
			// result = message.balance();
			// System.out.println((result.get("cash")));

			// sent
			// params.clear();
			try {
				result = message.sent(params);
				System.out.println(result.get("data"));
			} catch (Exception e) {
				result = (JSONObject) JSONValue.parse(e.getMessage());
				System.out.println(result.get("code"));
				System.out.println("NoSuchMessage");
			}

			// status
			// result = message.getStatus(params);
			System.out.println(result.get("data"));

			// cancel
			params.put("mid", "MIDTEST");
			// result = message.cancel(params);
			// assertTrue(!result.isEmpty());
		} catch (Exception e) {
			// fail(e.toString());
		}
		System.out.println(result);
		System.out.println(params);
		return params;
	}

	// [중간완료] 아이디 중복체크진행
	@RequestMapping("idCheck")
	@ResponseBody
	public int userIdCheck(@RequestParam("userId") String userid) {
		// System.out.println("UserRestController____id 중복확인 컨트롤러실행");
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
	 * // 카카오 로그인 및 회원가입
	 * 
	 * @RequestMapping("kakaoLogin") public String kakaoLogin
	 * ( @ModelAttribute("user") User user, HttpSession session) throws Exception {
	 * 
	 * System.out.println("\n"+"UserRestController_____kakaoLogin 시작");
	 * System.out.println("카카오 이메일형식을 입력받아 추가입력 페이지로 보내는 역할을 합니다.");
	 * 
	 * // 카카오 고유 아이디 받아올 시 ','가 출력되어 해당부분 split으로 제거하는 작업 거침 String kId =
	 * user.getUserId(); String spot = ",";
	 * 
	 * String[] temp = kId.split(spot); for(int i=0; i<temp.length; i++) { }
	 * 
	 * String kakaoId = temp[1]; user.setUserId(kakaoId); user.setJoinPath("4");
	 * 
	 * System.out.println("가입경로 확인 : "+userService.getUser(user.getJoinPath()));
	 * 
	 * User dbUser = userService.getUser(user.getUserId());
	 * 
	 * // db에 유저값 존재시 추가정보입력, db에 유저값이 없을 경우 메인페이지 출력 if( dbUser != null ) {
	 * session.setAttribute("user", dbUser); return "redirect:/"; } else { return
	 * "user/addUserInfo"; } }
	 */
	// 네이버 회원가입 [400Error발생]
	/*
	 * naver 로 로그인시 개인에게 고유발급되는 아이디를 UserId에 담을 예정 console과 alert창에서는 토큰과 회원의 고유
	 * 아이디가 출력되지만, URL에서도 출력이안되어 담기어려움 이 부분과 관련하여 의논필요함
	 */
	@RequestMapping("naverlogin")
	public String naverlogin(@RequestParam("userId") String userId, @ModelAttribute("user") User user,
			HttpSession session) throws Exception {

		System.out.println("\n" + "UserRestController_____naverlogin 시작");

		User dbUser = userService.getUser(user.getUserId());

		// db에 유저값 존재시 추가정보입력, db에 유저값이 없을 경우 메인페이지 출력
		if (dbUser != null) {
			session.setAttribute("dbUser", dbUser);
			return "redirect:/";
		} else {
			return "user/addUserInfo";
		}
	}

	// [완료]구글 로그인, 회원가입
	// @GetMapping(value="googleLogin?userId={userId}")
	@RequestMapping("addUserInfo/{userId}")
	public void googleLogin(@PathVariable(value = "userId") String userId, @ModelAttribute("user") User user,
			HttpSession session) throws Exception {
		// @RequestMapping("addUserInfo/{userId}")
		// @PathVariable(value="userId") String userId,
		// @RequestParam("userId") String userId,
		User dbUser = userService.getUser(user.getUserId());
		System.out.println("뭘뜻하지 : " + dbUser);

		if (dbUser == null) {
			System.out.println("추가정보입력 페이지로 이동해야함");
		} else {
			userService.addUser(dbUser);
		}
	}

// [프로필 업데이트]-----------------------------------------------------------------------------------------------	

	// ## 미구현 0. [프로필이미지수정] - updateNickname
	@RequestMapping(value = "json/uploadProfileImage")
	public String uploadProfileImage(@RequestParam("profileImage") MultipartFile uploadFile,
			@RequestParam("userId") String userId) {

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
	
	// 완료 - [관심사]
	@GetMapping(value = "json/updateAddress/{userId}/{fullAddr}/{addr}")
	public void updateAddress(	@PathVariable String userId, 
								@PathVariable String fullAddr,
								@PathVariable String addr) {
		User user = new User();
		user.setUserId(userId);
		user.setFullAddr(fullAddr);
		user.setAddr(addr);
		userService.updateAddress(user);
	}
	
	// 완료 - [닉네임수정]
	@PostMapping(value = "json/updateNickname")
	public User updateNickname(	@RequestBody User user) {	
		
		System.out.println("updateNickname : POST");
		userService.updateNickname(user);
		
		return user;
	}

	// 완료 - [프로필소개수정]
	@GetMapping(value = "json/updateContent/{userId}/{profileContent}")
	public void updateContent(	@PathVariable String userId, 
								@PathVariable String profileContent) {
		User user = new User();
		user.setUserId(userId);
		user.setProfileContent(profileContent);
		userService.updateContent(user);
	}
	
	// 완료 - 관심사수정
	@GetMapping(value = "json/updateInterest/{userId}/{interestFirst}/{interestSecond}/{interestThird}")
	public void updateInterest(	@PathVariable String userId, 
								@PathVariable String interestFirst,
								@PathVariable String interestSecond,
								@PathVariable String interestThird) {
		User user = new User();
		user.setUserId(userId);
		user.setInterestFirst(interestFirst);
		user.setInterestSecond(interestSecond);
		user.setInterestThird(interestThird);
		userService.updateInterest(user);
	}
	
	// 마이홈상태수정
	@GetMapping(value = "json/updateMyhomeStat/{userId}/{myhomeState}")
	public void updateMyhomeStat(	@PathVariable String userId, 
									@PathVariable int myhomeState) {	
		System.out.println("마이홈상태 변경되는 메서드입니다.");		
		// Int -> String 형변환
		String mhState = Integer.toString(myhomeState);		
		User user = new User();
		user.setUserId(userId);
		user.setMyhomeState(mhState);
		userService.updateMyhomeStat(user);
	}
	
	
	
	
	
	
	
	
	
	
// [팔로우 CRUD]
	@GetMapping(value = "json/follow/{target}")
	public boolean follow(@PathVariable String target, HttpSession session) {

		System.out.println("follow : GET");
		// session User
		User user = (User) session.getAttribute("dbUser");
		// 팔로우 유무 체크
		User follower = userService.getFollow(user.getUserId(), target);

		if (follower == null) {
			userService.addFollow(user.getUserId(), target);

			// 알림
			System.out.println("follow Notice");
			Notice notice = new Notice();
			notice.setToUserId(target); // 알림대상
			notice.setNoticeContent("님이 팔로우 하셨습니다");
			notice.setNoticeType("8");
			notice.setNoticeUser(user);
			commonService.addNotice(notice);
			//
			return false;
		}

		userService.deleteFollow(user.getUserId(), target);

		return true;
	}

// 마이홈 게시글 CRUD		
	@PostMapping(value = "json/addMyBoard")
	public Board addMyBoard(User user, Board board, MultipartFile[] uploadFiles) throws Exception {

		System.out.println("addMyBoard : POST");
		System.out.println(board);
		System.out.println(uploadFiles);
		String fileName = "";
		if (uploadFiles != null) {
			for (MultipartFile file : uploadFiles) {
				
				// 랜덤 키
				String[] array = new String[6];
				String key = new String();
				Random rd = new Random(); 

				for (int i = 0; i < array.length; i++) {
					array[i] = Integer.toString(rd.nextInt(10));
					key += array[i];
				}
				
				String uploadFile = "";
				long currentTime = System.currentTimeMillis();
				uploadFile = currentTime + key + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				fileName += uploadFile + "/";
				try {
					file.transferTo(new File(saveDir + "/" + uploadFile));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			board.setBoardFile(fileName);
		}
		board.setBoardWriter(user);
		board.setBoardCategory("3");
		boardService.addBoard(board);
		
		return board;

	}
	
	@GetMapping(value="json/myBoardList/{userId}/{currentPage}")
	public Map<String, Object> myBoardList(@PathVariable String userId,@PathVariable int currentPage) throws Exception{
		
		System.out.println("myBoardList : GET");
		
		Search search = new Search();
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		search.setCurrentPage(currentPage);
		
		return boardService.getBoardList(search, "3", "1", userId);
	}
	
	@GetMapping(value="json/getMyBoard/{boardNo}")
	public Map<String, Object> getMyBoard(@PathVariable int boardNo ) throws Exception{
		
		System.out.println("getMyBoard : GET");
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("board", boardService.getBoard(boardNo));
		
		return map;
	}
}
