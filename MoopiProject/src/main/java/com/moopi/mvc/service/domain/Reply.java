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
	private Date replyRegDate;
	// 리플 첨부파일
	private File replyFile;
	// 리플 상태 1. 정상 2. 삭제
	private String replyState;
	
	public Reply() {
	}

}
