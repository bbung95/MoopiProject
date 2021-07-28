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
	private String noticeState;
	private User noticeUser;
	private Board board;
	private Moim moim;
	private Flash flash;
	private Meeting meeting;
	private Reply reply;
	private Member member;
	private String noticeType;
	
	public Notice() {
	}

}
