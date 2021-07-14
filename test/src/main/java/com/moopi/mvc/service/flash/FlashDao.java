package com.moopi.mvc.service.flash;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.MeetingFlashMember;

@Mapper
public interface FlashDao {

	public void addFlash(Flash flash) throws Exception;
	//public void insertFlash(Flash flash) throws Exception;
	
	public List<Flash> getFlashList(Search search) throws Exception;
	//public List<Flash> getFlashList(Map map) throws Exception; 
	
	public Flash getFlash(@Param("flashNo") int flashNo);
	//public Flash findFlash(int flashNo) throws Exception;
	
	public void updateFlash(Flash flash) throws Exception;
	//public void updateFlash(Flash flash) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	//public int getTotalCount(Search search) throws Exception;
	
	public int getJoinTotalCount(int targetNo) throws Exception;
	
	public void joinFlash(@Param("userId") String userId,
							@Param("flashNo") int flashNo) throws Exception;
	
	public List<MeetingFlashMember> getJoinFlashList(int targetNo) throws Exception;


}

