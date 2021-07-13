package com.moopi.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.BoardDao;
import com.moopi.mvc.service.domain.Board;
import com.moopi.mvc.service.domain.FollowLike;
import com.moopi.mvc.service.domain.User;



@Service
public class BoardServiceImpl {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private FollowLike followLike;
	
	
	public void addBoard(Board board)  {
		
	boardDao.addBoard(board);

	}

	
	public Board getBoard(int boardNo){
		
		return boardDao.getBoard(boardNo);
	}


	public Map<String, Object> getBoardList(HashMap map){
		
		
		List<Board> list= boardDao.getBoardList(map);

		map.put("list", list);
		
		return map;
	}


	public void updateBoard(Board board){
		boardDao.updateBoard(board);

	}
	

	public void deleteBoard(Board board){
		boardDao.deleteBoard(board);

	}
	
	public int getLike(FollowLike followLike) {
		
		return boardDao.getLike(followLike);
	}
	
	public void addLike(FollowLike followLike) {
		
		boardDao.addLike(followLike);
	}
	
}