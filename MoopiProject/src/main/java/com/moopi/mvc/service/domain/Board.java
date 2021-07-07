package com.moopi.mvc.service.domain;

import java.sql.Date;

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
	
	
	public Board() {
	}

		

	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public String getBoardCategory() {
		return boardCategory;
	}



	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}



	public User getBoardWriter() {
		return boardWriter;
	}



	public void setBoardWriter(User boardWriter) {
		this.boardWriter = boardWriter;
	}



	public String getBoardName() {
		return boardName;
	}



	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}



	public String getBoardContent() {
		return boardContent;
	}



	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}



	public Date getBoardRegDate() {
		return boardRegDate;
	}



	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}



	public Date getBoardUpdate() {
		return boardUpdate;
	}



	public void setBoardUpdate(Date boardUpdate) {
		this.boardUpdate = boardUpdate;
	}



	public String getBoardState() {
		return boardState;
	}



	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}



	public String getBoardPassword() {
		return boardPassword;
	}



	public void setBoardPassword(String boardPassword) {
		this.boardPassword = boardPassword;
	}



	public int getBoardMoimNo() {
		return boardMoimNo;
	}



	public void setBoardMoimNo(int boardMoimNo) {
		this.boardMoimNo = boardMoimNo;
	}



	public String toString() {
		
		return "Board [ boardNo = "+boardNo+" boardCategory = "+boardCategory+" boardWriter = "+ boardWriter+" boardName = "+ boardName+ " boardContent = "+ boardContent
				+" boardRegDate = "+boardRegDate +" boardUpdate = "+boardUpdate+" boardState = "+boardState +" boardPassword = "+boardPassword +" boardMoimNo = "+boardMoimNo+" ]";
	}
	
	
}
