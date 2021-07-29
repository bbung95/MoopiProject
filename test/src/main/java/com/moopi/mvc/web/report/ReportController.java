package com.moopi.mvc.web.report;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;
import com.moopi.mvc.service.report.impl.ReportServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;


@Controller
@RequestMapping("/report/*")
public class ReportController {

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
	
	@RequestMapping("addReportView")
	public String addReportView(@ModelAttribute("report")Report report, Model model) throws Exception{
		
		System.out.println("addReportView 시작");
		
		System.out.println(report);
		
		if(report.getReportCategory().equals("1")) {
			
			board = boardService.getBoard(report.getReportTargetBd().getBoardNo());
			model.addAttribute(board);
			model.addAttribute("reportCategory", "1");
			System.out.println(board);
		}else if(report.getReportCategory().equals("2")) {

			reply = replyService.getReply(report.getReportTargetRe().getReplyNo());
			model.addAttribute(reply);
			model.addAttribute("reportCategory", "2");
			System.out.println(reply);
		}else if(report.getReportCategory().equals("3")) {
			
			user = userService.getUser(report.getReportTarget().getUserId());
			model.addAttribute(user);
			model.addAttribute("reportCategory", "3");
			System.out.println(user);
		}
		
		
		return "report/addReportView";
		
	}
	
	@RequestMapping("addReport")
	public void addReport(@ModelAttribute("report") Report report, Model model) throws Exception{
		
		System.out.println("addReport 실행");
		
		System.out.println(report);
		
		if(report.getReportByUser().getUserId() != null || report.getReportByUser().getUserId() != "") {
		reportService.addReport(report);
		System.out.println("신고자아이디체크 '"+report.getReportByUser().getUserId()+"' 공백일경우 널값들어감. " );
		}
		
		
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
		
	@RequestMapping(method = RequestMethod.POST, path = "processReport")
	public String processReport(@ModelAttribute Report report, Model model) throws Exception{
		
		System.out.println("processReport 실행");
		System.out.println(model );
		System.out.println("report 값 체크 ========="+report); 
		System.out.println(report.getReportNo());
		reportService.processReport(report);
		
		
		System.out.println("report 값 체크 ========"+report);
		
		if(report.getReportResultState() != "1" && report.getReportTargetBd() != null ) {
			
			
			boardService.deleteBoard2(report.getReportTargetBd());
		}else if(report.getReportResultState() != "1" && report.getReportTargetRe() != null ) {
			
			replyService.deleteReply2(report.getReportTargetRe());
		}
	
		return "";
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
