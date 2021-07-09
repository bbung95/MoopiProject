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
	private Date coinRegdate;
	private int coinRole;
	private int coinCount;
	private User userId;
	private Flash flashNo;
	
	public Coin() {
		
	}

}
