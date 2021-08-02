package com.moopi.mvc.web.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.payment.impl.PaymentService;
import com.moopi.mvc.service.user.impl.UserService;

@RestController
@RequestMapping("/payment/*")
public class PaymentRestController {

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private UserService userService;

	public PaymentRestController() {
		System.out.println(this.getClass());
	}

	@PostMapping("/payment/addPayment")
	public void addPayment(int amount, Payment payment, String userId) throws Exception {
		
		int paymentCoinCount = amount / 100;
		System.out.println("amount::::" + amount);
		System.out.println("paymentRest start!!!!!!!!!!!!!!!!!!!!!!!");

		User user = userService.getUser(userId);
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
