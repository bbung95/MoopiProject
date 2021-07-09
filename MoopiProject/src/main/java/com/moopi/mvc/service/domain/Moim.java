package com.moopi.mvc.service.domain;

import java.io.File;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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

}
