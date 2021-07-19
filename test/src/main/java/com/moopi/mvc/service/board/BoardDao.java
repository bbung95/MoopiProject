package com.moopi.mvc.service.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.Board;
 
@Mapper
public interface BoardDao {

	
	public void addBoard(@Param("board")Board board) throws Exception;
	
	public List<Board> getBoardList(@Param("map")Map map) throws Exception;

	public Board getBoard(@Param("boardNo")int boardNo)throws Exception;
	
	public void updateBoard(@Param("board") Board board)throws Exception;
	
	public void deleteBoard(@Param("board") Board board)throws Exception;
	
	public int getTotalCount(@Param("map")Map map)throws Exception;
	 
	public int getLike(@Param("map")Map map)throws Exception;
		
	public void addLike(@Param("map")Map map)throws Exception;
	
	public void deleteLike(@Param("map")Map map)throws Exception;
	
	public Board checkPassword(@Param("boardNo")int boardNo)throws Exception;
}	
