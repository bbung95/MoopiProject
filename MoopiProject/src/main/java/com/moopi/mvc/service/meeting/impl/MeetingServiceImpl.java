package com.moopi.mvc.service.meeting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.meeting.MeetingDao;
import com.moopi.mvc.service.domain.Meeting;

@Service
public class MeetingServiceImpl {

	@Autowired
	private MeetingDao meetingDao;
	
	public void addMeeting(Meeting meeting) throws Exception {
		meetingDao.addMeeting(meeting);
	}

	public Meeting getMeeting(int mtNo) throws Exception {
		return meetingDao.getMeeting(mtNo);
	}

	public Map<String, Object> getMeetingList(int mmNo) throws Exception {
		
		List<Meeting> list = meetingDao.getMeetingList(mmNo);
		//int totalCount = meetingDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("totalCount", totalCount);
		
		return map;
	}
	
	public void updateMeeting(Meeting meeting) throws Exception {
		meetingDao.updateMeeting(meeting);
	}
	
	//나중에쓸것임
	public int getTotalCount(Search search) throws Exception {
		return meetingDao.getTotalCount(search);
	}

}
