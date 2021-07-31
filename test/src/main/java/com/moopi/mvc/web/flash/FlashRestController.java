package com.moopi.mvc.web.flash;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.impl.CoinServiceImpl;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.MeetingFlashMember;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@RestController
@RequestMapping("/flash/*")
public class FlashRestController {
	
	@Autowired
	private FlashServiceImpl flashService;
	
	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private CoinServiceImpl coinService;
	
	@Autowired
	private CommonServiceImpl commonService;
	
	@Value("6")
	private int pageSize;
	
	@Value("10")
	private int pageUnit;
	
	//Constructor
	public FlashRestController() {
		System.out.println(this.getClass());
	}

	// getJoinFlashList where :: joinFlashmember List
	@GetMapping(value = "json/getJoinFlashList/{targetNo}")
	public Map<String, Object> getJoinFlashList(@PathVariable("targetNo")int targetNo ) throws Exception{
		System.out.println("getJoinFlashList : GET");
		//Map<String, Object> map = flashService.getJoinFlashList(targetNo);
		
		return flashService.getJoinFlashList(targetNo);
	}
	
	
	//getListFlash auto scroll target:: mainFlash
	@RequestMapping(value = "json/getListFlash")
	public Map<String,Object> getListFlash(@RequestBody Search search)throws Exception  {
		
		System.out.println("getListFlash:Rest:GET:Start!! ");
		
		search.setPageSize(pageSize);
		
		
		return flashService.getFlashList(search);
	}
	
	
}
