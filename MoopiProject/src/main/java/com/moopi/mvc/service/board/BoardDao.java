package com.moopi.mvc.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.Board;
 
@Mapper
public interface BoardDao {

	
	public void addBoard(@Param("board")Board board);
	
	public List<Board> getBoardList(@Param("map")HashMap map);

	public Board getBoard(@Param("boardNo")int boardNo);
	
	public void updateBoard(@Param("board") Board board);
	
	public void deleteBoard(@Param("board") Board board);
	
	public int getTotalCount(@Param("map")Map map);
	 
	public int getLike(@Param("map")Map map);
		
	public void addLike(@Param("map")Map map);
	
	public void deleteLike(@Param("map")Map map);
	
	

}	
