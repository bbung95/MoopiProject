package com.moopi.mvc.service.coin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.CoinDao;
import com.moopi.mvc.service.domain.Coin;

@Service("coinDaoImpl")
public class CoinDaoImpl implements CoinDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public CoinDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertCoin(Coin coin) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Coin> getCoinList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Coin findCoin(int coinNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCoin(Coin coin) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
