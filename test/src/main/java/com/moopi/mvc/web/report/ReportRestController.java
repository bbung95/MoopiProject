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
		
		System.out.println("processReport 실행");
		System.out.println("report 값 체크 ========="+report); 
		System.out.println(report.getReportNo());
		reportService.processReport(report);
		
		
		System.out.println("report 값 체크 ========"+report);
		
		if(report.getReportResultState() != "1" && report.getReportTargetBd() != null && report.getReportTargetRe().getReplyNo() == 0) {
			
			boardService.deleteBoard2(report.getReportTargetBd());
			System.out.println("게시글 삭제..");
			
		}else if(report.getReportResultState() != "1" && report.getReportTargetRe().getReplyNo() != 0 ) {
			
			replyService.deleteReply2(report.getReportTargetRe());
			System.out.println("리플 삭제");
		}else if(report.getReportResultState() != "1" && report.getReportTarget().getUserId() != null ) {
			
			user = userService.getUser(report.getReportTarget().getUserId());
			
			if(report.getReportResultState() == "2" ) {
			
				if(user.getUserRole() != "1") {
					userRole = Integer.parseInt(user.getUserRole()) +1;
					
					user.setUserRole(Integer.toString(userRole));
					userService.updateUserRole(user);
				}
			}else if(report.getReportResultState() == "3") {
				
				user.setUserRole("5");
				userService.updateUserRole(user);
			}
		}
		
		return	reportService.getReport(report);
		
	}
	
}
