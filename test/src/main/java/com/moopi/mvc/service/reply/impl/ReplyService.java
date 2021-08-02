package com.moopi.mvc.service.reply.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.Reply;

public interface ReplyService {
	
	public Reply addReply(Reply reply)throws Exception;

	public List<Reply> getReplyList(int boardNo)throws Exception;

	public Reply updateReply(Reply reply) throws Exception;
	
	public Reply getReply(int replyNo) throws Exception;
	
	public void deleteReply(int replyNo) throws Exception;
	
	public void deleteReply2(Reply reply) throws Exception;
	
	public List<Reply> getReplyListAdmin(@Param("boardNo")int boardNo) throws Exception;
}
