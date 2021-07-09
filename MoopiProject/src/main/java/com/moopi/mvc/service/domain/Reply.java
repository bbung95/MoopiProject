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


	private int replyNo;
	private int boardNo;
	private User replyWriter;
	private String replyContent;
	private Date replyRegDate;
	private File replyFile; 							// file은 어떻게해야하나...
	private String replyState;
	
	public Reply() {
	}

}
