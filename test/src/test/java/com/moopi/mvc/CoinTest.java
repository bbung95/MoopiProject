//package com.moopi.mvc;
//
//import java.util.Map;
//
//import org.junit.jupiter.api.Assertions;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.coin.impl.CoinServiceImpl;
//import com.moopi.mvc.service.domain.Coin;
//import com.moopi.mvc.service.domain.Flash;
//import com.moopi.mvc.service.domain.Payment;
//import com.moopi.mvc.service.domain.User;
//import com.moopi.mvc.service.payment.impl.PaymentServiceImpl;
//
//@SpringBootTest
//public class CoinTest {
//
//	@Autowired
//	private CoinServiceImpl coinService;
//
//	// @Test
//	public void contextLoads() {
//	}
//
//	//@Test
//	public void getCoin() throws Exception {
//		// User user = new User();
//		// user.setUserId("user01");
//		System.out.println("Test getCoin() start ::");
//		System.out.println(coinService.getCoin(1));
//		Coin coin = coinService.getCoin(1);
//		System.out.println(coin);
//
//		Assertions.assertEquals("user01", coin.getUserId().getUserId());
//	}
//
//	//@Test
//	public void addPayment() throws Exception {
//		
//		User user = new User();
//		user.setUserId("user02");
//		
//		Flash flash = new Flash();
//		flash.setFlashNo(3);
//		
//		System.out.println("Test addPayment() start ::");
//		Coin coin = new Coin();
//		
//		coin.setCoinNo(0);
//		coin.setCoinRegdate("2021-07-21 06:30:00");
//		coin.setCoinRole(1);
//		coin.setCoinCount(1);
//		coin.setUserId(user);
//		coin.setFlashNo(flash);
//		
//		coinService.addCoin(coin);
//		System.out.println("Test addCoin::"+coin);
//
//	}
//
//	@Test
//	public void updateCoin() throws Exception {
//
//		System.out.println("Test updateCoin() start::");
//		Coin coin = coinService.getCoin(0);
//		coin.setCoinCount(1);
//		coinService.updateCoin(coin);
//		
//		System.out.println("Test updateCoin::" + coin);
//
//	}
//
//	// @Test
//	public void getCoinList() throws Exception {
//
//		System.out.println("Test getCoinList start::");
//		Search search = new Search();
//		search.setSearchCondition(1);
//		search.setSearchKeyword("1");
//
//		Map map = coinService.getCoinList(search);
//		System.out.println("USER_ID is '1' totalList::" + map.get("list"));
//		System.out.println("USER_ID is '1' fUSER_ID Count::" + map.get("totalCount"));
//
//	}
//
//}