package com.moopi.mvc.web.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

@RestController
@RequestMapping("/board/json/*")
public class BoardRestController {

	

	@Autowired
	private BoardServiceImpl boardService;
	
	
	public Board board;
	public String getCategory = null;
	
	
	@RequestMapping("checkPassword/{boardNo}/{boardPassword}")
	public Board checkPassword(@PathVariable("boardNo")int boardNo,@PathVariable("boardPassword")String boardPassword) throws Exception {
		
		System.out.println("checkPassword 실행");
		System.out.println(boardNo+" : "+boardPassword);
		board = boardService.checkPassword(boardNo);
		System.out.println("완료"+board.getBoardPassword());
		
		return board;
	}
	
}
