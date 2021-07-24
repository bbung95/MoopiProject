package com.moopi.mvc.web.moim;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;

@RestController
@RequestMapping("/moim/*")
public class MoimRestController {
	
	@Autowired
	private MoimServiceImpl moimService;
	
	public MoimRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("json/checkMember/{userId}/{mmNo}")
	public Member checkMember(@PathVariable("userId") String userId,
			@PathVariable("mmNo") int mmNo) throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");
		System.out.println("//////////맵퍼에서보내준값:"+moimService.checkMember(userId, mmNo));
		if(moimService.checkMember(userId, mmNo) == null) {
			Member member = new Member();
			member.setMemberRole(9);
			return member;
		}else {
			return moimService.checkMember(userId, mmNo);
		}			
	}
	
	 
	@RequestMapping("json/listMoim/{userId}")
	public Map getMyListMoim(@PathVariable("userId") String userId, Model model) throws Exception{
		
		System.out.println("Ajax로 모임리스트를 가져옵니다.");
		Search search = new Search();
		Map<String, Object> map = moimService.getMoimList(search);
		model.addAttribute("list3", map.get("list3"));
		return map;
	}
	
	@RequestMapping("json/test")
	public String Test() throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");
		
		return "테스트성공";
	}
	

}
