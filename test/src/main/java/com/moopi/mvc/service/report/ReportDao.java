package com.moopi.mvc.service.report;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.Report;

@Mapper
public interface ReportDao {

	public void addReport(@Param("report")Report report) throws Exception;
	
}
