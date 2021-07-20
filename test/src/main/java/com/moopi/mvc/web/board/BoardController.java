package com.moopi.mvc.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;

import com.moopi.mvc.common.Page;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

@Controller
@RequestMapping("/board/*")
public class BoardController{
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired 
	private ReplyServiceImpl ReplyService;
	
	public Board board;
	public String getCategory = null;
	
	@Value("${page.pageUnit}")
	int pageUnit;
	
	@Value("${page.pageSize}")
	int pageSize;
	
	@RequestMapping("listBoard")
	public String getBoardList(@ModelAttribute("search")Search search, @ModelAttribute("category")String category ,Model model ) throws Exception {
		
		String boardCategory = null;
		Map map = new HashMap();
		System.out.println("getBoardList start;;");
		
		
		if(search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		
		boardCategory = boardService.getBoardCategory(category);
		
		System.out.println("====category 값 체크 : "+category);
		
		 if( search.getCurrentPage() ==0 ){
	         search.setCurrentPage(1);
	      }
	      search.setPageSize(pageSize);
		
		map = boardService.getBoardList(search, category, "1");
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		System.out.println(boardCategory);
		
		
		if(boardCategory == "4") {
			return "moim/listMoimBoard";
		}else {
			return "/board/"+boardCategory+"Board/list"+boardCategory;
		}
	}
	
	
	@RequestMapping("getBoard")
	public String getBoard(@ModelAttribute("boardNo") int boardNo, Model model) throws Exception{
		
		System.out.println("getBoard ::");
		board = boardService.getBoard(boardNo);
		
		if(board.getBoardCategory() !="1") {
		List<Reply> list = ReplyService.getReplyList(boardNo);	
		model.addAttribute("list", list);
		}
		model.addAttribute("board", board);
	
		String boardCategory = boardService.getBoardCategory(board.getBoardCategory());
		
		return "board/"+boardCategory+"Board/get"+boardCategory+"Board";
	}
	
	@RequestMapping("addBoardView")
	public String addBoardView(@ModelAttribute("category")String category) {
		
		String boardCategory = boardService.getBoardCategory(category);
		System.out.println(boardCategory);
		
		return "board/"+boardCategory+"Board/add"+boardCategory+"BoardView";
	}
	
	
	
	
	@RequestMapping("addBoard")
	public String addBoard(@ModelAttribute("board")Board board, Model model) throws Exception {
		
		
		System.out.println("board 값 : "+board);
		System.out.println("model 값 : "+model);
		
		boardService.addBoard(board);
		System.out.println(board.getBoardNo());
		String boardCategory =boardService.getBoardCategory(board.getBoardCategory());
		
		System.out.println(boardCategory);
		
		return "forward:/board/getBoard?boardNo="+board.getBoardNo();		
		
	
		
		
	}
	
	@RequestMapping("updateView")
	public String updateBoardView(@ModelAttribute("board")Board board, Model model) throws Exception {
		System.out.println("updateBoardView.jsp 실행");
		System.out.println("1번째 model "+ model);
		System.out.println("1번째 board "+ board);
		
		board=boardService.getBoard(board.getBoardNo());
		System.out.println(board);
		model.addAttribute("board", board);
		
		String boardCategory = boardService.getBoardCategory(board.getBoardCategory()); 

		return "/board/"+boardCategory+"Board/update"+boardCategory+"BoardView";
	}
	
	@RequestMapping("updateBoard")
	public String updateBoard(@ModelAttribute("board")Board board, Model model) throws Exception {
		
		System.out.println("updateBoard실행");
		
		System.out.println("board값 체크"+board);
		System.out.println("model값 체크"+model);
		
		boardService.updateBoard(board);
		
		return "forward:/board/getBoard?boardNo="+board.getBoardNo();	
	}
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(@ModelAttribute("board")Board board, Model model) throws Exception {
		
		System.out.println("deleteBoard 실행");
		String boardCategory = null;
		board = boardService.getBoard(board.getBoardNo());
		board.setBoardState("2");
		boardService.deleteBoard(board);
		
	    boardCategory = boardService.getBoardCategory(board.getBoardCategory());
		
		
		System.out.println(boardCategory);
		
		return "forward:/board/listBoard?category="+board.getBoardCategory();
		
	}
	
	
	
}