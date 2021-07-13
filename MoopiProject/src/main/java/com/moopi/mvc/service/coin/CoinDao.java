package com.moopi.mvc.service.coin;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Coin;

public interface CoinDao {

	public void insertCoin(Coin coin) throws Exception;
	
	public List<Coin> getCoinList(Search search) throws Exception;
	
	public Coin findCoin(int coinNo) throws Exception;
	
	public void updateCoin(Coin coin) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
