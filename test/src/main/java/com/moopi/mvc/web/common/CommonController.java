package com.moopi.mvc.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	public CommonController() {
	}
	
	@RequestMapping("/")
	public String home() {
		
		System.out.println("/main");
		return "index";
	}
	
	@GetMapping("/common/adminMoopi")
	public String adminMoopi() {
		
		System.out.println("adminMoopi : GET");
		
		return "common/adminMain";
	}
	
	@RequestMapping("/list")
	public String userList() {
		
		System.out.println("/userList");
		return "userList";
	}
	
}
