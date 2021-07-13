package com.moopi.mvc.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FollowLike {

	private User user;
	private int flTarget;
	private String flType;
	private int flNo;
	
	public FollowLike() {
		
	}
}
