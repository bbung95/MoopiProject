package com.moopi.mvc.web.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(this.getClass());
//		 TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@RequestMapping("addProduct.do")
	@RequestMapping(value="addBoard")
	public String addProduct(@ModelAttribute("board") Board board, Model model) 
									throws Exception {
		System.out.println("/addBoard 실행");
		
		boardService.addBoard(board);
		
		model.addAttribute(board);
		
		return "redirect:/board/addBoard.jsp";
		
	}
	
	@RequestMapping(value="getBoard")
	public String getProduct(@RequestParam("boardNo") int boardNo, HttpSession session,
											Model model)throws Exception{
			
		System.out.println("/getBoard 실행");
		Board board =boardService.getBoard(boardNo);
		System.out.println("board check : "+board);

		model.addAttribute(board);
		
		return "forward:/board/getBoardView.jsp";
	}
	
	
	@RequestMapping(value="listBoard")
	public String listProduct(@ModelAttribute("search") Search search, Model model,
								HttpServletRequest request) throws Exception {

		   System.out.println("/board/listBoard : GET / POST ");
		      
	      if( search.getCurrentPage() ==0 ){
	         search.setCurrentPage(1);
	      }
	      search.setPageSize(pageSize);
	      
	      // Business logic ����
	      Map<String , Object> map = boardService.getBoardList(search);
	      
	      Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	      System.out.println(resultPage);

		String title = null;
		String url = null;
		String sc = null;
		String sk = null;

		sc = search.getSearchCondition();
		sk = search.getSearchKeyword();
		
		model.addAttribute("title", title);
		model.addAttribute("url", url);
		model.addAttribute("sc", sc);
		model.addAttribute("sk", sk);
		
		System.out.println("ListBoardAction ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);			
		model.addAttribute("resultPage", resultPage);
		
		System.out.println("resultPage ::"+resultPage);
		System.out.println("jsp 보내기전 list값"+map.get("list"));
		System.out.println("listBoardAction 끝");
		
		return "forward:/board/listBoard.jsp";
	}
	
	@RequestMapping(value="updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board, Model model, HttpSession session) throws Exception{
		
		System.out.println("UpdateBoard 실행");
		
		System.out.println("board check : "+ board);
		boardService.updateBoard(board);
		
		session.setAttribute("board", board);
		 
		return "redirect:/board/getBoard?boardNo="+board.getBoardNo();
		
	}
	
	
}
