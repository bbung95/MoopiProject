package com.moopi.mvc.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Report {
	
	private int 	reportNo;
	private String	reportCategory;
	private String	targetName;
	private String	reportTarget;
	private String	reportContent;
	private Date	reportRegDate;
	private String	reportType;
	private Date	reportResultDate;
	private String	reportResultStatus;
	 	

	public Report() {
		// TODO Auto-generated constructor stub
	}

}
