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
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Notice;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {

	/// Field
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyServiceImpl replyService;

	@Autowired
	private CommonServiceImpl commomService;

	@Autowired
	private BoardServiceImpl boardService;

	public ReplyRestController() {
		System.out.println(this.getClass());
	}

	public User user;

	@PostMapping(value = "json/addReply")
	public Reply addReply(@RequestBody Reply reply) throws Exception {

		System.out.println("/reply/json/getReply : POST");
		System.out.println(reply);

		// 댓글 알림
		if(reply.getType() != 0) {
			Notice notice = new Notice();
			Board board = boardService.getBoard(reply.getBoardNo());
				notice.setNoticeType("6");
				notice.setBoard(board);	
				notice.setToUserId(board.getBoardWriter().getUserId());
				notice.setNoticeUser(reply.getReplyWriter());
				notice.setNoticeContent(reply.getReplyContent());
				
			commomService.addNotice(notice);
		}
		
		reply = replyService.addReply(reply);
		System.out.println("111111" + reply.getReplyNo());
		return reply;

	}

	@RequestMapping(value = "json/getReplyList/{boardNo}", method = RequestMethod.GET)
	public List getReplyList(@PathVariable int boardNo) throws Exception {

		System.out.println("/reply/json/getReplyList : GET");
		System.out.println(boardNo);

		List<Reply> list = replyService.getReplyList(boardNo);

		return list;
	}

	@RequestMapping(value = "json/getReply/{replyNo}")
	public Reply getReply(@PathVariable int replyNo) throws Exception {

		System.out.println("/reply/json/getReply ");
		System.out.println(replyNo);

		return replyService.getReply(replyNo);
	}

	@PostMapping(value = "json/updateReply")
	public Reply updateReply(@RequestBody Reply reply) throws Exception {

		System.out.println("reply/json/updateReply 실행");

		System.out.println("reply check : " + reply);

		return replyService.updateReply(reply);

	}

	@RequestMapping(value = "json/deleteReply/{replyNo}")
	public int deleteReply(@PathVariable int replyNo) throws Exception {

		System.out.println("/reply/json/deleteReply ");
		System.out.println(replyNo);

		replyService.deleteReply(replyNo);

		return 1;
	}

}
