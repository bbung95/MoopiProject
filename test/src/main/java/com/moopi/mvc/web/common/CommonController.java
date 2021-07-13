package com.moopi.mvc.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	public CommonController() {
	}
	
	@RequestMapping("/")
	public String home() {
		
		System.out.println("/main");
		return "test";
	}
	
	@RequestMapping("/list")
	public String userList() {
		
		System.out.println("/userList");
		return "userList";
	}
	
}
