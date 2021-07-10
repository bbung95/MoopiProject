package com.moopi.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.impl.BoardServiceImpl;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;

@SpringBootTest
public class BoardTest {
	
	@Autowired
	private BoardServiceImpl boardService;
	
	private Board board;
	private User user;
	private Moim moim;
	// 무피게시판 조회 
//	@Test
//	public void getMoopiBoard() {
//		
//		System.out.println("Test getMoopiBoard :::");
//		System.out.println(boardService.getMoopiBoard(1));
//		Board board = boardService.getMoopiBoard(1);
//		System.out.println(board);
//		
//		Assertions.assertEquals("공지1", board.getBoardName());
//		Assertions.assertEquals("공지내용1", board.getBoardContent());
//		
//	}
	
	@Test
	public void getBoardList(){
		
		Search search = new Search();
		// "1"  정상 게시글 , "2" 삭제된 게시글
		String boardState = "1";
		
		// "1"  무피게시판 "2" QnA 게시판 "3" 마이홈 게시판, "4" 모임게시판
		String boardCategory = null;
		
		HashMap searchMap = new HashMap();
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		
		searchMap.put("search", search);
		searchMap.put("boardCategory", boardCategory);
		searchMap.put("boardState", boardState);
		
		
		System.out.println("Test getBoardList :::");
		System.out.println(boardService.getBoardList(searchMap));
		Map map = boardService.getBoardList(searchMap);
		System.out.println(map.toString());
		
//		Assertions.assertEquals("공지1", board.getBoardName());
//		Assertions.assertEquals("공지내용1", board.getBoardContent());
	}
	
//	@Test
//	public void addBoard() {
//		
//		
//		user.setUserId("user03");
//		
//		board.setBoardWriter(user);
//		board.setBoardName("새로운질문!");
//		board.setBoardContent("질문합니다");
//		board.setBoardCategory("2");
//		board.setBoardPassword(null);
////		board.setBoardMoimNo(null);
//		System.out.println(board);
//		
//		boardService.addBoard(board);
//		Assertions.assertEquals("새로운질문!", board.getBoardName());
//		Assertions.assertEquals("공지내용1", board.getBoardContent());
//		
//	}
	
	
	
	
}
