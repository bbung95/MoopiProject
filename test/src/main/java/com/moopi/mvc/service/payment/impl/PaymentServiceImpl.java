package com.moopi.mvc.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.payment.PaymentDao;
import com.moopi.mvc.service.user.UserDao;

@Service("paymentServiceImpl")
public class PaymentServiceImpl {

	@Autowired
	// @Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	private UserDao userdao;
	
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

	public Map<String, Object> paymentList(Payment payment) throws Exception{
		System.out.println("paymentList ServiceImpl start::");
		
		User user = new User();
		user.getCoin();
		
		List<Payment> list = paymentDao.paymentList(payment);
		//int totalCount = paymentDao.getTotalCount(payment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("user", user);
		//map.put("totalCount", totalCount);
		System.out.println("list::"+list);
		
		return map;
	}
	
	//admin paymentList
	public Map<String, Object> adminPaymentList(Payment payment,Search search)throws Exception{
		
		List<Payment> list = paymentDao.adminPaymentList(payment, search);
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
