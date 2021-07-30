package com.moopi.mvc.service.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;

@Mapper
public interface PaymentDao {
	
	public List<Payment> paymentList(Payment payment) throws Exception;
	
	public Payment getPayment(@Param("paymentNo") int paymentNo);
	
	public void addPayment(Payment payment) throws Exception;
	
	public List<Payment> getPaymentList(Search search) throws Exception;
	
	public void updatePayment(Payment payment) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public List<Payment> adminPaymentList(@Param("payment") Payment payment, @Param("search") Search search) throws Exception;
	
	
	//차트에서 추가했습니다.
	public List<Payment> getMonthList(Search search) throws Exception;
	
	public List<Payment> getWeekList(Search search) throws Exception;
	
	public List<Payment> getDayList(Search search) throws Exception;
	
	public List<Payment> getSelectList(Search search) throws Exception;
	
	
}
