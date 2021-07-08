package com.moopi.mvc.service.coin.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.CoinService;
import com.moopi.mvc.service.domain.Coin;

@Service("coinServiceImpl")
public class CoinServiceImpl  implements CoinService{

	@Autowired
	//@Qualifier("coinDaoImpl")
	
	//Constructor
	public CoinServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCoin(Coin coin) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Coin getCoin(int coinNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getCoinList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCoin(Coin coin) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
