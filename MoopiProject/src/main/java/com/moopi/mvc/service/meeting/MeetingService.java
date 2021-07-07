package com.moopi.mvc.service.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.meeting.MeetingDao;
import com.moopi.mvc.service.domain.Meeting;


public interface MeetingService {

	public void addMeeting(Meeting meeting) throws Exception;
	
	public Meeting getMeeting(int mtNo) throws Exception;
	
	public Map<String, Object> getMeetingList(Search search) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
}
