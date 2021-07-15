package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MeetingFlashMember {

	
	private int meflNo; //mefl no
	private User meflId; //정모or플래시 회원아이디
	private int targetNo; //정모or플래시 No
	private Date joinRegDate; // 미팅or플래시 등록일자
	private int joinState; //mefl 상태(1.모집중 2.모집마감 3.삭제)
	private int meflType; //mefl 구분자(1.정모 2.플래시)
	
	public MeetingFlashMember() {
		
	}
	
}
