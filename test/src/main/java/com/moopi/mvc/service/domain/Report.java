package com.moopi.mvc.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Report {
	
	//신고번호
	private int 	reportNo;
	//신고카테고리
	private String	reportCategory;
	//타겟 닉네임
	private String	targetName;
	//신고 타겟 유저
	private User	reportTarget;
	//신고 타겟 게시글
	private Board	reportTargetBd;
	//신고 타겟 리플
	private Reply	reportTargetRe;
	//신고 타겟 모임
	private Moim	reportTargetMm;
	//신고 내용
	private String	reportContent;
	//신고 일자
	private Date	reportRegDate;
	//신고 유형
	private String	reportType;
	//신고처리일
	private Date	reportResultUpdate;
	//신고처리결과
	private String	reportResultState;
	//신고자
	private User reportByUser;
	
	private String 	stateReason;
	 	

	public Report() {
		// TODO Auto-generated constructor stub
	}

}