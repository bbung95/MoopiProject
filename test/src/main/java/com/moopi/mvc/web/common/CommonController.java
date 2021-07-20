package com.moopi.mvc.web.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
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
	
	public CommonController() {
	}
	
	@RequestMapping("/")
	public String home() {
		
		System.out.println("/main");
		return "index";
	}
	
	@GetMapping("common/adminMoopi")
	public String adminMoopi() {
		
		System.out.println("adminMoopi : GET");
		
		return "common/adminMain";
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
	public String joinRoom(@RequestParam("userId") String userId, @RequestParam("trgt") String trgt, Model model) throws Exception {
		
		System.out.println("joinRoom : GET");
		model.addAttribute("user", userService.getUser(userId));
		model.addAttribute("target", trgt);
		return "common/chatRoom";
	}
}
