package com.moopi.mvc.web.moim;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.moim.impl.MoimService;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;

@RestController
@RequestMapping("/moim/*")
public class MoimRestController {

	@Autowired
	private MoimService moimService;

	@Autowired
	private CommonService commonService;
	

	@Value("6")
	private int pageSize;
	
	public MoimRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping("json/checkMember/{userId}/{mmNo}")
	public Member checkMember(@PathVariable("userId") String userId, @PathVariable("mmNo") int mmNo) throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");
		System.out.println("//////////맵퍼에서보내준값:" + moimService.checkMember(userId, mmNo));
		if (moimService.checkMember(userId, mmNo) == null) {
			Member member = new Member();
			member.setMemberRole(9);
			return member;
		} else {
			return moimService.checkMember(userId, mmNo);
		}
	}

	@RequestMapping("json/inviteYou/{userId}/{mmNo}")
	public String inviteYou(@PathVariable("userId") String userId, @PathVariable("mmNo") int mmNo) throws Exception {
		
		Member member = new Member();
		User user = new User();
		user.setUserId(userId);
		member.setMmUser(user);
		member.setMmNo(mmNo);
		member.setMemberRole(7);
		moimService.applyMoim(member);
		System.out.println("초대완료");

		// 모임초대 알림
		Notice notice = new Notice();
		Moim moim = new Moim();
		moim.setMmNo(mmNo);
		notice.setToUserId(userId); // 알림대상
		notice.setNoticeType("9");
		notice.setMoim(moim);
		notice.setMember(member);
		commonService.addNotice(notice);

		return "초대성공";
	}

	@RequestMapping("json/listMoim")
	public Map<String, Object> getListMoim(@RequestBody Search search, Model model) throws Exception {

		System.out.println("Ajax로 모임리스트를 가져옵니다. :::인피니티스크롤");
		search.setPageSize(pageSize);
		System.out.println(search);
		
		Map<String, Object> map = moimService.getMoimList(search);
//		model.addAttribute("list3", map.get("list3"));
		model.addAttribute("list", map.get("list"));
		return map;
	}

	@RequestMapping("json/test")
	public String Test() throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");

		return "테스트성공";
	}
	
	@RequestMapping("json/updateMember/{userId}/{mmNo}/{status}")
	public void updateMember(@PathVariable("userId") String userId,
			@PathVariable("mmNo") int mmNo, @PathVariable("status") int status) throws Exception {
		System.out.println("::::::::::::::::::::::::::해당 유저 권한 확인중....");
		System.out.println("멤버권한변경한다.");
		moimService.updateMemeber(userId, mmNo, status);
		if(status==4) {
			moimService.subCount(mmNo);
		}

	}

	// 가입신청수락하기
	@PostMapping("json/acceptApplyMoim")
	public String acceptApplyMoim(@RequestBody Member member) throws Exception {
		System.out.println("모임 가입신청을 수락합니다.");
		moimService.updateMemeber(member.getMmUser().getUserId(), member.getMmNo(), member.getMemberRole());
		
		// 알림
		if(member.getMemberRole() == 1) {
			System.out.println("moim Notice");
			Notice notice = new Notice();
			Moim moim = new Moim();
			moim.setMmNo(member.getMmNo());
			notice.setToUserId(member.getMmUser().getUserId()); // 알림대상
			notice.setMoim(moim);
			notice.setNoticeType("4");
			commonService.addNotice(notice);
		}
		//
		
		return "apply";
	}
	
	// 가입신청하기
		@PostMapping("json/applyMoim")
		public String applyMoim(@RequestBody Member member) throws Exception {
			
			member.setMemberRole(1);
			moimService.applyMoim(member);
			System.out.println("가입완료");
			return "가입완료";
		}

	// 가입신청 거절하기
	@PostMapping("json/refuseApply")
	public String refuseApply(@RequestBody Member member) throws Exception {
		System.out.println("가입신청을 거절 합니다.");
		
		moimService.refuseApply(member.getMemberNo());
		return "refuseApply";
	}
}
