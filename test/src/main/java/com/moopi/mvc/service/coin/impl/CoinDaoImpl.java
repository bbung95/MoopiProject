//package com.moopi.mvc.service.coin.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.coin.CoinDao;
//import com.moopi.mvc.service.domain.Coin;
//
//@Service("coinDaoImpl")
//public class CoinDaoImpl {
//
//	@Autowired
//	private CoinDao coinDao;
//
//	// Constructor
//	public CoinDaoImpl() {
//		System.out.println(this.getClass());
//	}
//
//	public void addCoin(Coin coin) throws Exception {
//		System.out.println("addCoin ServiceImpl start::");
//		coinDao.addCoin(coin);
//	}
//
//	public Map<String, Object> getCoinList(Search search) throws Exception {
//		System.out.println("getCoinList ServiceImpl start::");
//
//		List<Coin> list = coinDao.getCoinList(search);
//		int totalCount = coinDao.getTotalCount(search);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//
//		return map;
//	}
//
//	public Coin getCoin(int coinNo) throws Exception {
//		System.out.println("getCoin ServiceImpl start::");
//
//		return coinDao.getCoin(coinNo);
//	}
//
//	public void updateCoin(Coin coin) throws Exception {
//		coinDao.updateCoin(coin);
//
//	}
//
//}
