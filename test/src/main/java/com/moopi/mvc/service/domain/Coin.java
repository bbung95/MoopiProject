package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Coin {

	private int coinNo;
	private String coinRegdate;
	private String coinRole;
	private int coinCount;
	private User coinUser;
	private Flash flash;
	
	public Coin() {
		
	}

}
