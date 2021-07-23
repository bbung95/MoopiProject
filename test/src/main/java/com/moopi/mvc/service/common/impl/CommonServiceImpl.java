package com.moopi.mvc.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.CommonDao;
import com.moopi.mvc.service.domain.Interest;
import com.moopi.mvc.service.domain.Notice;

@Service
public class CommonServiceImpl {
	
	@Autowired
	private CommonDao commonDao;
	
	public void addNotice(Notice notice) {
		
		commonDao.addNotice(notice);
	}
	
	public Notice getNotice(int noticeNo) {
		
		return commonDao.getNotice(noticeNo);
	}
	
	public List<Notice> getListNotice(Search search, String userId){
		
		return commonDao.getListNotice(search, userId);
	}
	
	public void updateNotice(String userId) {
		
		commonDao.updateNotice(userId);
	};
	
	public int getNoitceCount(String userId) {
		
		return commonDao.getTotalCount(userId);
	}
	
	public void deleteNotice(Map<String, Object> map) {
		
		commonDao.deleteNotice(map);
	}
	
	public List<Interest> getInterest(){
		
		return commonDao.getInterest();
	}
}
