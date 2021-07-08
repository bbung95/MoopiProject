package com.moopi.mvc.service.reply;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Reply;

public interface ReplyDao {

	public void insertReply(Reply reply) throws Exception;
	
	public List<Reply> getReplyList(Search search) throws Exception ;

	public void updateReply(Reply reply) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
	
}
