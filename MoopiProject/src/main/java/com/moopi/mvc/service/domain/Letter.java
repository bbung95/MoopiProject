package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Letter {

	private int letterNo;
	private User letterUserId;
	private User letterTargetId;
	private String letterContent;
	private Date letterRegdate;
	
	public Letter() {
		
	}

}
