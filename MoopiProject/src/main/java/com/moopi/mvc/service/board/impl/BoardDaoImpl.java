package com.moopi.mvc.service.board.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.board.BoardDao;
import com.moopi.mvc.service.domain.Board;



//@Service("boardDaoImpl")
public class BoardDaoImpl implements BoardDao {

//	@Autowired
//	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BoardDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void insertBoard(Board board) throws Exception {
		sqlSession.insert("BoardMapper.insertBoard", board);

	}

	@Override
	public List<Board> getBoardList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BoardMapper.getBoardList", search);
	}

	@Override
	public Board getBoard(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BoardMapper.getBoard", prodNo);
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BoardMapper.getTotalCount", search);
	}

}
