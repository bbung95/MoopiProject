package com.moopi.mvc.service.flash.impl;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;

public interface FlashService {
	
	public void addFlash(Flash flash) throws Exception;

	public Flash getFlash(int flashNo) throws Exception;

	public Map<String, Object> getFlashList(Search search) throws Exception;

	public void updateFlash(Flash flash) throws Exception;

	public void joinFlash(String userId, int flashNo) throws Exception;

	public void joinFlashUpdate(Flash flash) throws Exception;
	
	public Map<String, Object> getJoinFlashList (int targetNo) throws Exception;
	
}
