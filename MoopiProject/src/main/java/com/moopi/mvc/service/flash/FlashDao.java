package com.moopi.mvc.service.flash;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;

@Mapper
public interface FlashDao {

	public void insertFlash(@Param("flash") Flash flash);
	//public void insertFlash(Flash flash) throws Exception;
	
	public List<Flash> getFlashList(@Param("search") Search search);
	//public List<Flash> getFlashList(Map map) throws Exception; 
	
	public Flash getFlash(@Param("flashNo") int flashNo);
	//public Flash findFlash(int flashNo) throws Exception;
	
	public void updateFlash(@Param("flash") Flash flash);
	//public void updateFlash(Flash flash) throws Exception;
	
	public int getTotalCount(@Param("search") Search search);
	//public int getTotalCount(Search search) throws Exception;
}
