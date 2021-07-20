package com.moopi.mvc.service.report;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Report;

@Mapper
public interface ReportDao {

	public void addReport(@Param("report")Report report) throws Exception;
	
	public List<Report> getReportList(@Param("map")Map map) throws Exception;
	
	public void processReport(@Param("report")Report report) throws Exception;
}
