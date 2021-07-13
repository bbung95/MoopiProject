package com.moopi.mvc.web.board;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

@Controller
@RequestMapping("/board/*")
public class BoardController{
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private ReplyServiceImpl ReplyService;
	
	@RequestMapping("addBoard")
	public String addBoard(@Param("board")Board board) {
		
		boardService.addBoard(board);
		
		if(board.getBoardCategory() == "1") {
			return "/MoopiBoard/getBoard?boardNo.jsp"+board.getBoardNo();
			
		}else if(board.getBoardCategory() == "2"){
			return "/QnABoard/getBoard?boardNo.jsp"+board.getBoardNo();
			
		}else if(board.getBoardCategory() == "3") {
			return "/UserBoard/getBoard.jsp?boardNo"+board.getBoardNo();
			
		}else if(board.getBoardCategory() == "4") {
			return "/MoimBoard/getBoard.jsp?boardNo"+board.getBoardNo();
			
		}else {
			return "boardCategory가 잘못된값입니다";	
		}
		
		
	}
	  
	
	
	
}