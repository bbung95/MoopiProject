package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Member {

	private int memberNo; //모임무피 회원 No
	private User mmUser;  //모임무피 회원
	private int mmNo;   //모임무피 No
	private int memberRole;  //모임무피 유저롤(1.가입신청 2.일반멤버 3.매니저 4.모임장 5.블랙 6.탈퇴)
	private int writeCount; //작성한 글 수
	private int replyCount; //작성한 댓글 수
	private int mtCount; //참여한 정모 횟수
	private Date memberRegDate;  //해당모임무피에 가입한 날
	

	public Member() {
		
	}

}
