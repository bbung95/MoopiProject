//package com.moopi.mvc.service.reply.impl;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.domain.Reply;
//import com.moopi.mvc.service.reply.ReplyDao;
//
//public class ReplyDaoImpl implements ReplyDao {
//
//	public ReplyDaoImpl() {
//		// TODO Auto-generated constructor stub
//	}
//	
//private SqlSession sqlSession;
//	
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
//	
//	
//	public void insertReply(Reply board) throws Exception {
//		sqlSession.insert("ReplyMapper.insertReply", board);
//
//	}
//
//	@Override
//	public List<Reply> getReplyList(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("ReplyMapper.getReplyList", search);
//	}
//
//
//	@Override
//	public void updateReply(Reply board) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.update("ReplyMapper.updateReply", board);
//	}
//
//	@Override
//	public int getTotalCount(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("ReplyMapper.getTotalCount", search);
//	}
//	
//	
//
//}
