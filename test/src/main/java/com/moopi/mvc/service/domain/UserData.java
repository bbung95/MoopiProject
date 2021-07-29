package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserData {

	private int moopi;
	private int google;
	private int date;
	private String start;
	private String end;
	
	public UserData() {
		
	}

}
