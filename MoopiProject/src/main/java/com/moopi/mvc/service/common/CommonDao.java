package com.moopi.mvc.service.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Notice;

@Mapper
public interface CommonDao {
	
	public Notice getNotice(@Param("noticeNo") int noticeNo);
	
	public List<Notice> getListNotice(@Param("map") Map map);
	
	public void addNotice(@Param("notice") Notice notice);
	
	public void deleteNotice(@Param("noticeNo") int noticeNo);
	
	public int getTotalCount(@Param("search") Search search);
}
