package com.moopi.mvc.service.flash.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.flash.FlashDao;

@Service("flashDaoImpl")
public class FlashDaoImpl implements FlashDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// Constructor
	public FlashDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertFlash(Flash flash) throws Exception {
		//sqlSession.insert();

	}

	@Override
	public List<Flash> getFlashList(Search search) throws Exception {
		//return sqlSession.selectList(null);
		return null;
	}

	@Override
	public Flash findFlash(int flashNo) throws Exception {
		//return sqlSession.selectOne(null);
		return null;
	}

	@Override
	public void updateFlash(Flash flash) throws Exception {
		//sqlSession.update(null);

	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		//return sqlSession.selectOne(null);
		return 0;
	}

}
