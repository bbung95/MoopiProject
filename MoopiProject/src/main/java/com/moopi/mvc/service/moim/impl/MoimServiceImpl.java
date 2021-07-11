package com.moopi.mvc.service.moim.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.moim.MoimDao;


@Service
public class MoimServiceImpl {

	@Autowired
	private MoimDao moimDao;
	
	public Moim getMoim(int mmNo) {
		System.out.println("모임서비스임플 시작");
		return moimDao.getMoim(mmNo);
	}
	
	
	public void addMoim(Moim moim) throws Exception {
		moimDao.addMoim(moim);
	}

	public Map<String, Object> getMoimList(Search search) throws Exception {
		
		List<Moim> list = moimDao.getMoimList(search);
		int totalCount = moimDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}


	public void updateMoim(Moim moim) throws Exception {
		moimDao.updateMoim(moim);
	}
	
	//테스트만하고 겟리스트로 편입 될 것임
//	public int getTotalCount(Search search) throws Exception{
//		return moimDao.getTotalCount(search);
//	}
	
	
	public void applyMoim(String userId, int mmNo) throws Exception {
		moimDao.applyMoim(userId, mmNo);
	}
	
	public void leaveMoim(String userId, int mmNo) throws Exception {
		moimDao.leaveMoim(userId, mmNo);
	}
	
	public void updateMemeber(String userId, int mmNo,
							int status) throws Exception {
		moimDao.updateMember(userId, mmNo, status);
	}
	
	public Map<String, Object> getMemberList(int mmNo) throws Exception {
		List<Member> list = moimDao.getMemberList(mmNo);
		int totalCount = moimDao.getTotalCountMember(mmNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}
	

}
