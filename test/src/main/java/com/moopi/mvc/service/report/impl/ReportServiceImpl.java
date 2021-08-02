package com.moopi.mvc.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Report;
import com.moopi.mvc.service.report.ReportDao;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao reportDao;

	public void addReport(Report report) throws Exception {

		reportDao.addReport(report);

	}

	public Map<String, Object> getReportList(Search search, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("model", model);
		map.put("search", search);
		System.out.println(model);

		List<Report> list = reportDao.getReportList(map);
		int totalCount = reportDao.getTotalCount(map);
		
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	public void processReport(Report report) throws Exception {

		reportDao.processReport(report);

	}

	public Report getReport(Report report) throws Exception {

		return reportDao.getReport(report);
	}

}
