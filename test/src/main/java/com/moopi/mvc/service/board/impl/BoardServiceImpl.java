package com.moopi.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.BoardDao;
import com.moopi.mvc.service.domain.Board;



@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	public String getCategory = null;
	
	public void addBoard(Board board) throws Exception  {
		
	boardDao.addBoard(board);

	}

	
	public Board getBoard(int boardNo) throws Exception{
		
		boardDao.updateHit(boardNo);
		return boardDao.getBoard(boardNo);
	}

	
	public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCategory", boardCategory);
		map.put("boardState", boardState);
		map.put("search", search);
		
		List<Board> list= boardDao.getBoardList(map);
		int totalCount =  boardDao.getTotalCount(map); 

		map.put("list", list);
		map.put("totalCount", totalCount);
		System.out.println(map);
		return map;
	}
	
	public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState, int boardMoimNo) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCategory", boardCategory);
		map.put("boardState", boardState);
		map.put("search", search);
		map.put("boardMoimNo", boardMoimNo);
		
		List<Board> list= boardDao.getBoardList(map);
		int totalCount =  boardDao.getTotalCount(map); 

		map.put("list", list);
		map.put("totalCount", totalCount);
		System.out.println(map);
		return map;
	}
	
public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState, String userId) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCategory", boardCategory);
		map.put("boardState", boardState);
		map.put("search", search);
		map.put("userId", userId);
		
		List<Board> list= boardDao.getBoardList(map);
		int totalCount =  boardDao.getTotalCount(map); 

		map.put("list", list);
		map.put("totalCount", totalCount);
		System.out.println(map);
		return map;
	}
		
	
	public void updateBoard(Board board) throws Exception{
		boardDao.updateBoard(board);

	}
	

	public void deleteBoard(Board board) throws Exception{
		
		boardDao.deleteBoard(board);
	}
	
	public int getLike(String userId, String target) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("likeTarget", target);
	
		return boardDao.getLike(map);
	}
	
	public void addLike(String userId, String target) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("likeTarget", target);
		
		boardDao.addLike(map);
	}
	
	public void deleteLike(String userId, String target) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("likeTarget", target);
		
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