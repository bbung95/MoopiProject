package com.moopi.mvc.service.domain;

import java.util.Date;

public class Meeting {

	private int mtNo; //정모 No
	private int mmNo; //모임무피 No
	private String mtName; //정모 제목
	private String mtContent; // 정모 내용
	private Date mtStart; //정모 시작시간
	private Date mtEnd; //정모 종료시간
	private int mtMaxCount; //정모 최대 참가인원
	private int mtCurrentCount; //정모 현재 참가인원
	private User mtCounstructor; //정모 주최자
	private String mtAddr; //정모장소
	private int mtState; //정모 상태(1.모집중 2.모집마감 3.삭제)
	private int mtMapX; //지도 X축
	private int mtMapY; //지도 Y축
	
	public Meeting() {
	}

	public int getMtNo() {
		return mtNo;
	}

	public void setMtNo(int mtNo) {
		this.mtNo = mtNo;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public String getMtName() {
		return mtName;
	}

	public void setMtName(String mtName) {
		this.mtName = mtName;
	}

	public String getMtContent() {
		return mtContent;
	}

	public void setMtContent(String mtContent) {
		this.mtContent = mtContent;
	}

	public Date getMtStart() {
		return mtStart;
	}

	public void setMtStart(Date mtStart) {
		this.mtStart = mtStart;
	}

	public Date getMtEnd() {
		return mtEnd;
	}

	public void setMtEnd(Date mtEnd) {
		this.mtEnd = mtEnd;
	}

	public int getMtMaxCount() {
		return mtMaxCount;
	}

	public void setMtMaxCount(int mtMaxCount) {
		this.mtMaxCount = mtMaxCount;
	}

	public int getMtCurrentCount() {
		return mtCurrentCount;
	}

	public void setMtCurrentCount(int mtCurrentCount) {
		this.mtCurrentCount = mtCurrentCount;
	}

	public User getMtCounstructor() {
		return mtCounstructor;
	}

	public void setMtCounstructor(User mtCounstructor) {
		this.mtCounstructor = mtCounstructor;
	}

	public String getMtAddr() {
		return mtAddr;
	}

	public void setMtAddr(String mtAddr) {
		this.mtAddr = mtAddr;
	}

	public int getMtState() {
		return mtState;
	}

	public void setMtState(int mtState) {
		this.mtState = mtState;
	}

	public int getMtMapX() {
		return mtMapX;
	}

	public void setMtMapX(int mtMapX) {
		this.mtMapX = mtMapX;
	}

	public int getMtMapY() {
		return mtMapY;
	}

	public void setMtMapY(int mtMapY) {
		this.mtMapY = mtMapY;
	}

	@Override
	public String toString() {
		return "Meeting [mtNo=" + mtNo + ", mmNo=" + mmNo + ", mtName=" + mtName + ", mtContent=" + mtContent
				+ ", mtStart=" + mtStart + ", mtEnd=" + mtEnd + ", mtMaxCount=" + mtMaxCount + ", mtCurrentCount="
				+ mtCurrentCount + ", mtCounstructor=" + mtCounstructor + ", mtAddr=" + mtAddr + ", mtState=" + mtState
				+ ", mtMapX=" + mtMapX + ", mtMapY=" + mtMapY + "]";
	}
	
	

}
