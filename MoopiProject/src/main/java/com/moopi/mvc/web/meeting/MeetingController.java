package com.moopi.mvc.web.meeting;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.meeting.impl.MeetingServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {

	@Autowired
	private MeetingServiceImpl meetingService;
	
	
	//정모상세조회
	@RequestMapping("getMeeting")
	public String getMoim(@RequestParam("mtNo") int mtNo, Model model) throws Exception{
		
		System.out.println("getMeeting :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		Meeting meeting = meetingService.getMeeting(mtNo);
		System.out.println(meeting);
		
		model.addAttribute("meeting", meeting);
		return "forward:정모상세조회페이지";
	}

}
