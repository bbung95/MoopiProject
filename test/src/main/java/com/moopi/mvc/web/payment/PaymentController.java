package com.moopi.mvc.web.payment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.service.coin.impl.CoinService;
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
	
	@Autowired
	private CoinService coinService;
	
	public PaymentController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("addPaymentView")
	public String addPaymentView(@ModelAttribute("payment") 
				Payment payment )throws Exception{
		
		System.out.println("addPaymentView Start::");
		//model.addAttribute("userId",userId);
		
		System.out.println("addPaymentView End::");
		
		return "payment/addPayment";
	}
	
	@RequestMapping("paymentList")
	public String paymentList(@ModelAttribute("payment") Payment payment, Model model, HttpSession session)throws Exception{
		
		//User user = userService.getUserId(userId);
		User user = (User)session.getAttribute("dbUser");
		Coin coin = new Coin();
		payment.setPaymentUserId(user);
		
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
	
	@RequestMapping("coinHistory")
	public String coinHistory(@ModelAttribute("coin") Coin coin ,Model model, HttpSession session) throws Exception{
		
		System.out.println("coinHistory Start::");
		
		User user = (User)session.getAttribute("dbUser");
		
		coin.setCoinUser(user);
		
		Map<String, Object> map = coinService.coinHistory(coin);
		model.addAttribute("coinList",map.get("coinList"));
		
		System.out.println("coinHistory End::");
		
		return "payment/coinHistory";
	}
	
}
