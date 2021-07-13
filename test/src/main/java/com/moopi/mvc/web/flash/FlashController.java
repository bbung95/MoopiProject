package com.moopi.mvc.web.flash;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;

@Controller
@RequestMapping("/flash/*")
public class FlashController {
	
	@Autowired
	private FlashServiceImpl flashService;
	
	//Constructor
	public FlashController() {
		System.out.println(this.getClass());
	}

	@RequestMapping("getFlash")
	public Flash getFlash(@RequestParam("flashNo") int flashNo, Model model) throws Exception {
		
		System.out.println("getFlash ::: start!!");
		
		Flash flash = flashService.getFlash(flashNo);
		System.out.println(flash);
		
		model.addAttribute("flash", flashService.getFlash(flashNo));
		
		return flash;
	}
	
	
}
