package com.moopi.mvc.web.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

public class ReplyController {

//
//	///Field
//	@Autowired
//	@Qualifier("replyServiceImpl")
//	private ReplyServiceImpl replyService;
//	
//	public ReplyController(){
//		System.out.println(this.getClass());
//	}	
//
//	@RequestMapping( value="json/getReplyList/{boardNo}", method=RequestMethod.GET )
//	public List getReplyList( @PathVariable int boardNo){ 
//		
//		
//		System.out.println("/product/json/getProductList : GET");
//		System.out.println(boardNo);
//
//		List<Reply> list= replyService.getReplyList(boardNo);
//		
//		return list; 
//	}
	
}
