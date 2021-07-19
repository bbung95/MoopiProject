package com.moopi.mvc.web.meeting;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.meeting.impl.MeetingServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@RestController
@RequestMapping("/meeting/*")
public class MeetingRestController {
	
	
	@Autowired
	private MeetingServiceImpl meetingService;
	
	@Autowired
	private MoimServiceImpl moimService;
	
	@Autowired
	private UserServiceImpl userService;
	
	public MeetingRestController() {
		System.out.println(this.getClass());
	}
	
		
		//정모상세조회
		@RequestMapping("json/getMeeting/{mtNo}")
		public Meeting getMeeting(@PathVariable("mtNo") int mtNo) throws Exception{
			
			System.out.println("getMeeting :::");
//			System.out.println(userId);
//			System.out.println(userMapper.getUser(userId));
//			System.out.println(meetingService.getMeeting(mtNo));
//			Meeting meeting = meetingService.getMeeting(mtNo);
//			String start2 = meeting.getMtStart();
//			String a = start2.substring(0,10);
//			String b = start2.substring(11,19);
//			String start3 = a+"T"+b;
//			System.out.println("스타트3의값:"+start3);
//			meeting.setMtStart2(start3);
//			
//			String end2 = meeting.getMtEnd();
//			String c = end2.substring(0,10);
//			String d = end2.substring(11,19);
//			String end3 = c+"T"+d;
//			System.out.println("엔드3의값:"+end3);
//			meeting.setMtEnd2(end3);
			return meetingService.getMeeting(mtNo);
		}
		
		//정모수정
		@RequestMapping("json/updateMeeting/")
		public String updateMeeting(@ModelAttribute("meeting") Meeting meeting,
				Model model) throws Exception{
			
			System.out.println("addMeeting :::");
			System.out.println(meeting);
			//User user = userService.getUser(userId);
			//meeting.setMtConstructor(user);
			meetingService.updateMeeting(meeting);
			model.addAttribute("meeting", meeting);
			int mmNo = meeting.getMmNo();
			return "redirect:/meeting/listMeeting";
		}
		
		
		@RequestMapping("json/applyMeeting/{mtNo}/{userId}")
		public Meeting applyMeeting(@PathVariable("mtNo") int mtNo,
				@PathVariable("userId") String userId) throws Exception {
			System.out.println("정모에 참가합니다.");
			
			meetingService.applyMeeting(mtNo, userId);
			return meetingService.getMeeting(mtNo);
		}
		
		@RequestMapping("json/leaveMeeting/{mtNo}/{userId}")
		public Meeting leaveMeeting(@PathVariable("mtNo") int mtNo,
				@PathVariable("userId") String userId) throws Exception {
			System.out.println("정모 참가를 취소합니다.");
			
			meetingService.leaveMeeting(mtNo, userId);
			return meetingService.getMeeting(mtNo);
		}
	
		//정모 참가자 명단 조회
		@RequestMapping("json/listMEFL/{mtNo}")
		public Map getListMEFL(@PathVariable("mtNo") int mtNo, Model model) throws Exception {
			
			System.out.println("정모참가자명단을 보겠습니다.");
			Map<String, Object> map = meetingService.getMEFLList(mtNo);
			model.addAttribute("list", map.get("list"));
			return map;
		}

}
