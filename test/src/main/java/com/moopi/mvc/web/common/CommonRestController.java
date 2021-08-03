package com.moopi.mvc.web.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardService;
import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.UserData;
import com.moopi.mvc.service.payment.impl.PaymentService;
import com.moopi.mvc.service.flash.impl.FlashService;
import com.moopi.mvc.service.moim.impl.MoimService;
import com.moopi.mvc.service.user.impl.UserService;

@RestController
@RequestMapping("/common/*")
public class CommonRestController {

	@Autowired
	private CommonService commonService;
	@Autowired
	private MoimService moimService;
	@Autowired
	private FlashService flashService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private PaymentService paymentService;
	
	@Value("6")
	private int pageSize;
	
	@Value("10")
	private int pageUnit;

	//public static final String saveDir = "/Users/bbung_/git/MoopiProject/test/src/main/resources/static/images/uploadFiles/chat";
	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().
										substring(0, ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
										+"src/main/resources/static/images/uploadFiles/chat";
	
	@PostMapping(value = "json/addNotice")
	public void addNotice(@RequestBody Notice notice) {
		System.out.println("addNotice : POST");
		System.out.println(notice);
		commonService.addNotice(notice);
	}

	@GetMapping(value = "json/getNoticeCount/{userId}")
	public int getNoticeCount(@PathVariable("userId") String userId) {

		System.out.println("/getNoticeCount : GET");
		return commonService.getNoitceCount(userId);
	}
	
	//차트에서 쓰려고 만들었습니다.
	
	@GetMapping(value = "json/getMonth")
	public Map<String, Object> getMonth(Model model) throws Exception {
		Search search = new Search();
		System.out.println("/getMonth-월간통계 : GET");
		Map<String, Object> map = paymentService.getMonthList(search);
		model.addAttribute("list", map.get("list"));
		return paymentService.getMonthList(search);
	}
	
	
	
	@GetMapping(value = "json/getWeek")
	public Map<String, Object> getWeek(Model model) throws Exception {
		Search search = new Search();
		System.out.println("/getWeek-주간통계 : GET");
		Map<String, Object> map = paymentService.getWeekList(search);
		model.addAttribute("list2", map.get("list2"));
		return paymentService.getWeekList(search);
	}
	
	@GetMapping(value = "json/getDay")
	public Map<String, Object> getDay(Model model) throws Exception {
		Search search = new Search();
		System.out.println("/getDay-일간통계 : GET");
		Map<String, Object> map = paymentService.getDayList(search);
		model.addAttribute("list3", map.get("list3"));
		return paymentService.getDayList(search);
	}

	
	@GetMapping(value = "json/getJoinPath")
	public UserData getJoinPath(Model model) throws Exception {
		
		System.out.println("/getJoinPath-가입경로 : GET");
		UserData userData = userService.getJoinPath();
		model.addAttribute("userData", userData);
		return userData;
	}
	
	
	@GetMapping(value = "json/getGender")
	public UserData getGenderData(Model model) throws Exception {
		
		System.out.println("/getGender-성비 : GET");
		UserData userData = userService.getGenderData();
		model.addAttribute("userData", userData);
		return userData;
	}
	
	@GetMapping(value = "json/getAge")
	public UserData getAgeData(Model model) throws Exception {
		
		System.out.println("/getAge-연령대 : GET");
		UserData userData = userService.getAgeData();
		model.addAttribute("userData", userData);
		return userData;
	}
	
	@GetMapping(value = "json/getInterest")
	public UserData getInterestData(Model model) throws Exception {
		
		System.out.println("/getInterest-관심사 : GET");
		UserData userData = userService.getInterestData();
		model.addAttribute("userData", userData);
		return userData;
	}
	
	
	@GetMapping(value = "json/getListNotice/{userId}")
	public List<Notice> getListNotice(@PathVariable("userId") String userId) {

		System.out.println("/getListNotice : GET");
		Search search = new Search();
		return commonService.getListNotice(search, userId);
	}

	@GetMapping(value = "json/updateNoticeState/{userId}")
	public void updateNoticeState(@PathVariable("userId") String userId) {

		System.out.println("updateNoticeState : GET");
		commonService.updateNotice(userId);
	}

	@GetMapping(value = "json/deleteNotice/{noticeNo}")
	public void deleteNotice(@PathVariable("noticeNo") int noticeNo) {

		System.out.println("deleteNotice : GET");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", noticeNo);
		commonService.deleteNotice(map);
	}

	@GetMapping(value = "json/deleteNoticeAll/{userId}")
	public void deleteNoticeAll(@PathVariable("userId") String userId) {

		System.out.println("deleteNoticeAll : GET");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		commonService.deleteNotice(map);
	}

	@PostMapping(value = "json/searchList/{searchType}")
	public Map<String, Object> getSearchList(@RequestBody Search search, @PathVariable("searchType") int searchType )
			throws Exception {

		System.out.println("SearchList : POST");

		if (searchType == 1) {
			System.out.println("Moim List");
			search.setPageSize(pageSize);
			search.setSearchCondition(3);
			return moimService.getMoimList(search);
		} else if (searchType == 2) {
			System.out.println("Flash List");
			search.setPageSize(pageSize);
			search.setSearchCondition(3);
			return flashService.getFlashList(search);
		} else if (searchType == 3) {
			System.out.println("Posting List");
			search.setSearchCondition(1);
			search.setPageSize(pageSize);
			search.setPageUnit(pageUnit);
			return boardService.getBoardList(search, "3", "1");
		} else {
			System.out.println("User List");
			search.setSearchCondition(2);
			search.setPageSize(pageSize);
			search.setPageUnit(pageUnit);
			return userService.getUserList(search, 0);
		}

	}
	
	@GetMapping(value="/chat/joinRoom/{userId}/{target}/{type}")
	public Map joinRoom(@PathVariable String userId, @PathVariable String target,
			@PathVariable String type, Model model) throws Exception {
		
		System.out.println("joinRoom : GET");
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUser(userId));
		map.put("type", type);
		if(type.equals("1")) {
			map.put("target", userService.getUser(target));
		}else{
			map.put("target", moimService.getMoim(Integer.parseInt(target)));
		}
		return map;
	}

//	@PostMapping(value = "json/fileUpload")
//	public String fileUpload(@RequestParam("uploadFile") MultipartFile file) {
//
//		System.out.println("fileUpload : POST");
//		long currentTime = System.currentTimeMillis();
//		String fileName = currentTime + file.getOriginalFilename();
//		try {
//			file.transferTo(new File(saveDir + "/" + fileName));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return fileName;
//	}

// 	다중 이미지 업로드	
//	@PostMapping(value="json/fileUpload")
//	public String fileUpload(@RequestParam("uploadFile") MultipartFile[] files) {
//		
//		System.out.println("fileUpload : POST");
//		
//		String fileName = "";
//		for(MultipartFile file : files) {
//			long currentTime = System.currentTimeMillis();
//			fileName += currentTime+file.getOriginalFilename()+"/";
//			try {
//				file.transferTo(new File(saveDir+"/"+fileName));	
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return fileName;
//	}

}
