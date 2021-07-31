package com.moopi.mvc.web.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.spi.FileSystemProvider;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;

import com.google.gson.JsonObject;
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
	
	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().
			substring(0, ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
			+"src/main/resources/static/images/uploadFiles/";
	
	@RequestMapping("listBoard")
	public String getBoardList(@ModelAttribute("search")Search search, @ModelAttribute("category")String category,
			 Model model ) throws Exception {
		
		
		String boardCategory = null;
		Map map = new HashMap();
		System.out.println("getBoardList start;;");
		
		if(search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		boardCategory = boardService.getBoardCategory(category);
		
		System.out.println("====category 값 체크 : "+category);
	    
		map = boardService.getBoardList(search, category, "1");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("boardCategory", boardCategory);
		
		System.out.println(boardCategory);
		
			System.out.println("1111111111111111111111111");
			return "/board/getBoardList";

	}
	
	
	@RequestMapping("getBoard")
	public String getBoard(@ModelAttribute("boardNo") int boardNo, Model model) throws Exception{
		
		System.out.println("getBoard ::");
		board = boardService.getBoard(boardNo);
		
		if(board.getBoardCategory() !="1") {
		List<Reply> list = ReplyService.getReplyList(boardNo);	
		model.addAttribute("list", list);
		}
		String boardCategory = boardService.getBoardCategory(board.getBoardCategory());
		
		model.addAttribute("board", board);
		model.addAttribute("boardCategory", boardCategory);
		System.out.println("보드카테고리값:"+boardCategory);
		
//		return "board/"+boardCategory+"Board/get"+boardCategory+"Board";
		return "/board/getBoard";
	}
	
	
	@RequestMapping("addBoardView")
	public String addBoardView(@ModelAttribute("category")String category, Model model) {
		
		String boardCategory = boardService.getBoardCategory(category);
		System.out.println("보드카테고리값:"+boardCategory);
		model.addAttribute("boardCategory", boardCategory);
		
		
//		return "board/"+boardCategory+"Board/add"+boardCategory+"BoardView";
		return "/board/addBoardView";
	}
	
	@RequestMapping("addBoard")
	public String addBoard(@ModelAttribute("board")Board board, Model model) throws Exception {
		
		
		System.out.println("board 값 : "+board);
		System.out.println("model 값 : "+model);
		
		boardService.addBoard(board);
		System.out.println(board.getBoardNo());
		String boardCategory =boardService.getBoardCategory(board.getBoardCategory());
		model.addAttribute("boardCategory", boardCategory);		
		System.out.println("보드카테고리값:"+boardCategory);
		
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
		System.out.println("보드카테고리값:"+boardCategory);
		
//		return "/board/"+boardCategory+"Board/update"+boardCategory+"BoardView";
		return "/board/updateBoardView";
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
		
			System.out.println("abc");
			return "forward:/board/listBoard?category="+board.getBoardCategory();
	}
	
	
	@PostMapping(value="uploadImage", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
//		
//		String fileRoot = "C:\\test\\";	//`저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
//		File targetFile = new File(fileRoot + savedFileName);	
		File targetFile = new File(saveDir + savedFileName);	
		
		System.out.println(targetFile.toString());
		System.out.println("1111");
		
		try {System.out.println("222");
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/board/uploadImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				System.out.println("222");
				
		} catch (IOException e) {
			System.out.println("333");
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
			System.out.println("333");
		}
		
		System.out.println(jsonObject);
		return jsonObject;
	}
	
}