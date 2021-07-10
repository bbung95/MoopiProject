package com.moopi.mvc.service.meeting;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Meeting;

@Mapper
public interface MeetingDao {
	
	public void addMeeting(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingList(int mmNo) throws Exception;
	
	public Meeting getMeeting(int mtNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	//나중에 회원가입하면 관심사에 맞는 정모가 몇개인지 알려주기위함
	public int getTotalCount(Search search) throws Exception;
	
}

