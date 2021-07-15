package com.moopi.mvc.web.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.meeting.impl.MeetingServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;

@RestController
@RequestMapping("/meeting/*")
public class MeetingRestController {
	
	
	@Autowired
	private MeetingServiceImpl meetingService;
	
	@Autowired
	private MoimServiceImpl moimService;
	
	public MeetingRestController() {
		System.out.println(this.getClass());
	}
	
	//정모상세조회
		@RequestMapping("json/getMeeting/{mtNo}")
		public Meeting getMeeting(@PathVariable("mtNo") int mtNo) throws Exception{
			
			System.out.println("getMeeting :::");
//			System.out.println(userId);
//			System.out.println(userMapper.getUser(userId));
			System.out.println(meetingService.getMeeting(mtNo));
			return meetingService.getMeeting(mtNo);
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

}
