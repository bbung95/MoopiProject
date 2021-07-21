package com.moopi.mvc.web.flash;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.impl.CoinServiceImpl;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Coin;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.MeetingFlashMember;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/flash/*")
public class FlashController {

	@Autowired
	private FlashServiceImpl flashService;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private CoinServiceImpl coinService;


	private CoinServiceImpl coinSerivce;
	
	@Autowired
	private CommonServiceImpl commonService;
	

	public static final String savePic = "C:\\Users\\guddn\\git\\Test\\test\\src\\main\\resources\\static\\images\\uploadFiles";

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
		try {
			uploadFile.transferTo(new File(savePic + "/" + currentTime + flashFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		flash.setFlashFile(currentTime + flashFileName); // 시간+파일이름
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
		return "flash/flashMain";
	}

	// 번개무피 수정 View
	@RequestMapping("updateFlashView")
	public String updateFlashView(@RequestParam("flashNo") int flashNo, Model model) throws Exception {
		Flash flash = new Flash();
		flashService.getFlash(flashNo);
		flash = flashService.getFlash(flashNo);
		model.addAttribute("flash", flash);
		return "flash/updateFlashView";
	}

	@RequestMapping("updateFlash")
	public String updateFlash(@ModelAttribute("flash") Flash flash, MultipartFile uploadFile,
			@RequestParam("userId") String userId) throws Exception {

		System.out.println("updateFlash Start::");
		String flashFileName = uploadFile.getOriginalFilename();
		System.out.println(flashFileName);
		long currentTime = System.currentTimeMillis();// 시분초단위
		try {
			uploadFile.transferTo(new File(savePic + "/" + currentTime + flashFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		flash.setFlashFile(currentTime + flashFileName); // 시간+파일이름
		User user = new User();
		user.setUserId(userId);
		flash.setFlashConstructor(user);// userId = flashConstructor
		flashService.updateFlash(flash); // addFlash bl 로직
		System.out.println("updateFlash done.");
		return "flash/flashMain";
	}

	@RequestMapping("listFlash")
	public String getListFlash(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("getListFlash Start::");
		Map<String, Object> map = flashService.getFlashList(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		System.out.println("getListFlash End");
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
