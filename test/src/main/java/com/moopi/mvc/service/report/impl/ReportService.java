package com.moopi.mvc.service.report.impl;

import java.util.Map;

import org.springframework.ui.Model;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Report;

public interface ReportService {
	
	public void addReport(Report report) throws Exception;

	public Map<String, Object> getReportList(Search search, Model model) throws Exception;

	public void processReport(Report report) throws Exception;

	public Report getReport(Report report) throws Exception;

}
