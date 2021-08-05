package com.moopi.mvc.web.flash;

import java.io.File;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.impl.CoinService;
import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Coin;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.flash.impl.FlashService;
import com.moopi.mvc.service.user.impl.UserService;

@Controller
@RequestMapping("/flash/*")
public class FlashController {

	@Autowired
	private FlashService flashService;

	@Autowired
	private UserService userService;

	@Autowired
	private CoinService coinService;
	
	@Autowired
	private CommonService commonService;
	
	@Value("${page.pageUnit}")
	int pageUnit;
	
	@Value("${page.pageSize}")
	int pageSize;
	

	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().substring(0,
			ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
			+ "src/main/resources/static/images/uploadFiles";
	
	// Constructor
	public FlashController() {
		System.out.println(this.getClass());
	}

	// 플래쉬 상세보기
	@RequestMapping("getFlash")
	public String getFlash(@RequestParam("flashNo") int flashNo, Model model) throws Exception {

		System.out.println("getFlash ::: start!!");

		Flash flash = flashService.getFlash(flashNo);
		System.out.println(flash);

		model.addAttribute("flash", flashService.getFlash(flashNo));

		return "flash/getFlash";
	}

	// 플래시 생성창 View
	@RequestMapping("addFlashView")
	public String addFlashView(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("addFlashView start::");
		model.addAttribute("userId", userId);
		return "flash/addFlashView";
	}

	@RequestMapping("addFlash")
	public String addFlash(@ModelAttribute("flash") Flash flash, MultipartFile uploadFile,
			@ModelAttribute("userId") User user) throws Exception {

		System.out.println("addFlash Start::");

		String flashFileName = uploadFile.getOriginalFilename();
		System.out.println("flashFileName::" + flashFileName);
		long currentTime = System.currentTimeMillis();// 시분초단위
		
		String[] array = new String[6];
		Random rd = new Random(); 
		String key = new String();

		for (int i = 0; i < array.length; i++) {
			array[i] = Integer.toString(rd.nextInt(10));
			key += array[i];
		}
		
		String fileName = currentTime + key + uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));
		try {
			uploadFile.transferTo(new File(saveDir + "/" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		flash.setFlashFile(fileName); // 시간+파일이름
		flash.getFlashNo();
		// User user = new User();
		Coin coin = new Coin();
		// user.setUserId(userId);
		coin.setCoinUser(user);
		coin.setFlash(flash);
		System.out.println("flashNo::" + flash);
		flash.setFlashConstructor(user);// userId = flashConstructor
		flashService.addFlash(flash); // addFlash bl 로직
		userService.makeFlashCoin(user);
		coinService.addCoin(coin);

		System.out.println("번개생성 완료.");
		return "redirect:/flash/getFlash?flashNo="+flash.getFlashNo();
	}

	// 번개무피 수정 View
	@RequestMapping("updateFlashView")
	public String updateFlashView(@RequestParam("flashNo") int flashNo, Model model) throws Exception {
		Flash flash = new Flash();
		flashService.getFlash(flashNo);
		flash = flashService.getFlash(flashNo);
		model.addAttribute("flash", flash);
		return "redirect:/flash/getFlash?flashNo="+flashNo;
	}

	@RequestMapping("updateFlash")
	public String updateFlash(@ModelAttribute("flash") Flash flash, MultipartFile uploadFile,
			@RequestParam("userId") String userId) throws Exception {

		System.out.println("updateFlash Start::");
		String flashFileName = uploadFile.getOriginalFilename();
		System.out.println(flashFileName);
		long currentTime = System.currentTimeMillis();// 시분초단위
		try {
			uploadFile.transferTo(new File(saveDir + "/" + currentTime + flashFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		flash.setFlashFile(currentTime + flashFileName); // 시간+파일이름
		User user = new User();
		user.setUserId(userId);
		flash.setFlashConstructor(user);// userId = flashConstructor
		flashService.updateFlash(flash); // addFlash bl 로직
		System.out.println("updateFlash done.");
		return "redirect:/flash/getFlash?flashNo="+flash.getFlashNo();
	}

	@RequestMapping("listFlash")
	public String getListFlash(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("getListFlash Start::");
		
		model.addAttribute("search", search);
		model.addAttribute("interest", commonService.getInterest());
		
		return "flash/flashMain";
	}

	@RequestMapping("joinFlash")
	public String joinFlash(@RequestParam("userId") String userId, @RequestParam("flashNo") int flashNo)
			throws Exception {
		User user = new User();
		user.setUserId(userId);
		
		System.out.println("joinFlash Start::");
		
		Flash flash = new Flash();
		flash.setFlashNo(flashNo);
		
		Coin coin = new Coin();
		coin.setCoinUser(user);
		coin.setFlash(flash);
		
		flashService.joinFlash(userId, flashNo);
		flashService.joinFlashUpdate(flash);
		userService.joinFlashCoin(user);

		coinService.joinCoin(coin);

		
		// 알림
		System.out.println("flash join Notice");
		Notice notice = new Notice();
		
		flash.setFlashNo(flashNo);
		notice.setToUserId(flashService.getFlash(flashNo).getFlashConstructor().getUserId()); // 알림대상
		notice.setNoticeContent("님이 참여하셨습니다");
		notice.setFlash(flash);
		notice.setNoticeUser(user);
		notice.setNoticeType("5");
		commonService.addNotice(notice);
		//

		
		return "forward:/flash/getFlash";
	}

	// 번개참여신청목록
	/*
	 * @RequestMapping("getJoinFlashList") public String
	 * getJoinFlashList(@RequestParam("mfm") MeetingFlashMember mfm, Model model)
	 * throws Exception{
	 * 
	 * System.out.println("joinFlashList start::"); Map<String, Object> map =
	 * flashService.getJoinFlashList(); model.addAttribute("list",map.get("list"));
	 * 
	 * return null; }
	 */

}
