package com.moopi.mvc.web.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
public class CommonController {
	
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private MoimServiceImpl moimService;
	@Autowired
	private FlashServiceImpl flashService;
	@Autowired
	private CommonServiceImpl commonService;
	
	@Value("${page.pageUnit}")
	int pageUnit;
	
	@Value("${page.pageSize}")
	int pageSize;
	
	public CommonController() {
	}
	
	@RequestMapping("/")
	public String home(Model model) {
		
		System.out.println("/main");

		model.addAttribute("interest", commonService.getInterest());
		
		return "index";
	}
	
	@GetMapping("common/adminMoopi")
	public String adminMoopi(HttpSession session) {
		
		System.out.println("adminMoopi : GET");
		User user = (User)session.getAttribute("dbUser");
		if(user != null && user.getUserRole().equals("1")) {
			
			return "common/adminMain";
		}
		return "redirect:/";
	}
	
	@GetMapping("common/getUserList")
	public String getUsetList(Model model) throws Exception {
		
		Search search = new Search();
		
		System.out.println("common/getUsetList : GET");
		model.addAttribute("list",userService.getUserList(search, 0).get("list"));
		model.addAttribute("totalCount", userService.getUserList(search, 0).get("totalCount"));

		return "common/adminUserList";
	}
	
	@GetMapping("common/getMoimList")
	public String getMoimList(Model model) throws Exception {
		
		Search search = new Search();
		
		System.out.println("common/getMoimList : GET");
		model.addAttribute("list",moimService.getMoimList(search).get("list"));
		model.addAttribute("totalCount", moimService.getMoimList(search).get("totalCount"));

		return "common/adminMoimList";
	}
	
	@GetMapping("common/getFlashList")
	public String getFlashList(Model model) throws Exception {
		
		Search search = new Search();
		
		System.out.println("common/getFlashList : GET");
		model.addAttribute("list",flashService.getFlashList(search).get("list"));
		model.addAttribute("totalCount", flashService.getFlashList(search).get("totalCount"));
		return "common/adminFlashList";
	}
	
	@GetMapping("common/getReportList")
	public String getReportList(Model model) throws Exception {
		
		Search search = new Search();
		
		System.out.println("common/getReportList : GET");
		model.addAttribute("list",flashService.getFlashList(search).get("list"));
		return "common/adminFlashList";
	}
	
	@GetMapping("common/getPaymentList")
	public String getPaymentList(Model model) throws Exception {
		
		Search search = new Search();
		
		System.out.println("common/getPaymentList : GET");
		model.addAttribute("payment",flashService.getFlashList(search).get("list"));
		return "common/adminFlashList";
	}
	
	//@CrossOrigin(origins = "http://localhost:82")
	@GetMapping(value="/chat/chatList")
	public String chatList() {
		System.out.println("chatList : GET");
		return "common/chatList";
	}
	
	@GetMapping(value="/chat/joinRoom")
	public String joinRoom(@RequestParam("userId") String userId, @RequestParam("trgt") String trgt,
				@RequestParam("type")String type, Model model) throws Exception {
		
		System.out.println("joinRoom : GET");
		
		model.addAttribute("user", userService.getUser(userId));
		model.addAttribute("type", type);
		if(type.equals("1")) {
			model.addAttribute("target", userService.getUser(trgt));
			return "common/chatRoom";
		}else{
			model.addAttribute("target", moimService.getMoim(Integer.parseInt(trgt)));
			return "common/groupRoom";
		}
	}
	
	@RequestMapping(value="/common/mainSearch")
	public String mainSearch(@RequestParam(defaultValue = "0" ) int interestNo, @RequestParam(required=false) String addr, 
			@RequestParam("type") int type, Search search, Model model) throws Exception {
		
		if(type == 1) {
			
			System.out.println("moimSearch");
			model.addAttribute("list", moimService.getMoimList(search).get("list"));
			return "moim/moimMain";
		}else {
			
			System.out.println("flashSearch");
			model.addAttribute("list", flashService.getFlashList(search).get("list"));
			return "flash/flashMain";
		}
		
	}
}
