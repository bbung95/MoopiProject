package com.moopi.mvc.web.moim;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/moim/*")
public class MoimController {
	
	@Autowired
	private MoimServiceImpl moimService;

	@Autowired
	private UserServiceImpl userService;
	
	public static final String saveDir = "C:\\Users\\bit\\git\\Test\\test\\src\\main\\resources\\static\\images\\uploadFiles";
	
	//모임상세조회
	@RequestMapping("getMoim")
	public String getMoim(@RequestParam("mmNo") int mmNo, Model model) throws Exception{
		
		System.out.println("getMoim :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		Moim moim = moimService.getMoim(mmNo);
		System.out.println(moim);
		
		model.addAttribute("moim", moimService.getMoim(mmNo));
		return "moim/getMoim";
	}
	
	//모임생성페이지창, 단순네비게이션
	@RequestMapping("addMoimView")
	public String addMoimView(@RequestParam("userId") String userId, Model model) throws Exception{
		
		System.out.println("addMoimView...");
		model.addAttribute("userId", userId);
		return "moim/addMoimView";
}
	
	//모임생성 B/L 실행
	@RequestMapping("addMoim")
	public String addMoim(@ModelAttribute("moim") Moim moim
			,MultipartFile uploadFile,
			@RequestParam("userId") String userId) throws Exception{
		System.out.println("모임을생성할게");
		String oriFileName = uploadFile.getOriginalFilename();
		System.out.println(oriFileName);
		long currentTime = System.currentTimeMillis();
		try {
			uploadFile.transferTo(new File(saveDir+"/"+currentTime+oriFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		moim.setMmFile(currentTime+oriFileName);
		User user = new User();
		user.setUserId(userId);
		moim.setMmConstructor(user);
		moimService.addMoim(moim);
		System.out.println("모임생성완료");
		return "moim/listMoim";
	}
	
	//모임수정페이지로 이동, 단순네비게이션
	@RequestMapping("updateMoimView")
	public String updateMoimView(@RequestParam("mmNo") int mmNo, Model model) {
		Moim moim = moimService.getMoim(mmNo);
		model.addAttribute("moim", moim);
		return "moim/updateMoimView";
	}
	
	//모임수정 B/L 실행
	@RequestMapping("updateMoim")
	public String updateMoim(@ModelAttribute("moim") Moim moim,
							MultipartFile uploadFile,
							@RequestParam("userId") String userId) throws Exception {
		
		System.out.println("모임을수정할게");
		String oriFileName = uploadFile.getOriginalFilename();
		System.out.println(oriFileName);
		long currentTime = System.currentTimeMillis();
		try {
			uploadFile.transferTo(new File(saveDir+"/"+currentTime+oriFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		User user = new User();
		user.setUserId(userId);
		moim.setMmConstructor(user);
		moim.setMmFile(currentTime+oriFileName);
		moimService.updateMoim(moim);
		System.out.println("모임수정완료");
		return "redirect:/moim/listMoim";
	}
	
	
	//모임리스트 가져오기 토탈카운트 포함
	@RequestMapping("listMoim")
	public String getListMoim(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("모임리스트를 가져옵니다.");
		Map<String, Object> map = moimService.getMoimList(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		System.out.println("forward:/moim/moimMain 으로 이동합니다.");
		return "moim/moimMain";
	}
	
	//모임 가입신청하기
	@RequestMapping("applyMoim")
	public String applyMoim(@RequestParam("userId") String userId,
	@RequestParam("mmNo") int mmNo) throws Exception {
		System.out.println("모임 가입신청을 합니다.");
		moimService.applyMoim(userId, mmNo);
		return "forward:/moim/getMoim";
	}
	
	//모임 탈퇴하기
	@RequestMapping("leaveMoim")
	public String leaveMoim(@RequestParam("userId") String userId,
	@RequestParam("mmNo") int mmNo) throws Exception {
		System.out.println("모임 가입탈퇴를 합니다.");
		moimService.leaveMoim(userId, mmNo);
		return "forward:모임상세조회페이지";
	}
	
	@RequestMapping("refuseApply")
	public String refuseApply(@RequestParam("memberNo") int memberNo,
			@RequestParam("mmNo") int mmNo) throws Exception {
		System.out.println("가입신청을 거절 합니다.");
		moimService.refuseApply(memberNo);
		return "redirect:/moim/listMember?mmNo="+mmNo+"&status=1";
	}
	
	
	
	//멤버 권한변경(가입신청수락, 매니저권한위임및박탈)
	@RequestMapping("updateMember")
	public String updateMember(@RequestParam("userId") String userId,
	@RequestParam("mmNo") int mmNo,
	@RequestParam("status") int status) throws Exception {
		System.out.println("멤버 권한변경을 합니다.");
		moimService.updateMemeber(userId, mmNo, status);
		return "redirect:/moim/listMember?mmNo="+mmNo+"&status="+status;
	}
	
	//멤버 리스트 조회하기
	@RequestMapping("listMember")
	public String getListMember(@RequestParam("mmNo") int mmNo,
			@RequestParam("status") int status, Model model) throws Exception{
		
		System.out.println("멤버리스트를 가져옵니다.");
		Map<String, Object> map = moimService.getMemberList(mmNo, status);
		model.addAttribute("list", map.get("list"));
		if(status == 1) {
			return "moim/listApply";
		}
		return "forward:멤버리스트페이지로이동";
	}
	
}
