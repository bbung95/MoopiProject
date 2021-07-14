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
	
	
	public void addBoard(Board board)  {
		
	boardDao.addBoard(board);

	}

	
	public Board getBoard(int boardNo){
		
		return boardDao.getBoard(boardNo);
	}


	public Map<String, Object> getBoardList(Map map){
		
		
		List<Board> list= boardDao.getBoardList(map);
//		int totalCount =  boardDao.getTotalCount(map); 

		map.put("list", list);
//		map.put("totalCount", totalCount);
		
		return map;
	}


	public void updateBoard(Board board){
		boardDao.updateBoard(board);

	}
	

	public void deleteBoard(Board board){
		boardDao.deleteBoard(board);

	}
	
	public int getLike(Map map) {
	
		return boardDao.getLike(map);
	}
	
	public void addLike(Map map) {
		
		boardDao.addLike(map);
	}
	
	public void deleteLike(Map map) {
		
		boardDao.deleteLike(map);
	}

}