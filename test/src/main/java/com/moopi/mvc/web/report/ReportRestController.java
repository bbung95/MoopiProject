package com.moopi.mvc.web.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.board.impl.BoardService;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.impl.MoimService;
import com.moopi.mvc.service.reply.impl.ReplyService;
import com.moopi.mvc.service.report.impl.ReportService;
import com.moopi.mvc.service.user.impl.UserService;

@RestController
@RequestMapping("/report/json/*")
public class ReportRestController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MoimService moimService;
	
	
	public Report report;
	
	public Board board;
	
	public Reply reply;
	
	public User user;
	
	public Moim moim;
	
	public int userRole;
	
	public ReportRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@PostMapping(value="processReport")
	public Report processReport(@RequestBody Report report) throws Exception{
		
		System.out.println("processReport 실행");
		System.out.println("report 값 체크 ========="+report); 
		System.out.println(report.getReportNo());
		reportService.processReport(report);
		User user = new User();
		
		System.out.println("report 값 체크 ========"+report);
		
		if(report.getReportResultState() != "1" && report.getReportTargetBd().getBoardNo() != 0 ) {
			System.out.println("resultState값 체크"+ report.getReportResultState());
			boardService.deleteBoard2(report.getReportTargetBd());
			user = userService.getUser(report.getReportTargetBd().getBoardWriter().getUserId());
			System.out.println("if문 내부 boardProcess 실행");
			
			if(report.getReportResultState().equals("3")){
				System.out.println("if문 내부 시작");
				
				if(user.getUserRole().equals("2")) {
					user.setUserRole("3");
				}else if(user.getUserRole().equals("3")) {
					user.setUserRole("4");
				}
				user.setStateReason(report.getStateReason());
				user.setStateRegdate(report.getReportResultUpdate());
				System.out.println("user의 값 ==========="+user);
				
			}
			userService.updateUserRole(user);
			
		}else if(report.getReportResultState() != "1" && report.getReportTargetRe().getReplyNo() != 0 ) {
			System.out.println("if문 내부 replyProcess 실행");
			
			replyService.deleteReply2(report.getReportTargetRe());
			user = userService.getUser(report.getReportTargetRe().getReplyWriter().getUserId());
			if(report.getReportResultState().equals("3")){
				
				
				if(user.getUserRole().equals("2")) {
					user.setUserRole("3");
				}else if(user.getUserRole().equals("3")) {
					user.setUserRole("4");
				}
				user.setStateReason(report.getStateReason());
				user.setStateRegdate(report.getReportResultUpdate());
				
			}
			userService.updateUserRole(user);
		}else if(report.getReportResultState() != "1" && report.getReportTarget().getUserId() != null ) {
			System.out.println("if문 내부 userProcess 실행");
			
			user = userService.getUser(report.getReportTarget().getUserId());
			if(report.getReportResultState().equals("3")){
				
				if(user.getUserRole().equals("2")) {
					user.setUserRole("3");
				}else if(user.getUserRole().equals("3")) {
					user.setUserRole("4");
				}
				user.setStateReason(report.getStateReason());
				user.setStateRegdate(report.getReportResultUpdate());
				
				}
				userService.updateUserRole(user);
				
			}else if(report.getReportResultState() != "1" && report.getReportTargetMm().getMmNo() != 0 ) {
				System.out.println("if문 내부 moimProcess 실행");
				
				moim = moimService.getMoim(report.getReportTargetMm().getMmNo());
				
				if(report.getReportResultState().equals("3")){
					System.out.println("내부의if문 한번더실행");
					moim.setMmState(3);
					
					moimService.updateReportMoim(moim);
					
					System.out.println(moim);
				}	
			
			}
		
		return	reportService.getReport(report);
		
	}
	
	@RequestMapping("addReport")
	public String addReport(@RequestBody Report report) throws Exception{
		
		System.out.println("addReport 실행");
		
		System.out.println(report);
		
		if(report.getReportByUser().getUserId() != null || report.getReportByUser().getUserId() != "") {
		reportService.addReport(report);
		System.out.println("신고자아이디체크 '"+report.getReportByUser().getUserId()+"' 공백일경우 널값들어감. " );
		}
		
		return "";
		
	}
	
}
