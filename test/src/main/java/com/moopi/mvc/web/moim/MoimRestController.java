package com.moopi.mvc.web.moim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.domain.Member;

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
	
	@RequestMapping("json/test")
	public String Test() throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");
		
		return "테스트성공";
	}
	

}
