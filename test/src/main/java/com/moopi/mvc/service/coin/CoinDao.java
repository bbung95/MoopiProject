package com.moopi.mvc.service.coin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Coin;

@Mapper
public interface CoinDao {

	public void addCoin(Coin coin) throws Exception;
	
	public void joinCoin(Coin coin) throws Exception;
	
	public List<Coin> coinHistory(Coin coin) throws Exception;
	
	public List<Coin> getCoinList(Search search) throws Exception;
	
	public Coin getCoin(int coinNo) throws Exception;
	
	public void updateCoin(Coin coin) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
