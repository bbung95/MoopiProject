//package com.moopi.mvc.service.payment.impl;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Service;
//
//import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.domain.Payment;
//import com.moopi.mvc.service.payment.PaymentDao;
//
//@Service("paymentDaoImpl")
//public class PaymentDaoService implements PaymentDao{
//
//	@Autowired
//	@Qualifier("sqlSessionTemplate")
//	private SqlSession sqlSession;
//
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
//	
//	//Constructor
//	public PaymentDaoService() {
//		System.out.println(this.getClass());
//	}
//
//	@Override
//	public void insertPayment(Payment payment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public List<Payment> getPaymentList(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Payment findPayment(int paymentNo) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void updatePayment(Payment payment) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public int getTotalCount(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//}
