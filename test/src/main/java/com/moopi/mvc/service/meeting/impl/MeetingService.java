package com.moopi.mvc.service.meeting.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;
import com.moopi.mvc.service.domain.MeetingFlashMember;

public interface MeetingService {
	
	
	public void addMeeting(Meeting meeting) throws Exception;

	public Meeting getMeeting(int mtNo) throws Exception;

	public Map<String, Object> getMeetingList(int mmNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void deleteMeeting(int mtNo) throws Exception;
	
	public void applyMeeting(@Param("mtNo") int mtNo, 
			@Param("userId") String userId) throws Exception;
	
	public void leaveMeeting(@Param("mtNo") int mtNo, 
			@Param("userId") String userId) throws Exception;
	
	public Map<String, Object> getMEFLList(int mtNo) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public MeetingFlashMember getMFEL(int mtNo, String userId) throws Exception;
}
