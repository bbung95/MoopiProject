package com.moopi.mvc.service.reply.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.reply.ReplyDao;
import com.moopi.mvc.service.domain.Reply;

@Service
public class ReplyServiceImpl {

	@Autowired
	private ReplyDao replyDao;
	
	public Reply addReply(Reply reply)throws Exception{
		
		replyDao.insertReply(reply);
		
		return replyDao.getReply(reply.getReplyNo());
	}


	public List<Reply> getReplyList(int boardNo)throws Exception {
		
		
		List<Reply> list = new ArrayList<Reply>();
		list = replyDao.getReplyList(boardNo);
		System.out.println("----boardNo check :  " +boardNo);
		
		return list;
	}

	public Reply updateReply(Reply reply) throws Exception{
		replyDao.updateReply(reply);
		
		return replyDao.getReply(reply.getReplyNo());
	}
	
	public Reply getReply(int replyNo) throws Exception{
		
		return replyDao.getReply(replyNo);
	}
	
	public void deleteReply(int replyNo) throws Exception{
		
		replyDao.deleteReply(replyNo);
	}
	
	public void deleteReply2(Reply reply) throws Exception{
		
		replyDao.deleteReply2(reply);
	}
	
	public List<Reply> getReplyListAdmin(@Param("boardNo")int boardNo) throws Exception{
		
		List<Reply> list = new ArrayList<Reply>();
		list = replyDao.getReplyListAdmin(boardNo);
		System.out.println("----boardNo check :  " +boardNo);
		
		return list;
	}

}
