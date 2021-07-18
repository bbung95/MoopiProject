package com.moopi.mvc.web.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.report.impl.ReportServiceImpl;


@Controller
@RequestMapping("/report/*")
public class ReportController {

	@Autowired
	private ReportServiceImpl reportService;
	
	@Autowired
	private BoardServiceImpl boardService;
	
	
	public Report report;
	
	public Board board;
	
	@RequestMapping("addReportView")
	public String addReportView(@ModelAttribute("report")Report report, Model model) throws Exception{
		
		System.out.println("addReportView 시작");
		
		System.out.println(report);
		
		if(report.getReportCategory().equals("1")) {
			
			int boardNo = Integer.parseInt(report.getReportTarget());
			board = boardService.getBoard(boardNo);
			model.addAttribute(board);
			model.addAttribute("reportCategory", "1");
		}
		
		System.out.println(board);
		
		return "report/addReportView";
		
	}
	
	@RequestMapping("addReport")
	public void addReport(@ModelAttribute("report") Report report, Model model) throws Exception{
		
		System.out.println("addReport 실행");
		
		System.out.println(report);
		
		reportService.addReport(report);
		
		
	}
	
	
}
