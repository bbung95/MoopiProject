package com.moopi.mvc.service.domain;

import java.io.File;
import java.util.Date;

public class Moim {

	private int mmNo;     //모임무피 넘버
	private String mmName;   //모임무피 명
	private String mmContent;  //모임무피 소개글
	private File mmFile;  //모임무피 대표썸넬
	private int mmCurrentCount; //모임무피 현재정원
	private int mmMaxCount;  //모임무피 가입정원
	private User mmConstructor;   //모임무피 생성자
	private Date mmRegDate;  //모임무피 생성일
	private int mmInterest;   //모임무피 관심사 넘버
	private String mmAddr;  //모임무피 거주지
	private int mmState;  //모임무피 상태(1공개 2비공개 3삭제)
	private int mmMinAge; //모임무피 최소가입연령
	private int mmMaxAge;  //모임무피 최대가입연령
	private int mmType;  //모임무피 가입유형 (1일반 2자유)
	
	public Moim() {
			
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getMmContent() {
		return mmContent;
	}

	public void setMmContent(String mmContent) {
		this.mmContent = mmContent;
	}

	public File getMmFile() {
		return mmFile;
	}

	public void setMmFile(File mmFile) {
		this.mmFile = mmFile;
	}

	public int getMmCurrentCount() {
		return mmCurrentCount;
	}

	public void setMmCurrentCount(int mmCurrentCount) {
		this.mmCurrentCount = mmCurrentCount;
	}

	public int getMmMaxCount() {
		return mmMaxCount;
	}

	public void setMmMaxCount(int mmMaxCount) {
		this.mmMaxCount = mmMaxCount;
	}

	public User getMmConstructor() {
		return mmConstructor;
	}

	public void setMmConstructor(User mmConstructor) {
		this.mmConstructor = mmConstructor;
	}

	public Date getMmRegDate() {
		return mmRegDate;
	}

	public void setMmRegDate(Date mmRegDate) {
		this.mmRegDate = mmRegDate;
	}

	public int getMmInterest() {
		return mmInterest;
	}

	public void setMmInterest(int mmInterest) {
		this.mmInterest = mmInterest;
	}

	public String getMmAddr() {
		return mmAddr;
	}

	public void setMmAddr(String mmAddr) {
		this.mmAddr = mmAddr;
	}

	public int getMmState() {
		return mmState;
	}

	public void setMmState(int mmState) {
		this.mmState = mmState;
	}

	public int getMmMinAge() {
		return mmMinAge;
	}

	public void setMmMinAge(int mmMinAge) {
		this.mmMinAge = mmMinAge;
	}

	public int getMmMaxAge() {
		return mmMaxAge;
	}

	public void setMmMaxAge(int mmMaxAge) {
		this.mmMaxAge = mmMaxAge;
	}

	public int getMmType() {
		return mmType;
	}

	public void setMmType(int mmType) {
		this.mmType = mmType;
	}

	@Override
	public String toString() {
		return "Moim [mmNo=" + mmNo + ", mmName=" + mmName + ", mmContent=" + mmContent + ", mmFile=" + mmFile
				+ ", mmCurrentCount=" + mmCurrentCount + ", mmMaxCount=" + mmMaxCount + ", mmConstructor="
				+ mmConstructor + ", mmRegDate=" + mmRegDate + ", mmInterest=" + mmInterest + ", mmAddr=" + mmAddr
				+ ", mmState=" + mmState + ", mmMinAge=" + mmMinAge + ", mmMaxAge=" + mmMaxAge + ", mmType=" + mmType
				+ "]";
	}

	

}
