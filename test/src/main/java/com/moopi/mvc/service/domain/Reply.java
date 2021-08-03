package com.moopi.mvc.service.domain;

import java.io.File;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reply {

	// 리플고유번호
	private int replyNo;
	// 게시글 번호
	private int boardNo;
	// 리플 작성자
	private User replyWriter;
	// 리플 내용
	private String replyContent;
	// 리플 작성시간
	private String replyRegDate;
	// 리플 상태 1. 정상 2. 삭제 3.신고로인한 삭제
	private String replyState;
	// type 1. 마이홈 2. 모임
	private int type;
	
	public Reply() {
	}

}
