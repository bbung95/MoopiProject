package com.moopi.mvc.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Board;

public interface BoardService {

	public void addBoard(Board board) throws Exception;

	public Board getBoard(int boardNo) throws Exception;

	public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState) throws Exception;

	public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState, int boardMoimNo) throws Exception;

	public Map<String, Object> getBoardList(Search search, String boardCategory, String boardState, String userId) throws Exception;

	public void updateBoard(Board board) throws Exception;

	public void deleteBoard(Board board) throws Exception;

	public int getLike(String userId, String target) throws Exception;

	public void addLike(String userId, String target) throws Exception;

	public void deleteLike(String userId, String target) throws Exception;

	public String getBoardCategory(String category);

	public Board checkPassword(int boardNo) throws Exception;

	public void deleteBoard2(Board board) throws Exception;

}
