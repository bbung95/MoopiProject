package com.moopi.mvc.service.domain;

import java.util.Date;

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
	private Date mtStart; //정모 시작시간
	private Date mtEnd; //정모 종료시간
	private Date mtRegDate; //정모 등록시간
	private int mtMaxCount; //정모 최대 참가인원
	private int mtCurrentCount; //정모 현재 참가인원
	private User mtCounstructor; //정모 주최자
	private String mtAddr; //정모장소
	private int mtState; //정모 상태(1.모집중 2.모집마감 3.삭제)
	private int mtMapX; //지도 X축
	private int mtMapY; //지도 Y축
	
	public Meeting() {
	}

}
