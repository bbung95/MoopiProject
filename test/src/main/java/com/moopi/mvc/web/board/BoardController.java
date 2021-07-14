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
	public String addBoard(@ModelAttribute("board")Board board, Model model) {
		
		
		System.out.println("board 값 : "+board);
		System.out.println("model 값 : "+model);
		
		boardService.addBoard(board);
		System.out.println(board.getBoardNo());
		
		return "forward:/board/Moopiboard/getBoard?boardNo="+board.getBoardNo();		
		
	
		
		
	}
	
	@RequestMapping("/MoopiBoard/updateView")
	public String updateBoardView(@ModelAttribute("board")Board board, Model model) {
		System.out.println("updateBoardView.jsp 실행");
		System.out.println("1번째 model "+ model);
		System.out.println("1번째 board "+ board);
		
		board=boardService.getBoard(board.getBoardNo());
//		
		System.out.println(board);
		model.addAttribute("board", board);

		return "/board/MoopiBoard/updateMoopiBoardView";
	}
	
	@RequestMapping("/MoopiBoard/updateBoard")
	public String updateBoard(@ModelAttribute("board")Board board, Model model) {
		
		System.out.println("updateBoard실행");
		
		System.out.println("board값 체크"+board);
		System.out.println("model값 체크"+model);
		
		boardService.updateBoard(board);
		
		
		return "forward:/board/MoopiBoard/getBoard?boardNo="+board.getBoardNo();
	}
	
	
	
}