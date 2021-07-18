package com.moopi.mvc.web.meeting;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;


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
	
		//구글캘린더연동
		@RequestMapping("json/gCal/{mtNo}")
		public Meeting gCal(@PathVariable(required = false) int mtNo) throws Exception{
			
			System.out.println("구글캘린더에 일정을 추가합니다. :::");
			
			// HttpClient : Http Protocol �� client �߻�ȭ 
			HttpClient httpClient = new DefaultHttpClient();
			
			String url="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar.readonly&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fmeeting%2Fjson%2FgCal%2F&client_id=674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com";
					
			// HttpGet : Http Protocol �� GET ��� Request
			HttpGet httpGet = new HttpGet(url);
			httpGet.setHeader("Accept", "application/json");
			httpGet.setHeader("Content-Type", "application/json");
			
			// HttpResponse : Http Protocol ���� Message �߻�ȭ
			HttpResponse httpResponse = httpClient.execute(httpGet);
			
			
			//==> Response Ȯ��
			System.out.println("리스폰확인:"+httpResponse);
			System.out.println();

			//==> Response �� entity(DATA) Ȯ��
			HttpEntity httpEntity = httpResponse.getEntity();
			
			//==> InputStream ����
			InputStream is = httpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			
			System.out.println("서버데이터확인");
			String serverData = br.readLine();
			System.out.println(serverData);
			
			//==> �����б�(JSON Value Ȯ��)
			JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
			System.out.println(jsonobj);
			
//				System.out.println(userId);
//				System.out.println(userMapper.getUser(userId));
			System.out.println(meetingService.getMeeting(mtNo));
			return meetingService.getMeeting(mtNo);
		}
	
		
		
		//구글캘린더연동2, 토큰받기
		@RequestMapping("getToken")
		public String getToken() throws Exception{
			
			String url = "https://oauth2.googleapis.com/token";
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Content-Type", "application/json");
	
			
			
			return "성공하냐?";
		}
		
		//구글캘린더연동3, 캘린더에 인서트하기
		@RequestMapping("getCode")
		public String gCal2(@RequestParam("code") String code) throws Exception{
			
//			String url = "https://www.googleapis.com/calendar/v3/calendars/primary/events?key=AIzaSyAow_exiK7v12TdQlYOv1U-ttFlSpWlU2Q";
//			HttpPost httpPost = new HttpPost(url);
//			httpPost.setHeader("Accept", "application/json");
//			httpPost.setHeader("Content-Type", "application/json");
//			httpPost.setHeader("Authorization", " Bearer [YOUR_ACCESS_TOKEN]");
			System.out.println(code);
			HttpClient httpClient = new DefaultHttpClient();
			
			String url = "https://oauth2.googleapis.com/token";
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Content-Type", "application/json");
			
			JSONObject json = new JSONObject();
			json.put("code", code);
			json.put("client_id", "674136097926-gmjcrr1v85j17s88t3pi2fodfp72hvk9.apps.googleusercontent.com");
			json.put("client_secret", "aVM_EIcdkciwTwLtR7TjCQmg");
			json.put("redirect_uri", "http://localhost:8080/meeting/getCode");
			json.put("grant_type", "authorization_code");
			System.out.println("보내는데이터의제이슨값:"+json);
			HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");
			
			httpPost.setEntity(httpEntity01);
			HttpResponse httpResponse = httpClient.execute(httpPost);
			
			//==> Response 확인
			System.out.println(httpResponse);
			System.out.println("///////////////");
		
			//==> Response 중 entity(DATA) 확인
			HttpEntity httpEntity = httpResponse.getEntity();
			
			//==> InputStream 생성
			InputStream is = httpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			
			System.out.println("[ Server 에서 받은 Data 확인 ] ");
			String serverData = br.readLine();
			System.out.println(serverData);
			
			//==> 내용읽기(JSON Value 확인)
			JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
			System.out.println("제이슨값:"+jsonobj);
			
			return "엑세스토큰제발와줘";
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
