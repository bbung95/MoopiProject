package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.meeting.MeetingDao;
import com.moopi.mvc.service.meeting.impl.MeetingServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.User;

@SpringBootTest
public class MeetingTest {

	@Autowired
	private MeetingServiceImpl meetingService;
	
//	@Autowired
//	private UserServiceImpl userService;
	
	
//	@Test
//	public void applyMeeting() throws Exception {
//		System.out.println("apply Meeting");
//		meetingService.applyMeeting(1001, "user02");
//	}
	
//	@Test
//	public void leaveMeeting() throws Exception{
//		System.out.println("::leave Meeting::");
//		meetingService.leaveMeeting(1001, "user02");
//	}
//	
	@Test
	public void getMEFLList() throws Exception {
		System.out.println("::MEFLLIST::");
		Map map = meetingService.getMEFLList(1001);
		System.out.println(map.get("list"));		
	}
	
//	@Test
//	public void getMeeting() throws Exception {
//		System.out.println("Test GetMeeting:::");
//		Meeting meeting = meetingService.getMeeting(1001);
//		System.out.println(meeting);
//	}
	
//	@Test
//	public void addMeeting() throws Exception{
//		System.out.println("Test AddMeeting:::");
//		Meeting meeting = new Meeting();
//		meeting.setMmNo(1);
//		meeting.setMtName("야유회");
//		meeting.setMtContent("김밥은개인이준비");
//		meeting.setMtStart("2021-07-21 06:30:00");
//		meeting.setMtEnd("2021-07-21 14:20:00");
//		meeting.setMtMaxCount(20);
//		meeting.setMtCurrentCount(1);
//		meeting.setMtConstructor.userId("user01");
//		meeting.setMtAddr("도봉구");
//		meeting.setMtState(1);
//		meeting.setMtMapX(123123);
//		meeting.setMtMapY(8521546);
//		meetingService.addMeeting(meeting);
//		System.out.println(meeting);	
//	}
	
//	@Test
//	public void updateMeeting() throws Exception {
//		System.out.println("update meeting Start:::");
//		Meeting meeting = meetingService.getMeeting(2006);
//		meeting.setMtName("전국대회 8강");
//		meeting.setMtContent("심판을 매수할 것입니다.");
//		meeting.setMtMaxCount(11);
//		meetingService.updateMeeting(meeting);
//	}
	
//	@Test
//	public void getMeetingList() throws Exception {
//		System.out.println("getMeetingList STart:::");
//		Map map = (meetingService.getMeetingList(1));
//		System.out.println(map.get("list"));
//	}
	
}
