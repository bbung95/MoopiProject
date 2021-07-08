package com.moopi.mvc.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private String boardCategory;
	private User boardWriter;
	private String boardName;
	private String boardContent;
	private Date boardRegDate;
	private Date boardUpdate;
	private String boardState;
	private String boardPassword;
	private int boardMoimNo;
	private int boardLike;
	
	public Board() {
	}

	
}
