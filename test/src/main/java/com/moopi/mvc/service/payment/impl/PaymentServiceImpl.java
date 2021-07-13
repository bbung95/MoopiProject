package com.moopi.mvc.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.payment.PaymentDao;

@Service("paymentServiceImpl")
public class PaymentServiceImpl {

	@Autowired
	// @Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;

	// Constructor
	public PaymentServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addPayment(Payment payment) throws Exception {

		System.out.println("addPayment ServiceImpl start::");
		paymentDao.addPayment(payment);

	}

	public Payment getPayment(int PaymentNo) throws Exception {
		System.out.println("getPayment ServiceImpl start::");
		return paymentDao.getPayment(PaymentNo);
	}

	public Map<String, Object> getPaymentList(Search search) throws Exception {
		System.out.println("getPaymentList ServiceImpl start::");

		List<Payment> list = paymentDao.getPaymentList(search);
		int totalCount = paymentDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	public void updatePayment(Payment payment) throws Exception {
		paymentDao.updatePayment(payment);

	}

}
