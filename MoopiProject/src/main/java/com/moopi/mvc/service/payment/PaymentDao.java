package com.moopi.mvc.service.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;

@Mapper
public interface PaymentDao {
	
	public Payment findPayment(@Param("paymentNo") int paymentNo);
	
//	public void insertPayment(Payment payment) throws Exception;
//	
//	public List<Payment> getPaymentList(Search search) throws Exception;
//	
//	public Payment findPayment(int paymentNo) throws Exception;
//	
//	public void updatePayment(Payment payment) throws Exception;
//	
//	public int getTotalCount(Search search) throws Exception;
	
}
