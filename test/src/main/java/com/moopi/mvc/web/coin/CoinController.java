package com.moopi.mvc.web.coin;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.coin.impl.CoinServiceImpl;
import com.moopi.mvc.service.domain.Coin;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.payment.impl.PaymentServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/coin/*")
public class CoinController {

	@Autowired
	private FlashServiceImpl flashService;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private CoinServiceImpl coinService;

	
	public CoinController() {
		System.out.println(this.getClass());
	}

	
	@RequestMapping("coinHistory")
	public String coinHistory(@ModelAttribute("coin") Coin coin ,Model model,
			@RequestParam("userId") String userId) throws Exception{
		
		System.out.println("coinHistory Start::");
		
		User user = userService.getUser(userId);
		Flash flash = new Flash();
		flash.getFlashNo();
		coin.setCoinUser(user);
		coin.setFlash(flash);
		
		Map<String, Object> map = coinService.coinHistory(coin);
		model.addAttribute("coinList",map.get("coinList"));
		
		System.out.println("coinHistory End::");
		
		return "coin/coinHistory";
	}


}
