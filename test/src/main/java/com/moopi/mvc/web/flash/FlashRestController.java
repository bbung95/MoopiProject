package com.moopi.mvc.web.flash;

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

@RestController
@RequestMapping("/flash/*")
public class FlashRestController {
	
	@Autowired
	private FlashServiceImpl flashService;
	
	//Constructor
	public FlashRestController() {
		System.out.println(this.getClass());
	}

	@GetMapping(value = "json/getJoinFlashList/{targetNo}")
	public Map<String, Object> getJoinFlashList(@PathVariable("targetNo")int targetNo ) throws Exception{
		System.out.println("getJoinFlashList : PSOT");
		//Map<String, Object> map = flashService.getJoinFlashList(targetNo);
		
		return flashService.getJoinFlashList(targetNo);
	}
	
	
}
