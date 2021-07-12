package com.moopi.mvc.service.reply.impl;

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


	public Map getReplyList(int boardNo) {
		
		Map<String, Object> map = new HashMap();
		map= replyDao.getReplyList(boardNo);
		System.out.println("----boardNo check :  " +boardNo);
		return map;
	}

	public void updateReply(Reply reply) throws Exception {
		replyDao.updateReply(reply);
	}
}
