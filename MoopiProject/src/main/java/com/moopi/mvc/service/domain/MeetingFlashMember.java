package com.moopi.mvc.service.domain;

import java.util.Date;

public class MeetingFlashMember {

	
	private int meflNo; //mefl no
	private String meflId; //정모or플래시 회원아이디
	private int targetNo; //정모or플래시 No
	private Date joinRegDate; // 미팅or플래시 등록일자
	private int joinState; //mefl 상태(1.모집중 2.모집마감 3.삭제)
	private int meflType; //mefl 구분자(1.정모 2.플래시)
	
	public MeetingFlashMember() {
		
	}

	public int getMeflNo() {
		return meflNo;
	}

	public void setMeflNo(int meflNo) {
		this.meflNo = meflNo;
	}

	public String getMeflId() {
		return meflId;
	}

	public void setMeflId(String meflId) {
		this.meflId = meflId;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public Date getJoinRegDate() {
		return joinRegDate;
	}

	public void setJoinRegDate(Date joinRegDate) {
		this.joinRegDate = joinRegDate;
	}

	public int getJoinState() {
		return joinState;
	}

	public void setJoinState(int joinState) {
		this.joinState = joinState;
	}

	public int getMeflType() {
		return meflType;
	}

	public void setMeflType(int meflType) {
		this.meflType = meflType;
	}

	@Override
	public String toString() {
		return "MeetingFlashMember [meflNo=" + meflNo + ", meflId=" + meflId + ", targetNo=" + targetNo
				+ ", joinRegDate=" + joinRegDate + ", joinState=" + joinState + ", meflType=" + meflType + "]";
	}
	
	
	
	
}
