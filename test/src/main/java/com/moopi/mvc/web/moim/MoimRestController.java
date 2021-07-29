package com.moopi.mvc.web.moim;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.User;

@RestController
@RequestMapping("/moim/*")
public class MoimRestController {

	@Autowired
	private MoimServiceImpl moimService;

	@Autowired
	private CommonServiceImpl commonService;
	

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

	@RequestMapping("json/listMoim/{userId}")
	public Map getMyListMoim(@PathVariable("userId") String userId, Model model) throws Exception {

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

	// 가입신청수락하기
	@PostMapping("json/acceptApplyMoim")
	public String acceptApplyMoim(@RequestBody Member member) throws Exception {
		System.out.println("모임 가입신청을 수락합니다.");
		moimService.updateMemeber(member.getMmUser().getUserId(), member.getMmNo(), 1);
		return "apply";
	}
	
	// 가입신청하기
		@PostMapping("json/applyMoim")
		public String applyMoim(@RequestBody Member member) throws Exception {
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
