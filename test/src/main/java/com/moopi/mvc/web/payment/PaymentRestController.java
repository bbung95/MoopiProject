package com.moopi.mvc.web.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.payment.impl.PaymentServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@RestController
@RequestMapping("/payment/*")
public class PaymentRestController {

	@Autowired
	private PaymentServiceImpl paymentService;

	@Autowired
	private UserServiceImpl userService;

	public PaymentRestController() {
		System.out.println(this.getClass());
	}

	@PostMapping("/payment/addPayment")
	public void addPayment(int amount, Payment payment, String userId) throws Exception {
		
		int paymentCoinCount = amount / 100;
		System.out.println("amount::::" + amount);
		System.out.println("paymentRest start!!!!!!!!!!!!!!!!!!!!!!!");

		User user = userService.getUserId(userId);
		payment.setPaymentPrice(amount);

		System.out.println("paymentCoinCount::" + paymentCoinCount);
		payment.setPaymentCoinCount(paymentCoinCount);
		payment.setPaymentUserId(user);

		paymentService.addPayment(payment);

		user.setCoin(paymentCoinCount);
		user.setUserId(userId);
		userService.paymentUpdateCoin(user);

		System.out.println("paymentRest End!!!!!!!!!!!!!!!!!!!!!!!");
	}

}
