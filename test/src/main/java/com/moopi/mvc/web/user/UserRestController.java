package com.moopi.mvc.web.user;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardService;
import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyService;
import com.moopi.mvc.service.user.impl.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.api.SenderID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;

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
	// ????????? ???????????? ?????? [???????????? ???????????? ?????????NO] -----------------------------------------------------------------------------------------------	
	
		// Cool SMS API_key ??? API_secret Number
		String api_key = "NCSFQV50UBMEXKK1";
		String api_secret = "HCNQNW9BUTL7MLYFDSHQWXVMZJUFXMKI";
		
		Message message = new Message(api_key, api_secret);
		SenderID senderID;
		JSONObject result;
		JSONArray result_array;
		
		HashMap<String, String> params = new HashMap<String, String>();
				
		@RequestMapping( value="json/sms/{phone}", method=RequestMethod.GET )
		public HashMap MessageTest (@PathVariable String phone) {
			
			System.out.println("MassageTest ??????");
			
			// ???????????? ??????
			//long start = System.currentTimeMillis();
		
			try {
		    	String[] array = new String[6];
				String key = new String();
				Random rd = new Random(); //?????? ?????? ??????
				
				for(int i=0; i<array.length; i++) {
		            array[i] = Integer.toString(rd.nextInt(10));
		            key += array[i];
		        }
		    
			// ???????????????(???????????? ??????, ?????? ?????? ??? ????????? ??????)
			params.put("to", phone); // ????????????
			params.put("from", "010-4967-0511"); // ????????????
			params.put("type", "SMS");
			params.put("text", "[Moopi ????????????] ???????????? ???????????? ["+key+"]??? ???????????????"); // ????????????
			params.put("mode", "test");
			params.put("key", key);
			System.out.println("?????????????????? : "+key);	// ???????????? 6?????? ????????? key??? ???
			result = message.send(params);
			System.out.println((result.get("group_id")));;
			
			// ???????????? ???
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

	// [????????????] ????????? ??????????????????
	@RequestMapping("idCheck")
	@ResponseBody
	public int userIdCheck(@RequestParam("userId") String userid) {
		// System.out.println("UserRestController____id ???????????? ??????????????????");
		return userService.userIdCheck(userid);
	}

	// ????????? ??????????????????
	@RequestMapping("nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		System.out.println("UserRestController____????????? ???????????? ??????????????????");
		return userService.nicknameCheck(nickname);
	}
	

	/*
	 * // ????????? ????????? ??? ????????????
	 * 
	 * @RequestMapping("kakaoLogin") public String kakaoLogin
	 * ( @ModelAttribute("user") User user, HttpSession session) throws Exception {
	 * 
	 * System.out.println("\n"+"UserRestController_____kakaoLogin ??????");
	 * System.out.println("????????? ?????????????????? ???????????? ???????????? ???????????? ????????? ????????? ?????????.");
	 * 
	 * // ????????? ?????? ????????? ????????? ??? ','??? ???????????? ???????????? split?????? ???????????? ?????? ?????? String kId =
	 * user.getUserId(); String spot = ",";
	 * 
	 * String[] temp = kId.split(spot); for(int i=0; i<temp.length; i++) { }
	 * 
	 * String kakaoId = temp[1]; user.setUserId(kakaoId); user.setJoinPath("4");
	 * 
	 * System.out.println("???????????? ?????? : "+userService.getUser(user.getJoinPath()));
	 * 
	 * User dbUser = userService.getUser(user.getUserId());
	 * 
	 * // db??? ????????? ????????? ??????????????????, db??? ???????????? ?????? ?????? ??????????????? ?????? if( dbUser != null ) {
	 * session.setAttribute("user", dbUser); return "redirect:/"; } else { return
	 * "user/addUserInfo"; } }
	 */
	// ????????? ???????????? [400Error??????]
	/*
	 * naver ??? ???????????? ???????????? ?????????????????? ???????????? UserId??? ?????? ?????? console??? alert???????????? ????????? ????????? ??????
	 * ???????????? ???????????????, URL????????? ?????????????????? ??????????????? ??? ????????? ???????????? ???????????????
	 */
	@RequestMapping("naverlogin")
	public String naverlogin(@RequestParam("userId") String userId, @ModelAttribute("user") User user,
			HttpSession session) throws Exception {

		System.out.println("\n" + "UserRestController_____naverlogin ??????");

		User dbUser = userService.getUser(user.getUserId());

		// db??? ????????? ????????? ??????????????????, db??? ???????????? ?????? ?????? ??????????????? ??????
		if (dbUser != null) {
			session.setAttribute("dbUser", dbUser);
			return "redirect:/";
		} else {
			return "user/addUserInfo";
		}
	}

	// [??????]?????? ?????????, ????????????
	// @GetMapping(value="googleLogin?userId={userId}")
	@RequestMapping("addUserInfo/{userId}")
	public void googleLogin(@PathVariable(value = "userId") String userId, @ModelAttribute("user") User user,
			HttpSession session) throws Exception {
		// @RequestMapping("addUserInfo/{userId}")
		// @PathVariable(value="userId") String userId,
		// @RequestParam("userId") String userId,
		User dbUser = userService.getUser(user.getUserId());
		System.out.println("???????????? : " + dbUser);

		if (dbUser == null) {
			System.out.println("?????????????????? ???????????? ???????????????");
		} else {
			userService.addUser(dbUser);
		}
	}
	
	@PostMapping("json/restoreUser")
	public String restoreUser (	@RequestBody User user) throws Exception {
		
		user.setUserRole("2");
		userService.updateUserRole(user);

		return "??????";
	}
	
	@PostMapping(value="json/getRole")
	public User getRole(@RequestBody User user) throws Exception {				
		User returnUser = userService.getUser(user.getUserId());
		
		if(returnUser == null) {
			return user;
		}
		return returnUser;
	}

// [????????? ????????????]-----------------------------------------------------------------------------------------------	

	// ## ????????? 0. [????????????????????????] - updateNickname
	@PostMapping(value ="json/uploadProfileImage")
	public String uploadProfileImage( @RequestParam("file") MultipartFile uploadFile, HttpSession session) {

		System.out.println("RestController - ????????????????????????");
		
		User user = (User)session.getAttribute("dbUser");
		System.out.println(user);
		long currentTime = System.currentTimeMillis();
		
		String fileName = currentTime + uploadFile.getOriginalFilename();

		try {
			uploadFile.transferTo(new File(saveDir + "/" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		user.setProfileImage(fileName);
		userService.updateProfileImage(user);
		
		return fileName;
	}
	
	@PostMapping(value="/json/loginView")
	public Boolean loginView ( @RequestBody User user ) throws Exception {
		userService.login(user);
		return true;
	}

//	@PostMapping(value="/json/updateNickname")
//	public String updateNickname ( @RequestBody User user ) throws Exception {
//		userService.updateNickname(user);
//		return user.getNickname();
//	}
//	
//	@PostMapping(value="/json/updateContent")
//	public Boolean updateContent ( @RequestBody User user ) throws Exception {
//		userService.updateContent(user);
//		return true;
//	}
//	
//	@PostMapping(value="/json/updateAddress")
//	public Boolean updateAddress ( @RequestBody User user) throws Exception {
//		userService.updateAddress(user);
//		return true;
//	}
//	
//	@PostMapping(value="/json/updateInterest")
//	public Boolean updateInterest ( @RequestBody User user ) throws Exception {
//		userService.updateInterest(user);
//		return true;
//	}
//
//	@PostMapping(value="/json/updateMyhomeStat")
//	public Boolean updateMyhomeStat ( @RequestBody User user ) throws Exception {
//		userService.updateMyhomeStat(user);
//		return true;
//	}
	
//	@PostMapping(value="/json/updateUserPhone")
//	public String updateUserPhone ( @RequestBody User user ) throws Exception {
//		userService.updateUserPhone(user);
//		return user.getPhone();
//	}
//	
//	@PostMapping(value="/json/updateUserPWD")
//	public Boolean updateUserPWD ( @RequestBody User user ) throws Exception {
//		userService.updateUserPWD(user);
//		return true;
//	}
	
	@PostMapping(value="/json/updateUser/{type}")
	public String updateUser(@RequestBody User user ,@PathVariable int type) throws Exception {
			
		System.out.println("updateUser : POST");
		
		userService.updateUser(user, type);
		
		//?????????
//		if(type == 1) {
//			userService.updateUserPhone(user);
//		}else if( type == 2) { // ????????????
//			userService.updateUserPWD(user);
//		}else if (type == 3) { // ????????? 
//			userService.updateNickname(user);
//			return user.getNickname();
//		}else if ( type == 4) { // ??????
//			userService.updateContent(user);
//		}else if ( type == 5) { // ?????????
//			userService.updateAddress(user);
//		}else if ( type == 6) { // ?????????
//			userService.updateInterest(user);
//		}else if ( type == 7) { // ??????/?????????
//			userService.updateMyhomeStat(user);
//		}
		
		return "success";
	}
		
	
//	// ?????? - [?????????]
//	@GetMapping(value = "json/updateAddress/{userId}/{fullAddr}/{addr}")
//	public void updateAddress(	@PathVariable String userId, 
//								@PathVariable String fullAddr,
//								@PathVariable String addr) {
//		User user = new User();
//		user.setUserId(userId);
//		user.setFullAddr(fullAddr);
//		user.setAddr(addr);
//		userService.updateAddress(user);
//	}
//	
//	// ?????? - [???????????????]
//	@GetMapping(value = "json/updateNickname/{userId}/{nickname}")
//	public void updateNickname(	@PathVariable String userId, 
//								@PathVariable String nickname) {	
//		User user = new User();
//		user.setUserId(userId);
//		user.setNickname(nickname);
//		userService.updateNickname(user);
//	}
	
//	@PostMapping(value="/json/updatePwd")
//	public Boolean updatePwd ( @RequestBody User user ) throws Exception {				
//		userService.updateUserPwd(user);	
//		return true;
//	}
	
	
// [????????? CRUD]
	@GetMapping(value = "json/follow/{target}")
	public boolean follow(@PathVariable String target, HttpSession session) {

		System.out.println("follow : GET");
		// session User
		User user = (User) session.getAttribute("dbUser");
		// ????????? ?????? ??????
		User follower = userService.getFollow(user.getUserId(), target);

		if (follower == null) {
			userService.addFollow(user.getUserId(), target);

			// ??????
			System.out.println("follow Notice");
			Notice notice = new Notice();
			notice.setToUserId(target); // ????????????
			notice.setNoticeContent("?????? ????????? ???????????????");
			notice.setNoticeType("8");
			notice.setNoticeUser(user);
			commonService.addNotice(notice);
			//
			return true;
		}

		userService.deleteFollow(user.getUserId(), target);

		return false;
	}
	
	@GetMapping(value="json/getFollowList/{userId}/{order}")
	public List<User> getFollowList(@PathVariable("userId") String user, @PathVariable("order") int order){
		
		System.out.println("getFollowList : GET");
		
		return userService.getFollowList(user, order);
	}

// ????????? ????????? CRUD		
	@PostMapping(value = "json/addMyBoard")
	public Board addMyBoard(User user, Board board, MultipartFile[] uploadFiles) throws Exception {

		System.out.println("addMyBoard : POST");
		System.out.println(board);
		System.out.println(uploadFiles);
		String fileName = "";
		if (uploadFiles != null) {
			for (MultipartFile file : uploadFiles) {
				
				// ?????? ???
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
		
		// ??????
		System.out.println("addMyBoard Notice");
		Notice notice = new Notice();
		notice.setBoard(board);
		notice.setNoticeType("10");
		notice.setNoticeUser(user);
		List<User> list = userService.getFollowList(user.getUserId(), 1);
		for(User target: list) {
			notice.setToUserId(target.getTargetId()); // ????????????
			commonService.addNotice(notice);
		}
		
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
	public Map<String, Object> getMyBoard(@PathVariable int boardNo , HttpSession session) throws Exception{
		
		System.out.println("getMyBoard : GET");
		
		/////// ????????????
		User user = (User)session.getAttribute("dbUser");
			
		// ????????? ????????????
		boolean check = false;
		if(user != null) {
			if(boardService.getLike(user.getUserId(), Integer.toString(boardNo)) == 1) {
				check = true;
			}
		}
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("board", boardService.getBoard(boardNo));
		map.put("reply", replyService.getReplyList(boardNo));
		map.put("likeCheck", check);
		
		return map;
	}
	
	@PostMapping(value="json/deleteMyBoard")
	public boolean deleteMyBoard(@RequestBody Board board) throws Exception {
		
		board.setBoardState("2");
		
		boardService.deleteBoard(board);
		
		return true;
	}
	
	
	
//	@PostMapping( value="json/login")
//	public User login(@RequestBody User user) throws Exception{
//		
//		System.out.println("/user/json/login : POST");
//		System.out.println(user);
//		
//		return userService.login(user);		
//	}
	
	
	@PostMapping(value="/json/updatePwd")
	public Boolean updatePwd ( @RequestBody User user ) throws Exception {				
		userService.updateUserPwd(user);	
		return true;
	}
	
	@PostMapping(value="/json/passwordConfirm")
	public boolean passwordConfirm ( @RequestBody User user) throws Exception {
		return true;
	}

	@GetMapping(value="json/myBoardLike/{target}")
	public boolean myBoardLike (@PathVariable String target, HttpSession session) throws Exception {
				
		System.out.println("myBoardLike : GET");
		
		// session User
		User user = (User) session.getAttribute("dbUser");
		
		// ????????? ?????? ??????
		int likeCheck = boardService.getLike(user.getUserId(), target);

		if (likeCheck != 1) {
			boardService.addLike(user.getUserId(), target);
			
			Board board = boardService.getBoard(Integer.parseInt(target));
			
			// ?????? ?????? ??????
			if(!user.getUserId().equals(board.getBoardWriter().getUserId())) {
				
			System.out.println("board Like Notice");
			Notice notice = new Notice();
			notice.setToUserId(board.getBoardWriter().getUserId()); // ????????????
			notice.setNoticeType("7");
			notice.setNoticeUser(user);
			notice.setBoard(board);
			commonService.addNotice(notice);
			}
			//
			return false;
		}

		boardService.deleteLike(user.getUserId(), target);
		
		
		return true;
		} 
	
	
	// ????????? ?????? ?????? ??????
	@PostMapping(value="json/updateBlackUser")
	public Boolean updateBlackUser(@RequestBody User user) throws Exception {
		
		System.out.println("updateBlackUser : POST");
		userService.updateBlackUser(user);
		
		return true;
	}
	
}