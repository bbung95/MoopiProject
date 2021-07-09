package com.moopi.mvc.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	// 보드번호 10000 부터 시작
	private int boardNo;
	// 보드 유형 1. 무피게시판 2. 문의게시판 3. 마이홈 4. 모임게시판
	private String boardCategory;
	// 작성자
	private User boardWriter;
	// 게시글 제목
	private String boardName;
	// 게시글 내용
	private String boardContent; 
	// 게시글 작성시간
	private Date boardRegDate;
	// 게시글 수정시간
	private Date boardUpdate; 
	// 게시글 상태  1. 정상 2. 삭제 
	private String boardState;
	// 문의게시글용 비밀번호.
	private String boardPassword;
	// 모임게시판용 모임고유번호
	private int boardMoimNo;
	// 게시글 좋아요 카운트
	private int boardLike;
	
	public Board() {
	}
	
}
