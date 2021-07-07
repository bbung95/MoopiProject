package com.moopi.mvc.service.board;


 
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Board;



public interface BoardService {
	
	public void addBoard(Board board) throws Exception;

	public Board getBoard(int prodNo) throws Exception;

	public Map<String, Object> getBoardList(Search search) throws Exception;

	public void updateBoard(Board product) throws Exception;
	
}