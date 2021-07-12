package com.moopi.mvc.service.reply;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Reply;

@Mapper
public interface ReplyDao {

	public void insertReply(@Param("reply")Reply reply);
	
	public Map getReplyList(@Param("boardNo")int boardNo);

	public void updateReply(@Param("reply")Reply reply);
	
	
}
