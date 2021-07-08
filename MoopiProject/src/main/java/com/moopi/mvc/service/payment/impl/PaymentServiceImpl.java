package com.moopi.mvc.service.payment.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.payment.PaymentDao;
import com.moopi.mvc.service.payment.PaymentService;

@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	
	//Constructor
	public PaymentServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPayment(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Payment getPayment(int PaymentNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getPaymentList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePayment(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
