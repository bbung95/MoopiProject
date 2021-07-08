package com.moopi.mvc.service.flash;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;

public interface FlashDao {

	public void insertFlash(Flash flash) throws Exception;
	
	public List<Flash> getFlashList(Search search) throws Exception; 
	
	public Flash findFlash(int flashNo) throws Exception;
	
	public void updateFlash(Flash flash) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
