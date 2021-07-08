package com.moopi.mvc.service.letter.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Letter;
import com.moopi.mvc.service.letter.LetterDao;

@Service("letterDaoImpl")
public class LetterDaoImpl implements LetterDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public LetterDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertLetter(Letter letter) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Letter> getLetterList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter findLetter(int letterNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateLetter(Letter letter) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
