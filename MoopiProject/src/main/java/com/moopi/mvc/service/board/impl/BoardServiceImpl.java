<<<<<<< HEAD
package com.moopi.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.BoardDao;
import com.moopi.mvc.service.board.BoardService;
import com.moopi.mvc.service.domain.Board;



//@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	@Qualifier("boardDaoImpl")
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	public BoardServiceImpl(){
		System.out.println(this.getClass());
	}
	
	
	@Override
	public void addBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		boardDao.insertBoard(board);

	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.getBoard(boardNo);
	}

	@Override
	public Map<String, Object> getBoardList(Search search) throws Exception {
		
		List<Board> list= boardDao.getBoardList(search);
		int totalCount =  boardDao.getTotalCount(search); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(search+" serviceimpl");
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		
		boardDao.updateBoard(board);

	}

}
=======
//package com.moopi.mvc.service.board.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.board.BoardDao;
//import com.moopi.mvc.service.board.BoardService;
//import com.moopi.mvc.service.domain.Board;
//
//
//
//@Service("boardServiceImpl")
//public class BoardServiceImpl implements BoardService {
//
//	@Autowired
//	@Qualifier("boardDaoImpl")
//	private BoardDao boardDao;
//	
//	public void setBoardDao(BoardDao boardDao) {
//		this.boardDao = boardDao;
//	}
//	
//	public BoardServiceImpl(){
//		System.out.println(this.getClass());
//	}
//	
//	
//	@Override
//	public void addBoard(Board board) throws Exception {
//		// TODO Auto-generated method stub
//		boardDao.insertBoard(board);
//
//	}
//
//	@Override
//	public Board getBoard(int boardNo) throws Exception {
//		// TODO Auto-generated method stub
//		return boardDao.findBoard(boardNo);
//	}
//
//	@Override
//	public Map<String, Object> getBoardList(Search search) throws Exception {
//		
//		List<Board> list= boardDao.getBoardList(search);
//		int totalCount =  boardDao.getTotalCount(search); 
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(search+" serviceimpl");
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
//	}
//
//	@Override
//	public void updateBoard(Board board) throws Exception {
//		
//		boardDao.updateBoard(board);
//
//	}
//
//}
>>>>>>> refs/remotes/origin/master
