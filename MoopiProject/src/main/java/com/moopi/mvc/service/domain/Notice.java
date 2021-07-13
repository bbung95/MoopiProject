package com.moopi.mvc.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	
	private int noticeNo;
	private String noticeContent;
	private String toUserId;
	private Date noticeRegDate;
	private String noticeTarget;
	private String noticeType;
	private String noticeState;
	
	public Notice() {
	}

}
