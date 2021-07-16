package com.moopi.mvc.web.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
public class CommonController {
	
	@Autowired
	private UserServiceImpl userService;
	
	public CommonController() {
	}
	
	@RequestMapping("/")
	public String home() {
		
		System.out.println("/main");
		return "index";
	}
	
	@GetMapping("/adminMoopi")
	public String adminMoopi() {
		
		System.out.println("adminMoopi : GET");
		
		return "common/adminMain";
	}
	
	//@CrossOrigin(origins = "http://localhost:82")
	@GetMapping(value="/chat/chatList")
	public String chatList() {
		System.out.println("chatList : GET");
		return "common/chatList";
	}
	
	@GetMapping(value="/chat/joinRoom")
	public String joinRoom(@RequestParam("trgt") String trgt, Model model) {
		
		System.out.println("joinRoom : GET");
		System.out.println(trgt);
		model.addAttribute("target", trgt);
		return "common/chatRoom";
	}
}
