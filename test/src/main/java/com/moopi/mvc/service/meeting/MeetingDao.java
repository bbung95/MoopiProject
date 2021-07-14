package com.moopi.mvc.service.meeting;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.MeetingFlashMember;

@Mapper
public interface MeetingDao {
	
	//정모 생성하기
	public void addMeeting(Meeting meeting) throws Exception;
	
	//정모 리스트 조회, 풀캘린더
	public List<Meeting> getMeetingList(int mmNo) throws Exception;
	
	//정모 상세보기
	public Meeting getMeeting(int mtNo) throws Exception;
	
	//정모 수정
	public void updateMeeting(Meeting meeting) throws Exception;
	
	//정모 참가하기
	public void applyMeeting(@Param("mtNo") int mtNo, 
							@Param("userId") String userId) throws Exception;
	
	//정모 참가취소
	public void leaveMeeting(@Param("mtNo") int mtNo, 
							@Param("userId") String userId) throws Exception;
	
	//정모 참가시 인원증가
	public void addCurrentCount(@Param("mtNo") int mtNo) throws Exception;
	
	//정모 취소시 인원감소
	public void subCurrentCount(@Param("mtNo") int mtNo) throws Exception;
	
	//정모 참여자 명단 조회
	public List<MeetingFlashMember> getMEFLList(int mtNo) throws Exception;
	
	//나중에 회원가입하면 관심사에 맞는 정모가 몇개인지 알려주기위함
	//관심사 및 거주지로 필터링할것임
	public int getTotalCount(Search search) throws Exception;
	
}

