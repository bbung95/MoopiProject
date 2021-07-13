package com.moopi.mvc.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	public CommonController() {
	}
	
	@RequestMapping("main")
	public String home() {
		
		System.out.println("/main");
		return "main";
	}

}
