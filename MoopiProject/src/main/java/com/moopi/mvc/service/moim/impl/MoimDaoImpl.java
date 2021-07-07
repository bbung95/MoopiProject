package com.moopi.mvc.service.moim.impl;

import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.moim.MoimDao;
//import com.moopi.mvc.service.board.impl.SqlSession;
import com.moopi.mvc.service.domain.Moim;

//@Service("moimDaoImpl")
public class MoimDaoImpl implements MoimDao{

	//@Autowired
	//@Qualifier("sqlSessionTemplate")
	//private SqlSession sqlSession;
	
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
	
	public MoimDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertMoim(Moim moim) throws Exception {
		//sqlSession.insert("MoimMapper.insertMoim", moim);
	}

	@Override
	public List<Moim> getMoimList(Search search) throws Exception {
		//return sqlSession.selectList("MoimMapper.getMoimList", search);
		return null;
	}

	@Override
	public Moim findMoim(int mmNo) throws Exception {
		//return sqlSession.selectOne("MoimMapper.getMoim", mmNo);
		return null;
	}

	@Override
	public void updateMoim(Moim moim) throws Exception {
		//sqlSession.update("MoimMapper.updateMoim", moim);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		//return sqlSession.selectOne("MoimMapper.getTotalCount", search);
		return 9999;
	}

	
	
	
	
}
