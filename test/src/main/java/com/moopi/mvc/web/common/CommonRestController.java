package com.moopi.mvc.web.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@RestController
@RequestMapping("/common/*")
public class CommonRestController {
	
	@Autowired
	private CommonServiceImpl commonService;
	@Autowired
	private MoimServiceImpl moimService;
	@Autowired
	private FlashServiceImpl flashService;
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private UserServiceImpl userService;
	
	@GetMapping(value="json/addNotice/{target}/{content}/{userId}/{type}")
	public void addNotice(@PathVariable("target") String target, @PathVariable("content") String content,
							@PathVariable("userId") String userId,@PathVariable("type")String type) {
		System.out.println("addNotice : GET");
		Notice notice = new Notice();
		notice.setNoticeTarget(target);
		notice.setNoticeContent(content);
		notice.setToUserId(userId);
		notice.setNoticeType(type);
		System.out.println(notice);
		commonService.addNotice(notice);
	}
	
//	@PostMapping(value="json/addNotice")
//	public void addNotice(@RequestBody Notice notice) {
//		System.out.println("addNotice : POST");
//		System.out.println(notice);
//		commonService.addNotice(notice);
//	}
	
	@GetMapping(value="json/getNoticeCount/{userId}")
	public int getNoticeCount(@PathVariable("userId") String userId) {
		
		System.out.println("/getNoticeCount : GET");
		return commonService.getNoitceCount(userId);
	}
	
	@GetMapping(value="json/getListNotice/{userId}")
	public List getListNotice(@PathVariable("userId") String userId){
		
		System.out.println("/getListNotice : GET");
		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(5);
		return commonService.getListNotice(search, userId);
	}
	
	@GetMapping(value="json/updateNoticeState/{userId}")
	public void updateNoticeState(@PathVariable("userId") String userId) {
		
		System.out.println("updateNoticeState : GET");
		commonService.updateNotice(userId);
	}
	
	@GetMapping(value="json/deleteNotice/{noticeNo}")
	public void deleteNotice(@PathVariable("noticeNo")int noticeNo) {
		
		System.out.println("deleteNotice : GET");
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("noticeNo", noticeNo);
		commonService.deleteNotice(map);
	}
	
	@GetMapping(value="json/deleteNoticeAll/{userId}")
	public void deleteNoticeAll(@PathVariable("userId")String userId) {
		
		System.out.println("deleteNoticeAll : GET");
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("userId", userId);
		commonService.deleteNotice(map);
	}
	
	@PostMapping(value="json/searchList/{searchType}")
	public Map<String, Object> getSearchList(@RequestBody Search search, @PathVariable("searchType") int searchType ) throws Exception {
		
		System.out.println("SearchList : POST");
		
		if(searchType == 1) {
			System.out.println("Moim List");
			return moimService.getMoimList(search);
		}else if(searchType == 2) {
			System.out.println("Flash List");
			return flashService.getFlashList(search);
		}else if(searchType == 3) {
			System.out.println("Posting List");
			return boardService.getBoardList(null);
		}else {
			System.out.println("User List");
			return userService.getUserList(search);
		}
		
	}
}
