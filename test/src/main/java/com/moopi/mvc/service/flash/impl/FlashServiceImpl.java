package com.moopi.mvc.service.flash.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.MeetingFlashMember;
import com.moopi.mvc.service.flash.FlashDao;
import com.moopi.mvc.service.user.UserDao;

@Service
public class FlashServiceImpl {

	@Autowired
	// @Qualifier("flashDaoImpl")
	private FlashDao flashDao;
	private UserDao userDao;
	
	// Constructor
	public FlashServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addFlash(Flash flash) throws Exception {
		System.out.println("addFlash ServiceImpl start::");
		flashDao.addFlash(flash);
	}

	public Flash getFlash(int flashNo) throws Exception {
		System.out.println("getFlash ServiceImpl start::");
		return flashDao.getFlash(flashNo);
	}

	public Map<String, Object> getFlashList(Search search) throws Exception {

		List<Flash> list = flashDao.getFlashList(search);
		int totalCount = flashDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	public void updateFlash(Flash flash) throws Exception {
		flashDao.updateFlash(flash);

	}

	public void joinFlash(String userId, int flashNo) throws Exception {
		flashDao.joinFlash(userId, flashNo);
		
	}

	public void joinFlashUpdate(Flash flash) throws Exception{
		flashDao.joinFlashUpdate(flash);
	}
	
	public Map<String, Object> getJoinFlashList (int targetNo) throws Exception{
		List<MeetingFlashMember> list = flashDao.getJoinFlashList(targetNo);
		//int totalCount = flashDao.getJoinTotalCount(targetNo);
		System.out.println("getJoinFlashList::"+list);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("totalCount", totalCount);
		return map;
		
		
	}
}
