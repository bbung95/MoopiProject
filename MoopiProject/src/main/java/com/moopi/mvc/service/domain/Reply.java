package com.moopi.mvc.service.domain;

import java.io.File;
import java.sql.Date;

public class Reply {


	private int replyNo;
	private int boardNo;
	private User replyWriter;
	private String replyContent;
	private Date replyRegDate;
	private File replyFile; 							// file은 어떻게해야하나...
	private String replyState;
	
	public Reply() {
	}
	
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public User getReplyWriter() {
		return replyWriter;
	}


	public void setReplyWriter(User replyWriter) {
		this.replyWriter = replyWriter;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	
	public Date getReplyRegDate() {
		return replyRegDate;
	}

	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}

	public File getReplyFile() {
		return replyFile;
	}

	public void setReplyFile(File replyFile) {
		this.replyFile = replyFile;
	}

	public String getReplyState() {
		return replyState;
	}

	public void setReplyState(String replyState) {
		this.replyState = replyState;
	}


	public String toString() {
		
		return "Reply [ replyNo = "+replyNo+" boardNo = "+boardNo+" replyWriter = "+ replyWriter+" replyContent = "+ replyContent+ " replyRegDate = "+ replyRegDate
				+" replyFile = "+replyFile +" replyState = "+replyState+" ]";
	}
	
	
}
