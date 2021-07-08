package com.moopi.mvc.service.payment;

import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;

public interface PaymentService {

	public void addPayment(Payment payment) throws Exception;
	
	public Payment getPayment(int PaymentNo) throws Exception;
	
	public Map<String, Object> getPaymentList(Search search) throws Exception;
	
	public void updatePayment(Payment payment) throws Exception;
	
}
