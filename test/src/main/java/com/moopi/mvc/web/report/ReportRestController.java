package com.moopi.mvc.web.report;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.Report;

@RestController
public class ReportRestController {

//	public ReportRestController() {
//		// TODO Auto-generated constructor stub
//	}
//	
//	@RequestMapping(method = RequestMethod.POST, path = "processReport")
//	public String processReport(@ModelAttribute Report report, Model model) throws Exception{
//		
//		System.out.println("processReport 실행");
//		System.out.println(model );
//		System.out.println("report 값 체크 ========="+report); 
//		System.out.println(report.getReportNo());
//		reportService.processReport(report);
//		
//		
//		System.out.println("report 값 체크 ========"+report);
//		
//		if(report.getReportResultState() != "1" && report.getReportTargetBd() != null ) {
//			
//			
//			boardService.deleteBoard2(report.getReportTargetBd());
//		}else if(report.getReportResultState() != "1" && report.getReportTargetRe() != null ) {
//			
//			replyService.deleteReply2(report.getReportTargetRe());
//		}
//	
//		return "";
//	}
	
}
