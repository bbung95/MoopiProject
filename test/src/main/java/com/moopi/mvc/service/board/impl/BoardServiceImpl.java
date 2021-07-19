package com.moopi.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.BoardDao;
import com.moopi.mvc.service.domain.Board;



@Service
public class BoardServiceImpl {

	@Autowired
	private BoardDao boardDao;
	
	public String getCategory = null;
	
	public void addBoard(Board board) throws Exception  {
		
	boardDao.addBoard(board);

	}

	
	public Board getBoard(int boardNo) throws Exception{
		
		return boardDao.getBoard(boardNo);
	}


	public Map<String, Object> getBoardList(Map map) throws Exception{
		
		
		List<Board> list= boardDao.getBoardList(map);
//		int totalCount =  boardDao.getTotalCount(map); 

		map.put("list", list);
//		map.put("totalCount", totalCount);
		
		return map;
	}


//	public Map<String, Object> getBoardList(Search search, String boadCategory, int orderType) throws Exception{
//		
//		if(orderType=="1") {
//			
//		}else if()
//		
//		List<Board> list= boardDao.getBoardList(map);
////		int totalCount =  boardDao.getTotalCount(map); 
//
//		map.put("list", list);
////		map.put("totalCount", totalCount);
//		
//		return map;
//	}
	
	
	public void updateBoard(Board board) throws Exception{
		boardDao.updateBoard(board);

	}
	

	public void deleteBoard(Board board) throws Exception{
		boardDao.deleteBoard(board);

	}
	
	public int getLike(Map map) throws Exception {
	
		return boardDao.getLike(map);
	}
	
	public void addLike(Map map) throws Exception {
		
		boardDao.addLike(map);
	}
	
	public void deleteLike(Map map) throws Exception {
		
		boardDao.deleteLike(map);
	}
	
	public String getBoardCategory(String category) {
		
		if(category.equals("1")) {
			getCategory = "Moopi";
		}else if(category.equals("2")) {
			getCategory = "QnA";
		}else if(category.equals("3")) {
			getCategory = "Myhome";
		}else if(category.equals("4")) {
			getCategory = "Moim";
		}
		
		System.out.println(getCategory);
		
		return getCategory;
	}
	
	public Board checkPassword(int boardNo) throws Exception {
		
		return boardDao.checkPassword(boardNo);
	}
	
	//관리자 제재로 인한 블라인드처리.
	public void deleteBoard2(Board board) throws Exception{
		
		boardDao.deleteBoard2(board);

	}
	
	

}