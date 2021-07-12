package com.moopi.mvc.service.domain;

import java.io.File;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Flash {

	private int flashNo;			//번개무피 넘버
	private String flashName;		//번개무피 
	private String flashContent;	//번개무피 소개글
	private File flashFile;			//번개무피 이미지
	private User flashConstructor;	//번개무피 생성자
	private Date flashRegdate;		//번개무피 생성일
	private Date flashTime;			//번개무피 만남시간
	private int flashCurrentCount;	//번개무피 현재인원
	private int flashMaxCount;		//번개무피 최대인원
	private String addr;			//번개무피 장소
	private int flashState;			//번개무피 상태
	private int flashInterest;		//번개무피 관심사
	private int flashMapX;			//번개무피 좌표X
	private int flashMapY;			//번개무피 좌표Y
	
	public Flash() {
		
	}

}
