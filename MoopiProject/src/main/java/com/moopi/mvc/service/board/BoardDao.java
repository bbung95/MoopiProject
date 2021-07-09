package com.moopi.mvc.service.board;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Board;
 

public interface BoardDao {

	
	public void insertBoard(Board board) throws Exception;
	
	public List<Board> getBoardList(Search search) throws Exception ;

	public Board getBoard(int boardNo) throws Exception;
	
	public void updateBoard(Board board) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
	 
		
		
	

}	
