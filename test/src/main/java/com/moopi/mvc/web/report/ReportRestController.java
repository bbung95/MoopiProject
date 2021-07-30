package com.moopi.mvc.web.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;
import com.moopi.mvc.service.report.impl.ReportServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@RestController
@RequestMapping("/report/json/*")
public class ReportRestController {

	@Autowired
	private ReportServiceImpl reportService;
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private ReplyServiceImpl replyService;
	
	@Autowired
	private UserServiceImpl userService;
	
	public Report report;
	
	public Board board;
	
	public Reply reply;
	
	public User user;
	
	public int userRole;
	
	public ReportRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@PostMapping(value="processReport")
	public Report processReport(@RequestBody Report report) throws Exception{
		
		System.out.println("11processReport 실행");
		System.out.println("11report 값 체크 ========="+report); 
		System.out.println(report.getReportNo());
		reportService.processReport(report);
		User user = new User();
		
		System.out.println("1report 값 체크 ========"+report);
		
		if(report.getReportResultState() != "1" && report.getReportTargetBd() != null ) {
			System.out.println("resultState값 체크"+ report.getReportResultState());
			boardService.deleteBoard2(report.getReportTargetBd());
			user = userService.getUser(report.getReportTargetBd().getBoardWriter().getUserId());
			System.out.println("!!!!!!!!!!!!!!!!!!");
			
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
			
		}else if(report.getReportResultState() != "1" && report.getReportTargetRe() != null ) {
			
			replyService.deleteReply2(report.getReportTargetRe());
			user = userService.getUser(report.getReportTargetBd().getBoardWriter().getUserId());
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
