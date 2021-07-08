//package com.moopi.mvc.service.reply.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.reply.ReplyDao;
//import com.moopi.mvc.service.domain.Reply;
//
//public class ReplyServiceImpl {
//
//	@Autowired
//	@Qualifier("replyDaoImpl")
//	private ReplyDao replyDao;
//	
//	public void setReplyDao(ReplyDao replyDao) {
//		this.replyDao = replyDao;
//	}
//	
//	public ReplyServiceImpl(){
//		System.out.println(this.getClass());
//	}
//	
//	
//	public void addReply(Reply reply) throws Exception {
//		// TODO Auto-generated method stub
//		replyDao.insertReply(reply);
//
//	}
//
//
//	public Map<String, Object> getReplyList(Search search) throws Exception {
//		
//		List<Reply> list= replyDao.getReplyList(search);
//		int totalCount =  replyDao.getTotalCount(search); 
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(search+" serviceimpl");
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
//	}
//
//	public void updateReply(Reply reply) throws Exception {
//		
//		replyDao.updateReply(reply);
//
//	}
//}
