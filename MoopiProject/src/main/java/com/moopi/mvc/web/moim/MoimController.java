package com.moopi.mvc.web.moim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;

@Controller
@RequestMapping("/moim/*")
public class MoimController {
	
	@Autowired
	private MoimServiceImpl moimService;

	
	@RequestMapping("getMoim")
	public String getMoim(@RequestParam("mmNo") int mmNo, Model model) throws Exception{
		
		System.out.println("getUser :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		Moim moim = moimService.getMoim(mmNo);
		System.out.println(moim);
		
		model.addAttribute("moim", moimService.getMoim(mmNo));
		return "forward:vv";
	}

}
