//package com.moopi.mvc.service.user.impl;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Repository;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.domain.User;
//
////@Repository("sqlSessionTemplate")
//public class UserDaoImpl {
//
////	@Autowired
////	@Qualifier("sqlSessionTemplate")
//	private SqlSession sqlSession;
//	
//	public void setSqlsession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
//	
//	// Constructor
//	public UserDaoImpl() {
//		System.out.println("UserDaoImpl 접근 : "+this.getClass());
//	}
//	
//	// Method
//	public void addUser(User user) throws Exception{
//		sqlSession.insert("UserMapper.addUser", user);
//	}
//	
//	public User getUser(String userId) throws Exception{
//		return sqlSession.selectOne("UserMapper.getUser", userId);
//	}
//	
//	public List<User> getUserList(Search search) throws Exception{
//		return sqlSession.selectList("UserMapper.getUserList", search);
//	}
//	
//	public void updateUser(User user) throws Exception{
//		sqlSession.update("UserMapper.updateUser", user);
//	}
//	
//	
////	public void addUser(User user) throws Exception;
////	
////	public User getUser(String userId) throws Exception;
////	
////	public List<User> getUserList(Search search) throws Exception;
////	
////	public void updateUser(User user) throws Exception;
////	
////	public int getTotalCount(Search search) throws Exception;
//
//}
