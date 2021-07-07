package com.moopi.mvc.service.meeting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.meeting.MeetingDao;
import com.moopi.mvc.service.meeting.MeetingService;
import com.moopi.mvc.service.domain.Meeting;



//@Service("meetingServiceImpl")
public class MeetingServiceImpl implements MeetingService{

	
	private MeetingDao meetingDao;
	
	
	public MeetingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		meetingDao.insertMeeting(meeting);
		
	}

	@Override
	public Meeting getMeeting(int mtNo) throws Exception {
		return meetingDao.findMeeting(mtNo);
	}

	@Override
	public Map<String, Object> getMeetingList(Search search) throws Exception {
		
		List<Meeting> list = meetingDao.getMeetingList(search);
		int totalCount = meetingDao.getTotalCOunt(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		meetingDao.updateMeeting(meeting);
	}

}
