package com.moopi.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Reply;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.reply.impl.ReplyServiceImpl;

@SpringBootTest
public class BoardTest {
	
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private ReplyServiceImpl replyService;
	
	private Board board;
	
	
//	@Test
//	public void getBoardList(){
//		
//		Search search = new Search();
//		// "1"  정상 게시글 , "2" 삭제된 게시글
//		String boardState = "1";
//		
//		// "1"  무피게시판 "2" QnA 게시판 "3" 마이홈 게시판, "4" 모임게시판
//		String boardCategory = null;
//		
//		HashMap searchMap = new HashMap();
//		search.setStartRowNum(1);
//		search.setEndRowNum(3);
//		
//		searchMap.put("search", search);
//		searchMap.put("boardCategory", boardCategory);
//		searchMap.put("boardState", boardState);
//		
//		
//		System.out.println("Test getBoardList :::");
//		System.out.println(boardService.getBoardList(searchMap));
//		Map map = boardService.getBoardList(searchMap);
//		System.out.println(map.toString());
//		
////		Assertions.assertEquals("공지1", board.getBoardName());
////		Assertions.assertEquals("공지내용1", board.getBoardContent());
//	}
	
//	// 게시글조회 + 댓글리스트까지 함께 조회	
//	@Test
//	public void getBoard() {
//	
//			
//		int boardNo = 12;
//		System.out.println("Test getBoard :::");
//		
//		board = boardService.getBoard(boardNo);
//		
//		List<Reply> list = replyService.getReplyList(boardNo);
//		
//		System.out.println(board);
//		System.out.println("--------------------");
//		System.out.println(list);
//	}
//	
	
	@Test
	public void addBoard() {
		
		User user = new User();
		user.setUserId("user3");
		Board board = new Board();
		
		board.setBoardCategory("2");		
		board.setBoardWriter(user);
		board.setBoardName("새로운질문!");
		board.setBoardContent("질문합니다");
		
		System.out.println(board.getBoardWriter().getUserId());
		
		board.setBoardPassword("1231");
		System.out.println(board);
		 boardService.addBoard(board);
	
		 System.out.println(board.getBoardNo());
	}
	
//		
//	@Test
//	public void updateBoard() {
//		
//		System.out.println("Test updateBoard :::");
//		int boardNo = 18; 
//		Board board = boardService.getBoard(boardNo);
//		
//		System.out.println(board);
//		board.setBoardName("수정된질문!");
//		board.setBoardContent("수정된질문합니다");
//		
//		System.out.println(board.getBoardWriter().getUserId());
//		
//		System.out.println(board);
//		boardService.updateBoard(board);
//	}
	
//	@Test
//	public void deleteBoard() {
//		
//		System.out.println("Test deleteBoard :::");
//		int boardNo = 18; 
//		Board board = boardService.getBoard(boardNo);
//		
//		System.out.println(board);
//		board.setBoardState("2");
//		
//		System.out.println(board.getBoardWriter().getUserId());
//		
//		System.out.println(board);
//		boardService.deleteBoard(board);
//		
//	}
	
//	public void getReply() {
//		
//		System.out.println("Test getReply :::");
//		int replyNo = 10;
//		Reply reply = replyService.getReply(replyNo);
//		
//		System.out.println(reply);
//	}
	
	
	
	
//	@Test
//	public void updateReply() {
//		
//		System.out.println("Test updateReply :::");
//		int replyNo = 10; 
//		Reply reply = replyService.getReply(replyNo);
//		
//		reply.setReplyContent("수정된리플합니다");
//		replyService.updateReply(reply);
//		
//		System.out.println(reply);
//	}
//	
//	@Test
//	public void deleteReply() {
//		
//		System.out.println("Test deleteReply :::");
//		int replyNo = 10; 
//		Reply reply = replyService.getReply(replyNo);
//		
//		reply.setReplyState("2");
//		replyService.deleteReply(reply);
//		
//		System.out.println(reply);
//	}
	
	
	
}
