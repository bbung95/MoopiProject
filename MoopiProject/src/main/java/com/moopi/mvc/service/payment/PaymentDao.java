package com.moopi.mvc.service.payment;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;

public interface PaymentDao {

	public void insertPayment(Payment payment) throws Exception;
	
	public List<Payment> getPaymentList(Search search) throws Exception;
	
	public Payment findPayment(int paymentNo) throws Exception;
	
	public void updatePayment(Payment payment) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
}
