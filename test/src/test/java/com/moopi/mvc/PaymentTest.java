package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.payment.impl.PaymentServiceImpl;

@SpringBootTest
public class PaymentTest {

	@Autowired
	private PaymentServiceImpl paymentService;

	// @Test
	public void contextLoads() {
	}

	//@Test
	public void getPayment() throws Exception {
		//User user = new User();
		
		
		System.out.println("Test getPayment() start ::");
		System.out.println(paymentService.getPayment(1));
		Payment payment = paymentService.getPayment(1);
		System.out.println(payment);
		
		//Assertions.assertEquals("user01", ((User)payment.getPaymentUserId()));
		//System.out.println("user value::"+((User)payment.getPaymentUserId()));
		Assertions.assertEquals(1000, payment.getPaymentPrice());
	}

	//@Test
	public void addPayment() throws Exception {

		User user = new User();
		user.setUserId("user01");

		System.out.println("Test addPayment() start ::");
		Payment payment = new Payment();
		
		payment.setPaymentNo(3);
		payment.setPaymentRegdate("2021-07-21 06:30:00");
		payment.setPaymentRole(1);
		payment.setPaymentUserId(user);
		payment.setPaymentPrice(3000);
		payment.setPaymentCoinCount(30);
		payment.setPaymentUid("imp_123123123123");
		
		paymentService.addPayment(payment);
		System.out.println("Test addPayment::" + payment);

	}

	//@Test
	public void updatePayment() throws Exception {

		System.out.println("Test updatePayment() start::");
		Payment payment = paymentService.getPayment(2);
		payment.setPaymentRole(2);
		payment.setPaymentCoinCount(10);
		paymentService.updatePayment(payment);
				
		System.out.println("Test update payment::" + payment);

		

	}

	@Test
	public void getPaymentList() throws Exception {

		System.out.println("Test getPaymentList start::");
		Search search = new Search();
		search.setSearchCondition(1);
		search.setSearchKeyword("1");

		Map map = paymentService.getPaymentList(search);
		System.out.println("PAYMENT_ROLE is '1' totalList::" + map.get("list"));
		System.out.println("PAYMENT_ROLE is '1' flashCount::" + map.get("totalCount"));

	}

}