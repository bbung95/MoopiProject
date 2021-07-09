package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
	
	// 회원가입
	private String userId;				// 화원 아이디
	private String password;			// 회원 비밀번호
	private String joinPath;			// 가입경로 - 자사몰, 구글, 네이버, 카카오
	
	// 추가정보입력
	private String userName;			// 회원 이름
	private String gender;				// 성별 - 남, 녀
	private String phone;				// 모바일번호
	private String nickname;			// 회원 닉네임
//	private int birth1;					// 생년월일 - 년
//	private int birth2;					// 생년월일 - 월
//	private int birth3;					// 생년월일 - 일
	private int age;					// 나이
	private String fullAddr;			// 전체 주소지
	private String addr;				// 일부 주소지 (구)
	private int interestFirst;			// 관심사1
	private int interestSecond;			// 관심사2
	private int interestThird;			// 관심사3
	private Date regDate;				// 가입일자
	
	// 유저롤
	private String userRole;			// 유저Role - 관리자, 정상회원, 블랙회원, 탈퇴회원, 탈퇴복구회원

	// 마이홈
	private String profileImage;		// 마이홈 - 프로필이미지
	private String profileContent;		// 마이홈 - 프로필소개
	private String myhomeState;			// 마이홈상태 - 공개, 비공개
	private int coin;					// 코인
	private String badge;				// 뱃지
	
	// 관리자
	private String stateReason;			// 처리사유 - 탈퇴처리사유, 블랙처리사유
	
	// Constructor
	public User() {
	}

}
