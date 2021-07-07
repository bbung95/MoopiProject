package com.moopi.mvc.service.domain;

import java.util.Date;

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


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public User getMmUser() {
		return mmUser;
	}


	public void setMmUser(User mmUser) {
		this.mmUser = mmUser;
	}


	public int getMmNo() {
		return mmNo;
	}


	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}


	public int getMemberRole() {
		return memberRole;
	}


	public void setMemberRole(int memberRole) {
		this.memberRole = memberRole;
	}


	public int getWriteCount() {
		return writeCount;
	}


	public void setWriteCount(int writeCount) {
		this.writeCount = writeCount;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public int getMtCount() {
		return mtCount;
	}


	public void setMtCount(int mtCount) {
		this.mtCount = mtCount;
	}


	public Date getMemberRegDate() {
		return memberRegDate;
	}


	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}


	@Override
	public String toString() {
		return "MoimMember [memberNo=" + memberNo + ", mmUser=" + mmUser + ", mmNo=" + mmNo + ", memberRole="
				+ memberRole + ", writeCount=" + writeCount + ", replyCount=" + replyCount + ", mtCount=" + mtCount
				+ ", memberRegDate=" + memberRegDate + "]";
	}
	
}
