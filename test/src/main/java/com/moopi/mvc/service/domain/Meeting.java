package com.moopi.mvc.service.domain;

import lombok.AccessLevel;

//import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Meeting {

	private int mtNo; //정모 No
	private int mmNo; //모임무피 No
	private String mtName; //정모 제목
	private String mtContent; // 정모 내용
	private String mtStart; //정모 시작시간
	
	//@Getter(AccessLevel.NONE)
	//@Setter(AccessLevel.NONE)
	private String mtStart2; //rfc3339포맷
	
	private String mtEnd; //정모 종료시간
	
	//@Getter(AccessLevel.NONE)
	//@Setter(AccessLevel.NONE)
	private String mtEnd2; //rfc3339포맷
	
	private String mtRegDate; //정모 등록시간
	private int mtMaxCount; //정모 최대 참가인원
	private int mtCurrentCount; //정모 현재 참가인원
	private User mtConstructor; //정모 주최자
	private String mtAddr; //정모장소
	private int mtState; //정모 상태(1.모집중 2.모집마감 3.삭제)
	private int mtMapX; //지도 X축
	private int mtMapY; //지도 Y축
	
	public Meeting() {
	}

	
//	public String getMtStart2() {
//		String start2 = getMtStart();
//		String a = start2.substring(0,10);
//		String b = start2.substring(11,19);
//		String start3 = a+"T"+b;
//		return start3;
//	}
//
//	public void setMtStart2(String mtStart2 ) {
//		this.mtStart2 = getMtStart();
//	}
//
//	public String getMtEnd2() {
//		String end2 = getMtEnd();
//		String c = end2.substring(0,10);
//		String d = end2.substring(11,19);
//		String end3 = c+"T"+d;
//		System.out.println("엔드3의값:"+end3);
//		return end3;
//	}
//
//	public void setMtEnd2(String mtEnd2) {
//		this.mtEnd2 = getMtEnd();
//	}

	
	
}
