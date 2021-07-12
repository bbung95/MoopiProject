package com.moopi.mvc.service.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Notice;

@Mapper
public interface CommonDao {
	
	Notice getNotice(@Param("noticeNo") int noticeNo);
	
	List<Notice> getListNotice(@Param("search") Search search, @Param("userId") String userId);
	
	void addNotice(@Param("notice")Notice notice);
	
	void updateNotice(@Param("userId") String userId);
	
	int getTotalCount(@Param("userId") String userId);
	
	void deleteNotice(Map<String, Object> map);
}
