package com.moopi.mvc.web.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moopi.mvc.service.board.impl.BoardService;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.reply.impl.ReplyService;
import com.moopi.mvc.service.user.impl.UserService;

@Controller
@RequestMapping("/report/*")
public class ReportController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private UserService userService;

	@Autowired
	private MoimServiceImpl moimService;

	public Report report;

	public Board board;

	public Reply reply;

	public User user;

	public Moim moim;

	@RequestMapping("addReportView")
	public String addReportView(@ModelAttribute("report") Report report, Model model) throws Exception {

		System.out.println("addReportView 시작");

		System.out.println(report);

		if (report.getReportCategory().equals("1")) {

			board = boardService.getBoard(report.getReportTargetBd().getBoardNo());
			model.addAttribute(board);
			model.addAttribute("reportCategory", "1");
			System.out.println(board);
		} else if (report.getReportCategory().equals("2")) {

			reply = replyService.getReply(report.getReportTargetRe().getReplyNo());
			model.addAttribute(reply);
			model.addAttribute("reportCategory", "2");
			System.out.println(reply);
		} else if (report.getReportCategory().equals("3")) {

			user = userService.getUser(report.getReportTarget().getUserId());
			model.addAttribute(user);
			model.addAttribute("reportCategory", "3");
			System.out.println(user);
		} else if (report.getReportCategory().equals("4")) {

			moim = moimService.getMoim(report.getReportTargetMm().getMmNo());
			model.addAttribute(moim);
			model.addAttribute("reportCategory", "4");
			System.out.println(moim);
		}

		return "report/addReportView";

	}

//	@RequestMapping("listReport")
//	public String getReportList(@ModelAttribute("search")Search search, Model model) throws Exception{
//		
//		System.out.println("listReport 실행");
//		
//		Map map = new HashMap();
//		
//		map = reportService.getReportList(search, model);
//		System.out.println(map.get("list"));
//		
//		model.addAttribute("list", map.get("list"));
//		
//		return "report/listReport";
//	}

//	@RequestMapping(method = RequestMethod.POST, path = "processReport")
//	public String processReport(@ModelAttribute Report report, Model model) throws Exception{
//		
//		System.out.println("11processReport 실행");
//		System.out.println(model );
//		System.out.println("11report 값 체크 ========="+report); 
//		System.out.println(report.getReportNo());
//		reportService.processReport(report);
//		User user = new User();
//		
//		System.out.println("1report 값 체크 ========"+report);
//		
//		if(report.getReportResultState() != "1" && report.getReportTargetBd().getBoardNo() != 0 ) {
//			System.out.println("resultState값 체크"+ report.getReportResultState());
//			boardService.deleteBoard2(report.getReportTargetBd());
//			user = userService.getUser(report.getReportTargetBd().getBoardWriter().getUserId());
//			System.out.println("!!!!!!!!!!!!!!!!!!");
//			
//			if(report.getReportResultState().equals("3")){
//				System.out.println("if문 내부 시작");
//				
//				if(user.getUserRole().equals("2")) {
//					user.setUserRole("3");
//				}else if(user.getUserRole().equals("3")) {
//					user.setUserRole("4");
//				}
//				user.setStateReason(report.getStateReason());
//				user.setStateRegdate(report.getReportResultUpdate());
//				System.out.println("user의 값 ==========="+user);
//				
//			}
//			userService.updateUserRole(user);
//			
//		}else if(report.getReportResultState() != "1" && report.getReportTargetRe().getReplyNo() != 0 ) {
//			
//			replyService.deleteReply2(report.getReportTargetRe());
//			user = userService.getUser(report.getReportTargetRe().getReplyWriter().getUserId());
//			if(report.getReportResultState().equals("3")){
//				
//				
//				if(user.getUserRole().equals("2")) {
//					user.setUserRole("3");
//				}else if(user.getUserRole().equals("3")) {
//					user.setUserRole("4");
//				}
//				user.setStateReason(report.getStateReason());
//				user.setStateRegdate(report.getReportResultUpdate());
//				
//			}
//			userService.updateUserRole(user);
//		}else if(report.getReportResultState() != "1" && report.getReportTarget() != null ) {
//			
//			user = userService.getUser(report.getReportTarget().getUserId());
//			if(report.getReportResultState().equals("3")){
//				
//				if(user.getUserRole().equals("2")) {
//					user.setUserRole("3");
//				}else if(user.getUserRole().equals("3")) {
//					user.setUserRole("4");
//				}
//				user.setStateReason(report.getStateReason());
//				user.setStateRegdate(report.getReportResultUpdate());
//				
//				}
//				userService.updateUserRole(user);
//				
//			}else if(report.getReportResultState() != "1" && report.getReportTargetMm().getMmNo() != 0 ) {
//				
//				moim = moimService.getMoim(report.getReportTargetMm().getMmNo());
//				
//				if(report.getReportResultState().equals("2")){
//					
//					moim.setMmState(3);
//					
//					moimService.updateReportMoim(moim);
//					
//				}	
//			
//			}
//		
//		return "";
//	}

	@RequestMapping("getReportBoard")
	public String getReportBoard(@ModelAttribute("boardNo") int boardNo, Model model) throws Exception {

		board = boardService.getBoard(boardNo);

		List<Reply> list = replyService.getReplyListAdmin(boardNo);

		model.addAttribute("board", board);
		model.addAttribute("list", list);

		return "report/getReportBoard";

	}

//	
//	
//	@RequestMapping("blindBoard")
//	public String blindBoard(@ModelAttribute("board")Board board, Model model) throws Exception{
//		
//		
//		
//		return null;
//	}

}
