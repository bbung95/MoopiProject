package com.moopi.mvc.service.common.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.service.common.CommonDaoImpl;
import com.moopi.mvc.service.domain.Notice;

@Service
public class CommonServiceImpl {
	
	@Autowired
	private CommonDaoImpl commonDao;
	
	public void addNotice(Notice notice) {
		
		commonDao.addNotice(notice);
	}
	
	public Notice getNotice(int noticeNo) {
		
		return commonDao.getNotice(noticeNo);
	}
	
	public void deleteNotice(int noticeNo) {
		
		commonDao.deleteNotice(noticeNo);
	}
	

}
