package com.moopi.mvc.service.reply.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.reply.ReplyDao;
import com.moopi.mvc.service.domain.Reply;

@Service
public class ReplyServiceImpl {

	@Autowired
	private ReplyDao replyDao;
	
	public void addReply(Reply reply){
		replyDao.insertReply(reply);
	}


	public List<Reply> getReplyList(int boardNo) {
		
		
		List<Reply> list = new ArrayList<Reply>();
		list = replyDao.getReplyList(boardNo);
		System.out.println("----boardNo check :  " +boardNo);
		
		return list;
	}

	public void updateReply(Reply reply){
		replyDao.updateReply(reply);
	}
	
	public Reply getReply(int replyNo) {
		return replyDao.getReply(replyNo);
	}
	
	public void deleteReply(Reply reply){
		replyDao.deleteReply(reply);
	}
	
}
