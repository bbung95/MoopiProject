package com.moopi.mvc.service.coin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.CoinDao;
import com.moopi.mvc.service.domain.Coin;

@Service("coinServiceImpl")
public class CoinServiceImpl {

	@Autowired
	// @Qualifier("coinDaoImpl")
	private CoinDao coinDao;

	// Constructor
	public CoinServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addCoin(Coin coin) throws Exception {
		System.out.println("addCoin ServiceImpl start::");
		coinDao.addCoin(coin);
	}

	public Coin getCoin(int coinNo) throws Exception {
		System.out.println("getCoin ServiceImpl start::");

		return coinDao.getCoin(coinNo);
	}

	public Map<String, Object> getCoinList(Search search) throws Exception {
		System.out.println("getCoinList ServiceImpl start::");

		List<Coin> list = coinDao.getCoinList(search);
		int totalCount = coinDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	public void updateCoin(Coin coin) throws Exception {
		coinDao.updateCoin(coin);

	}

}
