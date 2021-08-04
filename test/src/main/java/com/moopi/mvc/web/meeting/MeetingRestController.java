package com.moopi.mvc.web.meeting;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.MeetingFlashMember;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.meeting.impl.MeetingService;

@RestController
@RequestMapping("/meeting/*")
public class MeetingRestController {
	
	
	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private CommonService commonService;
	
	public MeetingRestController() {
		System.out.println(this.getClass());
	}
	
		
		//정모상세조회
		@RequestMapping("json/getMeeting/{mtNo}/{userId}")
		public Map<String , Object> getMeeting(@PathVariable("mtNo") int mtNo, @PathVariable("userId") String userId) throws Exception{
			
			System.out.println("getMeeting :::");
			Meeting meeting = meetingService.getMeeting(mtNo);
			String start2 = meeting.getMtStart();
			String a = start2.substring(0,10);
			String b = start2.substring(11,19);
			String start3 = a+"T"+b;
			meeting.setMtStart2(start3);
			
			String end2 = meeting.getMtEnd();
			String c = end2.substring(0,10);
			String d = end2.substring(11,19);
			String end3 = c+"T"+d;
			meeting.setMtEnd2(end3);
			
			// 한번도 가입하지 않은 유저
			int check = 1;
			MeetingFlashMember mefl = meetingService.getMFEL(mtNo , userId);
			System.out.println("ddsdsdads" +mefl);
			if(mefl != null) {
				if(mefl.getJoinState() == 1) {
					// 가입상태 유저
					check = 2;
				}else {
					// 가입취소한 유저
					check = 3;
				}
			}
					
			Map<String ,Object> map = new HashMap<String,Object>();
			map.put("meeting", meeting);
			map.put("check", check);
			
			
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
			System.out.println(meeting);
			return map;
		}
		
		//정모수정
		@RequestMapping("json/updateMeeting/")
		public String updateMeeting(@ModelAttribute("meeting") Meeting meeting,
				Model model) throws Exception{
			
			System.out.println("updateMeeting :::");
			System.out.println(meeting);
			//User user = userService.getUser(userId);
			//meeting.setMtConstructor(user);
			meetingService.updateMeeting(meeting);
			model.addAttribute("meeting", meeting);
			int mmNo = meeting.getMmNo();
			return "redirect:/meeting/listMeeting";
		}
		
		
		@RequestMapping("json/applyMeeting/{mmNo}/{mtNo}/{userId}")
		public Meeting applyMeeting(@PathVariable("mmNo") int mmNo, @PathVariable("mtNo") int mtNo,
				@PathVariable("userId") String userId) throws Exception {
			System.out.println("정모에 참가합니다.");
			
			meetingService.applyMeeting(mtNo, userId);
			
			// 알림
			System.out.println("applyMeeting Notice");
			Meeting meeting = meetingService.getMeeting(mtNo);
			Notice notice = new Notice();
			Moim moim = new Moim();
			User user = new User();
			user.setUserId(userId);			
			moim.setMmNo(mmNo);
			notice.setNoticeUser(user);
			notice.setToUserId(meeting.getMtConstructor().getUserId()); // 알림대상
			notice.setNoticeContent("님이 정모에 참가했습니다");
			notice.setMoim(moim);
			notice.setNoticeType("3");
			commonService.addNotice(notice);
			//
			
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
		public Map<String, Object> getListMEFL(@PathVariable("mtNo") int mtNo, Model model) throws Exception {
			
			System.out.println("정모참가자명단을 보겠습니다.");
			Map<String, Object> map = meetingService.getMEFLList(mtNo);
			model.addAttribute("list", map.get("list"));
			return map;
		}
		
		
		//정모 지도 Ajax 통신
		@RequestMapping("/json/mapView")
		public String getMapView(@RequestParam("mtContent")String mtContent, @RequestParam("mtAddr")String mtAddr, @RequestParam("lat") String lat, @RequestParam("lng")String lng, Model model) throws Exception{
			model.addAttribute("lat", lat);
			model.addAttribute("lng", lng);
			model.addAttribute("mtAddr", mtAddr);
			model.addAttribute("mtContent", mtContent);
			System.out.println("맵을 표시한다.");
				return "moim/mapView";	
		}
		

}
