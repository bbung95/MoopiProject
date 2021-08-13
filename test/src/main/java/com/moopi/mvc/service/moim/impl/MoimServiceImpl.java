package com.moopi.mvc.service.moim.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.moim.MoimDao;

@Service
public class MoimServiceImpl implements MoimService{

	@Autowired
	private MoimDao moimDao;

	public Moim getMoim(int mmNo) {
		System.out.println("모임서비스임플 시작");
		return moimDao.getMoim(mmNo);
	}

	public Moim getMoim(String mmName) {
		return moimDao.getMoim(mmName);
	}

	public void addMoim(Moim moim) throws Exception {
		moimDao.addMoim(moim);
	}

	public Map<String, Object> getInviteList(String mmInterest, String mmAddr, int mmNo) throws Exception {

		List<User> list = moimDao.getInviteList(mmInterest, mmAddr , mmNo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		return map;
	}

	public Map<String, Object> getMoimList(Search search) throws Exception {

		List<Moim> list = moimDao.getMoimList(search);
		int totalCount = moimDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	public Map<String, Object> getMyMoimList(String userId) throws Exception {

		List<Moim> list2 = moimDao.getMyMoimList(userId);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list2", list2);
		return map;
	}

	public void updateMoim(Moim moim) throws Exception {
		moimDao.updateMoim(moim);
	}

	// 테스트만하고 겟리스트로 편입 될 것임
//	public int getTotalCount(Search search) throws Exception{
//		return moimDao.getTotalCount(search);
//	}

	public void applyMoim(Member member) throws Exception {
		moimDao.applyMoim(member);
	}

	public void newApplyMoim(String userId, int mmNo) throws Exception {
		moimDao.newApplyMoim(userId, mmNo);
	}

	public void leaveMoim(String userId, int mmNo) throws Exception {
		moimDao.leaveMoim(userId, mmNo);
	}

	public void refuseApply(int memberNo) throws Exception {
		moimDao.refuseApply(memberNo);
	}

	public void updateMemeber(String userId, int mmNo, int status) throws Exception {
		moimDao.updateMember(userId, mmNo, status);
	}

	public Member checkMember(String userId, int mmNo) throws Exception {
		return moimDao.checkMember(userId, mmNo);
	}

	public Map<String, Object> getMemberList(int mmNo, int status) throws Exception {
		List<Member> list = moimDao.getMemberList(mmNo, status);
		int totalCount = moimDao.getTotalCountMember(mmNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}

	public void addCount(int mmNo) throws Exception {
		moimDao.addCount(mmNo);
	}

	public void subCount(int mmNo) throws Exception {
		moimDao.subCount(mmNo);
	}

	// 신고에 의한 모임폐쇄
	public void updateReportMoim(Moim moim) throws Exception {

		moimDao.updateReportMoim(moim);
	}

}
