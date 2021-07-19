package com.moopi.mvc.service.report.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.report.ReportDao;

@Service
public class ReportServiceImpl {

	@Autowired
	private ReportDao reportDao;
	
	public void addReport(Report report) throws Exception {
				
		reportDao.addReport(report);
		
	}
}
