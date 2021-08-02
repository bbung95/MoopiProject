package com.moopi.mvc.service.coin.impl;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Coin;

public interface CoinService {
	
	public void addCoin(Coin coin) throws Exception;

	public void joinCoin(Coin coin) throws Exception;
	
	public Map<String,Object> coinHistory(Coin coin) throws Exception;
	
	public Coin getCoin(int coinNo) throws Exception;

	public Map<String, Object> getCoinList(Search search) throws Exception;

	public void updateCoin(Coin coin) throws Exception;
}
