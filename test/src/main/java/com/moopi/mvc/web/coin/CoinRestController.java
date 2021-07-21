package com.moopi.mvc.web.coin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.MeetingFlashMember;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;

//@RestController
@RequestMapping("/flash/*")
public class CoinRestController {
	
	@Autowired
	private FlashServiceImpl flashService;
	
	//Constructor
	public CoinRestController() {
		System.out.println(this.getClass());
	}


	
	
}
