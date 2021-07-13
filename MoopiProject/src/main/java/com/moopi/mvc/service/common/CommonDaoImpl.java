package com.moopi.mvc.service.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Notice;

@Mapper
public interface CommonDaoImpl {
	
	Notice getNotice(@Param("noticeNo") int noticeNo);
	
	List<Notice> getListNotice(@Param("map") Map map);
	
	void addNotice(@Param("notice") Notice notice);
	
	void deleteNotice(@Param("noticeNo") int noticeNo);
	
	int getTotalCount(@Param("search") Search search);
}
