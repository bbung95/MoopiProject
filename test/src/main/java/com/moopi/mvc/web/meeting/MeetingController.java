package com.moopi.mvc.web.meeting;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.meeting.impl.MeetingServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {

	@Autowired
	private MeetingServiceImpl meetingService;
	
	@Autowired
	private UserServiceImpl userService;
	
	
	
	@RequestMapping("receiveCode")
	public String receiveCode(Model model) {
		return "meeting/receiveCode";
	}
	
	//정모상세조회
	@RequestMapping("getMeeting")
	public String getMeeting(@RequestParam("mtNo") int mtNo, Model model) throws Exception{
		
		System.out.println("getMeeting :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		Meeting meeting = meetingService.getMeeting(mtNo);
		System.out.println(meeting);
		
		model.addAttribute("meeting", meeting);
		return "forward:정모상세조회페이지";
	}
	
	//정모생성
	@RequestMapping("addMeeting")
	public String addMeeting(@ModelAttribute("meeting") Meeting meeting,
			@RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("addMeeting :::");
		System.out.println(meeting);
		User user = userService.getUser(userId);
		meeting.setMtConstructor(user);
		meetingService.addMeeting(meeting);
		meetingService.applyMeeting(meeting.getMtNo(), meeting.getMtConstructor().getUserId());
		model.addAttribute("meeting", meeting);
		System.out.println("정모No:"+meeting.getMtNo()+"주최자아이디:"+meeting.getMtConstructor().getUserId());
		return "forward:/meeting/listMeeting";
	}
	
	//정모수정
	@RequestMapping("updateMeeting")
	public String updateMeeting(@ModelAttribute("meeting") Meeting meeting,
			@RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("addMeeting :::");
		System.out.println(meeting);
		User user = userService.getUser(userId);
		meeting.setMtConstructor(user);
		meetingService.updateMeeting(meeting);
		model.addAttribute("meeting", meeting);
		int mmNo = meeting.getMmNo();
		return "redirect:/meeting/listMeeting?mmNo="+mmNo+"&userId="+userId;
	}
	
	//정모삭제, 실제 삭제는 아니고 MT_STATE를 3으로 변경하는것임.
	@RequestMapping("deleteMeeting")
	public String deleteMeeting(int mtNo, Model model, HttpSession session) throws Exception{
		System.out.println("deleteMeeting :::");
		meetingService.deleteMeeting(mtNo);
		Meeting meeting = meetingService.getMeeting(mtNo);
		model.addAttribute("mmNo", meeting.getMmNo());
		User user = (User)session.getAttribute("user");
		int mmNo = meeting.getMmNo();
		String userId = user.getUserId();
		
		return "forward:/meeting/listMeeting?mmNo="+mmNo+"&userId="+userId;
	}

	//정모 리스트 조회
	@RequestMapping("listMeeting")
	public String getListMeeting(@RequestParam("mmNo") int mmNo, @RequestParam("userId") String userId,
									Model model) throws Exception{
		
		System.out.println("모임리스트를 가져옵니다.");
		Map<String, Object> map = meetingService.getMeetingList(mmNo);
		model.addAttribute("list", map.get("list"));
		System.out.println(map);
		model.addAttribute("userId", userId);
		model.addAttribute("mmNo", mmNo);
		return "meeting/listMeeting";
	}
	
	//정모참가하기
	@RequestMapping("applyMeeting")
	public String applyMeeting(@RequestParam("mtNo") int mtNo,
			@RequestParam("userId") String userId) throws Exception {
		System.out.println("정모에 참가합니다.");
		meetingService.applyMeeting(mtNo, userId);
		return "forward:정모상세조회페이지로이동";
	}
	
	//정모참가취소하기
	@RequestMapping("leaveMeeting")
	public String leaveMeeting(@RequestParam("mtNo") int mtNo,
			@RequestParam("userId") String userId) throws Exception {
		System.out.println("정모참가를 취소합니다.");
		meetingService.leaveMeeting(mtNo, userId);
		return "forward:정모상세조회페이지로이동";
	}
	
	//정모 참가자 명단 조회
	@RequestMapping("listMEFL")
	public String getListMEFL(@RequestParam("mtNo") int mtNo, Model model) throws Exception {
		
		System.out.println("정모참가자명단을 보겠습니다.");
		Map<String, Object> map = meetingService.getMEFLList(mtNo);
		model.addAttribute("list", map.get("list"));
		return "forward:정모상세조회페이지로이동";
	}
	
	
}
