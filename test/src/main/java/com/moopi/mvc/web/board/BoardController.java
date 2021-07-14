package com.moopi.mvc.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;

import com.moopi.mvc.common.Search;
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
	
	public Board board;
	
	@RequestMapping("*/list*")
	public String getBoardList(@ModelAttribute("search")Search search,Model model ) {
		
		Map map = new HashMap();
		
		System.out.println("getBoardList start;;");
		if(search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		
		search.setStartRowNum(1);
		search.setEndRowNum(5);
		
		map.put("boardCategory", "1");
		map.put("boardState", "1");
		map.put("search", search);
		
		System.out.println("test");
		map = boardService.getBoardList(map);
		System.out.println(map.get("list").toString());
		model.addAttribute("list", map.get("list"));
		
		return "board/MoopiBoard/listMoopi";
	}
	
	@RequestMapping("*/getBoard*")
	public String getBoard(@ModelAttribute("boardNo") int boardNo, Model model){
		
		System.out.println("getBoard ::");
		board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		
		return "board/MoopiBoard/getMoopiBoard";
	}
	
	@RequestMapping("*/addMoopiBoardView")
	public String addBoardView() {
		
		
		return "board/MoopiBoard/addMoopiBoardView";
	}
	
	
	
	
	@RequestMapping("*/addBoard")
	public String addBoard(@Param("board")Board board) {
		
		boardService.addBoard(board);
		
		if(board.getBoardCategory() == "1") {
			return "/board/MoopiBoard/getMoopiBoard.jsp?boardNo="+board.getBoardNo();
			
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