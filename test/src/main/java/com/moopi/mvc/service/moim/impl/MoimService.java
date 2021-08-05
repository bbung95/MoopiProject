package com.moopi.mvc.service.moim.impl;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Member;
import com.moopi.mvc.service.domain.Moim;

public interface MoimService {
	
	
	public Moim getMoim(int mmNo);

	public Moim getMoim(String mmName);

	public void addMoim(Moim moim) throws Exception;

	public Map<String, Object> getInviteList(String mmInterest, String mmAddr , int mmNo) throws Exception;

	public Map<String, Object> getMoimList(Search search) throws Exception;

	public Map<String, Object> getMyMoimList(String userId) throws Exception;

	public void updateMoim(Moim moim) throws Exception;

	public void applyMoim(Member member) throws Exception;

	public void newApplyMoim(String userId, int mmNo) throws Exception;

	public void leaveMoim(String userId, int mmNo) throws Exception;

	public void refuseApply(int memberNo) throws Exception;

	public void updateMemeber(String userId, int mmNo, int status) throws Exception;

	public Member checkMember(String userId, int mmNo) throws Exception;

	public Map<String, Object> getMemberList(int mmNo, int status) throws Exception;

	public void addCount(int mmNo) throws Exception;

	public void subCount(int mmNo) throws Exception;

	public void updateReportMoim(Moim moim) throws Exception;
}
