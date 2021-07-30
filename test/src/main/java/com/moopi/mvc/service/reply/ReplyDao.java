package com.moopi.mvc.service.reply;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Reply;

@Mapper
public interface ReplyDao {

	public void insertReply(@Param("reply")Reply reply) throws Exception;
	
	public List<Reply> getReplyList(@Param("boardNo")int boardNo)throws Exception;

	public Reply updateReply(@Param("reply")Reply reply)throws Exception;
	
	public Reply getReply(@Param("replyNo")int replyNo)throws Exception;
	
	public void deleteReply(@Param("replyNo")int replyNo)throws Exception;
	
	public void deleteReply2(@Param("reply")Reply reply)throws Exception;

	public List<Reply> getReplyListAdmin(@Param("boardNo")int boardNo)throws Exception;

}
