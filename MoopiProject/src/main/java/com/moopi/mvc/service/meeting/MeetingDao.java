package com.moopi.mvc.service.meeting;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;

public interface MeetingDao {
	
	public void insertMeeting(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingList(Search search) throws Exception;
	
	public Meeting findMeeting(int mtNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public int getTotalCOunt(Search search) throws Exception;
	
}

