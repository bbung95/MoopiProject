package com.moopi.mvc.web.moim;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moopi.mvc.common.Page;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/moim/*")
public class MoimController {
	// 주석

	@Autowired
	private MoimServiceImpl moimService;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private CommonServiceImpl commonService;

	@Autowired
	private BoardServiceImpl boardService;

	@Autowired
	private ReplyServiceImpl replyService;

	@Value("${page.pageUnit}")
	int pageUnit;

	@Value("${page.pageSize}")
	int pageSize;

	private Board board;

	private Reply reply;

	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().substring(0,
			ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
			+ "src/main/resources/static/images/uploadFiles";

	// 모임상세조회
	@RequestMapping("getMoim")
	public String getMoim(@RequestParam("mmNo") int mmNo, Model model) throws Exception {

		System.out.println("getMoim :::");
//		System.out.println(userId);
//		System.out.println(userMapper.getUser(userId));
		Moim moim = moimService.getMoim(mmNo);
		Map map = moimService.getMemberList(mmNo, 2);
		System.out.println("모임정보:::" + moim);
		System.out.println("모임의멤버리스트:::" + map);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("moim", moimService.getMoim(mmNo));
		return "moim/getMoim";
	}

	// 모임생성페이지창, 단순네비게이션
	@RequestMapping("addMoimView")
	public String addMoimView(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("addMoimView...");
		model.addAttribute("userId", userId);
		return "moim/addMoimView";
	}

	// 모임생성 B/L 실행 -> 생성자를 바로 모임장으로 넣어주기 위해 newApply 메서드 추가함
	@RequestMapping("addMoim")
	public String addMoim(@ModelAttribute("moim") Moim moim, MultipartFile uploadFile, Model model,
			@RequestParam("userId") String userId) throws Exception {
		System.out.println("모임을생성할게");
		String oriFileName = uploadFile.getOriginalFilename();
		System.out.println(oriFileName);
		long currentTime = System.currentTimeMillis();
		try {
			uploadFile.transferTo(new File(saveDir + "/" + currentTime + oriFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		moim.setMmFile(currentTime + oriFileName);
		User user = userService.getUser(userId);
		moim.setMmConstructor(user);
		moimService.addMoim(moim);
		System.out.println("방금생성한 모임의 mmNO::::" + moim.getMmNo());
		moimService.newApplyMoim(userId, moim.getMmNo());
		System.out.println("생성자를 해당 모임의 모임장으로 설정 완료");
		System.out.println("모임생성완료");
		return "forward:/moim/listMoim";
	}

	// 방금 모임을 생성한 유저를 그 모임의 모임장으로 만드는 메서드...
//	@RequestMapping("newApply")
//	public String newApply(Model model) throws Exception{
//		System.out.println(":::::::뉴어플라이에 도착했을까:::::::");
//		String userId = (String)model.getAttribute("userId");
//		System.out.println("유저아이디값 : "+userId);
//		String mmName = (String)model.getAttribute("mmName");
//		System.out.println("모임명:" +mmName);
//		Moim moim = moimService.getMoim2(mmName);
//		System.out.println("::::::::::::뉴어플라이에서 찾은 모임남바 : "+moim.getMmNo());
//		moimService.newAplyMoim(userId, moim.getMmNo());
//		return "redirect:/moim/listMoim";
//	}

	// 모임수정페이지로 이동, 단순네비게이션
	@RequestMapping("updateMoimView")
	public String updateMoimView(@RequestParam("mmNo") int mmNo, Model model) {
		Moim moim = moimService.getMoim(mmNo);
		model.addAttribute("moim", moim);
		return "moim/updateMoimView";
	}

	// 모임수정 B/L 실행
	@RequestMapping("updateMoim")
	public String updateMoim(@ModelAttribute("moim") Moim moim, MultipartFile uploadFile,
			@RequestParam("userId") String userId) throws Exception {

		System.out.println("모임을수정할게");
		System.out.println("폼에서보내준모임값:::::" + moim);
		System.out.println("폼에서보내준 모임의 생성자:::" + moim.getMmConstructor());
		long currentTime = System.currentTimeMillis();
		if (uploadFile.getSize() > 0) {
			try {
				System.out.println("수정할파일이있는경우");
				String oriFileName = uploadFile.getOriginalFilename();
				System.out.println("오리지널파일명::::::: " + oriFileName);
				moim.setMmFile(currentTime + oriFileName);
				uploadFile.transferTo(new File(saveDir + "/" + currentTime + oriFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		User user = userService.getUser(userId);
		moim.setMmConstructor(user);
		moimService.updateMoim(moim);
		int mmNo = moim.getMmNo();
		System.out.println("모임수정완료");
		return "redirect:/moim/getMoim?mmNo=" + mmNo;
	}

	// 모임리스트 가져오기 토탈카운트 포함
	@RequestMapping("listMoim")
	public String getListMoim(@ModelAttribute("search") Search search, @RequestParam("userId") String userId,
			Model model) throws Exception {

		System.out.println("모임리스트를 가져옵니다.");

//		search.setCurrentPage(100);
//		search.setPageSize(pageSize);
//		System.out.println(pageSize);

//		Map<String, Object> map = moimService.getMoimList(search);
//		model.addAttribute("list", map.get("list"));

		Map<String, Object> map2 = moimService.getMyMoimList(userId);
		model.addAttribute("list2", map2.get("list2"));
		model.addAttribute("search", search);
		model.addAttribute("interest" , commonService.getInterest());		
		System.out.println("내가 가입한 모임:" + map2);
		System.out.println("forward:/moim/moimMain 으로 이동합니다.");
		return "moim/moimMain";
	}

	@RequestMapping("myListMoim")
	public String getMyListMoim(@RequestParam("userId") String userId, Model model) throws Exception {

		System.out.println("내가 가입한 모임리스트를 가져옵니다.");
		Map<String, Object> map = moimService.getMyMoimList(userId);
		model.addAttribute("list2", map.get("list2"));

		System.out.println("forward:/moim/myMoimMain 으로 이동합니다.");
		return "moim/myMoimMain";
	}

	// 초대리스트 가져오기
	@RequestMapping("listInvite")
	public String getListInvite(@RequestParam("mmNo") int mmNo, Search search, Model model) throws Exception {

		System.out.println("초대리스트를 가져옵니다.");
		Moim moim = moimService.getMoim(mmNo);
		int mmInterest = moim.getMmInterest();
		String mmAddr = moim.getMmAddr();
		// Map<String, Object> map = moimService.getMoimList(search);
		Map<String, Object> map = moimService.getInviteList(mmInterest, mmAddr);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("moim", moim);
		return "moim/listInvite";
	}

	// 모임 가입신청하기
//	@RequestMapping("applyMoim")
//	public String applyMoim(@RequestParam("userId") String userId,
//	@RequestParam("mmNo") int mmNo, Member member) throws Exception {
//		System.out.println("모임 가입신청을 합니다.");
//		member.setMmUser(null);
//		moimService.applyMoim(userId, mmNo);
//		return "forward:/moim/getMoim";
//	}

	// 모임 탈퇴하기
	@RequestMapping("leaveMoim")
	public String leaveMoim(@RequestParam("userId") String userId, @RequestParam("mmNo") int mmNo) throws Exception {
		System.out.println("모임 가입탈퇴를 합니다.");
		moimService.leaveMoim(userId, mmNo);
		moimService.subCount(mmNo);
		return "forward:모임상세조회페이지";
	}

//	//가입신청 거절하기
//	@RequestMapping("refuseApply")
//	public String refuseApply(@RequestParam("memberNo") int memberNo,
//			@RequestParam("mmNo") int mmNo) throws Exception {
//		System.out.println("가입신청을 거절 합니다.");
//		moimService.refuseApply(memberNo);
//		return "redirect:/moim/listMember?mmNo="+mmNo+"&status=1";
//	}

	// 멤버 권한변경(가입신청수락, 매니저권한위임및박탈)
	@RequestMapping("updateMember")
	public String updateMember(@RequestParam("userId") String userId, @RequestParam("mmNo") int mmNo,
			@RequestParam("status") int status) throws Exception {
		System.out.println("멤버 권한변경을 합니다.");
		moimService.updateMemeber(userId, mmNo, status);
		if (status == 1) {
			moimService.addCount(mmNo);
		}
		
		return "redirect:/moim/listMember?mmNo="+mmNo+"&status="+status;

	}

	// 멤버 리스트 조회하기
	@RequestMapping("listMember")
	public String getListMember(@RequestParam("mmNo") int mmNo, @RequestParam("status") int status, Model model)
			throws Exception {

		System.out.println("멤버리스트를 가져옵니다.");
		Moim moim = moimService.getMoim(mmNo);
		model.addAttribute("moim", moim);
		Map<String, Object> map = moimService.getMemberList(mmNo, status);
		model.addAttribute("list", map.get("list"));
		if (status == 1) {
			return "moim/listApply";
		} else {
			return "moim/listMember";
		}
	}

	/*
	 * @RequestMapping("map") public String getMap() throws Exception {
	 * 
	 * System.out.println("맵을 연다."); return "moim/map"; }
	 * 
	 * @RequestMapping("mapView") public String
	 * getMapView(@RequestParam("mtContent") String
	 * mtContent, @RequestParam("mtAddr") String mtAddr,
	 * 
	 * @RequestParam("lat") String lat, @RequestParam("lng") String lng, Model
	 * model) throws Exception { model.addAttribute("lat", lat);
	 * model.addAttribute("lng", lng); model.addAttribute("mtAddr", mtAddr);
	 * model.addAttribute("mtContent", mtContent); System.out.println("맵을 표시한다.");
	 * return "moim/mapView"; }
	 */

	@RequestMapping("listMoimBoard")
	public String getMoimBoardList(@ModelAttribute("search") Search search,
			@ModelAttribute("boardMoimNo") int boardMoimNo, Model model) throws Exception {

		System.out.println(search.toString() + boardMoimNo);

		Moim moim = moimService.getMoim(boardMoimNo);
		String boardCategory = null;
		Map map = new HashMap();

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		map = boardService.getBoardList(search, "4", "1", boardMoimNo);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("boardMoimNo", boardMoimNo);
		model.addAttribute("moim", moim);
		return "/moim/listMoimBoard";
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(@ModelAttribute("board") Board board, Model model) throws Exception {

		System.out.println("deleteMoimBoard 실행");
		board = boardService.getBoard(board.getBoardNo());
		board.setBoardState("2");
		boardService.deleteBoard(board);

		model.addAttribute("boardMoimNo", board.getBoardMoimNo());

		return "forward:/moim/listMoimBoard?boardMoimNo=" + board.getBoardMoimNo();

	}

	@RequestMapping("getBoard")
	public String getBoard(@ModelAttribute("boardNo") int boardNo, Model model) throws Exception {

		System.out.println("getMoimBoard ::");
		board = boardService.getBoard(boardNo);

		int mmNo = board.getBoardMoimNo();
		Moim moim = moimService.getMoim(mmNo);
		model.addAttribute("moim", moim);

		if (board.getBoardCategory() != "1") {
			List<Reply> list = replyService.getReplyList(boardNo);
			model.addAttribute("list", list);
		}
		model.addAttribute("board", board);

		String boardCategory = boardService.getBoardCategory(board.getBoardCategory());
		System.out.println("보드카테고리값:" + boardCategory);

		return "/moim/getMoimBoard";
	}

	@RequestMapping("addBoardView")
	public String addBoardView(@ModelAttribute("boardMoimNo") int boardMoimNo, Model model) {
		Moim moim = moimService.getMoim(boardMoimNo);
		model.addAttribute("moim", moim);
		model.addAttribute("boardMoimNo", boardMoimNo);

		return "/moim/addMoimBoardView";
	}

	@RequestMapping("addBoard")
	public String addBoard(@ModelAttribute("board") Board board, Model model) throws Exception {

		System.out.println("board 값 : " + board);
		System.out.println("model 값 : " + model);

		boardService.addBoard(board);
		System.out.println(board.getBoardNo());
		String boardCategory = boardService.getBoardCategory(board.getBoardCategory());

		return "forward:/moim/getBoard?boardNo=" + board.getBoardNo();

	}

	@RequestMapping("updateView")
	public String updateBoardView(@ModelAttribute("board") Board board, Model model) throws Exception {
		System.out.println("updateBoardView.jsp 실행");
		System.out.println("1번째 model " + model);
		System.out.println("1번째 board " + board);

		board = boardService.getBoard(board.getBoardNo());
		System.out.println(board);
		model.addAttribute("board", board);

		String boardCategory = boardService.getBoardCategory(board.getBoardCategory());
		System.out.println("보드카테고리값:" + boardCategory);
		return "/moim/updateMoimBoardView";

	}

	@RequestMapping("updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board, Model model) throws Exception {

		System.out.println("updateBoard실행");

		System.out.println("board값 체크" + board);
		System.out.println("model값 체크" + model);

		boardService.updateBoard(board);

		return "forward:/moim/getBoard?boardNo=" + board.getBoardNo();
	}

}
