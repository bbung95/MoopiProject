package com.moopi.mvc.web.payment;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.domain.Coin;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.payment.impl.PaymentService;
import com.moopi.mvc.service.user.impl.UserService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private UserService userService;
	
	public PaymentController() {
		System.out.println(this.getClass());
	}
	
//	@RequestMapping("addPayment")
//	public String addPayment(@ModelAttribute("payment") 
//				Payment payment, @RequestParam("userId") String userId) throws Exception{
//		
//		System.out.println("addPayment Start::");
//		User user = new User();
//		user.setUserId(userId);
//		payment.setPaymentUserId(user);
//		
//		System.out.println("addPayment End::");
//		
//		return "payment/addPayment";
//	}
	
	@RequestMapping("addPaymentView")
	public String addPaymentView(@ModelAttribute("payment") 
				Payment payment )throws Exception{
		
		System.out.println("addPaymentView Start::");
		//model.addAttribute("userId",userId);
		
		System.out.println("addPaymentView End::");
		
		return "payment/addPayment";
	}
	
	@RequestMapping("paymentList")
	public String paymentList(@ModelAttribute("payment") Payment payment, Model model,
			@RequestParam("userId") String userId )throws Exception{
		
		//User user = userService.getUserId(userId);
		User user = userService.getUser(userId);
		Coin coin = new Coin();
		Flash flash = new Flash();
		//user.setCoin(coin);
		payment.setPaymentUserId(user);
		flash.getFlashNo();
		coin.setCoinUser(user);
		coin.setFlash(flash);
		
		System.out.println("paymentList Start::");
		Map<String, Object> map = paymentService.paymentList(payment);
		model.addAttribute("list",map.get("list"));
//		Map<String, Object> map2 = coinService.coinHistory(coin);
//		model.addAttribute("coinList",map2.get("coinList"));
		
		//model.addAttribute("user",map.get("user"));
		//model.addAttribute("payment", payment);
		
		System.out.println("payment::"+payment);
		System.out.println("paymentList End::");
		
		return "payment/paymentList";
	}
	
	
	
}
