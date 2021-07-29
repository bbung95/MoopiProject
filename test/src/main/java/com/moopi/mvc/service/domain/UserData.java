package com.moopi.mvc.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserData {

	private int moopi;
	private int google;
	private int naver;
	private int kakao;
	private int male;
	private int female;
	
	
	public UserData() {
		
	}

}
