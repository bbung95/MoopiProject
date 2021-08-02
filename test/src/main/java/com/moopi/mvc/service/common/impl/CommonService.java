package com.moopi.mvc.service.common.impl;

import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Interest;
import com.moopi.mvc.service.domain.Notice;

public interface CommonService {
	
	public void addNotice(Notice notice);
		
	public List<Notice> getListNotice(Search search, String userId);
	
	public void updateNotice(String userId);
	
	public int getNoitceCount(String userId);
	
	public void deleteNotice(Map<String, Object> map);
	
	public List<Interest> getInterest();
	
}
