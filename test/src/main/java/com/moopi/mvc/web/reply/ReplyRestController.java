package com.moopi.mvc.web.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;


@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {


	///Field
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyServiceImpl replyService;
	
	public ReplyRestController(){
		System.out.println(this.getClass());
	}	

	public User user;
	
	@PostMapping( value="json/addReply")
	public Reply addReply(@RequestBody Reply reply) throws Exception{
		
		System.out.println("/reply/json/getReply : POST");
		System.out.println(reply);
		replyService.addReply(reply);
		
		return replyService.getReply(reply.getReplyNo());
	}

	@RequestMapping( value="json/getReplyList/{boardNo}", method=RequestMethod.GET )
	public List getReplyList( @PathVariable int boardNo){ 
		
		
		System.out.println("/product/json/getProductList : GET");
		System.out.println(boardNo);

		List<Reply> list= replyService.getReplyList(boardNo);
		
		return list; 
	}
	
	@PostMapping( value="json/getReply")
	public Reply getReply( @PathVariable int replyNo){ 
		
		
		System.out.println("/reply/json/getReply ");
		System.out.println(replyNo);

		
		
		return replyService.getReply(replyNo);
	}	
	
	
//	@RequestMapping(value="json/updateProduct/{value}")
//	public void updateProduct(@ModelAttribute("product") Product product ,Model model) throws Exception{
//		
//		System.out.println("product/json/updateProduct ����");
//		
//		System.out.println("product check : "+ product);
//		
//		productService.updateProduct(product);
//		
//	}
//	
}
