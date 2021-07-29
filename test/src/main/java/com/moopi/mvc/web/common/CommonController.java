package com.moopi.mvc.web.common;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.domain.UserData;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.payment.impl.PaymentServiceImpl;
import com.moopi.mvc.service.report.impl.ReportServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;

@Controller
public class CommonController {

	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private MoimServiceImpl moimService;
	@Autowired
	private FlashServiceImpl flashService;
	@Autowired
	private CommonServiceImpl commonService;
	@Autowired
	private PaymentServiceImpl paymentService;
	@Autowired
	private ReportServiceImpl reportService;

	@Value("${page.pageUnit}")
	int pageUnit;

	@Value("${page.pageSize}")
	int pageSize;

	public CommonController() {
	}

	@RequestMapping("/")
	public String home(Model model) {

		System.out.println("/main");

		model.addAttribute("interest", commonService.getInterest());

		return "index";
	}

	@GetMapping("common/adminMoopi")
	public String adminMoopi(HttpSession session) {

		System.out.println("adminMoopi : GET");
		User user = (User) session.getAttribute("dbUser");
		if (user != null && user.getUserRole().equals("1")) {

			return "common/adminMain";
		}
		return "redirect:/";
	}

	@GetMapping("common/getUserList")
	public String getUsetList(Model model) throws Exception {

		Search search = new Search();

		System.out.println("common/getUsetList : GET");
		model.addAttribute("list", userService.getUserList(search, 0).get("list"));
		model.addAttribute("totalCount", userService.getUserList(search, 0).get("totalCount"));

		return "common/adminUserList";
	}

	@GetMapping("common/getMoimList")
	public String getMoimList(Model model) throws Exception {

		Search search = new Search();

		System.out.println("common/getMoimList : GET");
		model.addAttribute("list", moimService.getMoimList(search).get("list"));
		model.addAttribute("totalCount", moimService.getMoimList(search).get("totalCount"));

		return "common/adminMoimList";
	}

	@GetMapping("common/getFlashList")
	public String getFlashList(Model model) throws Exception {

		Search search = new Search();

		System.out.println("common/getFlashList : GET");
		model.addAttribute("list", flashService.getFlashList(search).get("list"));
		model.addAttribute("totalCount", flashService.getFlashList(search).get("totalCount"));
		return "common/adminFlashList";
	}

	@GetMapping("common/getReportList")
	public String getReportList(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("common/getReportList : GET");
		model.addAttribute("list", reportService.getReportList(search, model).get("list"));
		return "common/adminReportList";
	}

	@RequestMapping("common/getPaymentList")
	public String getPaymentList(@ModelAttribute("payment") Payment payment, @ModelAttribute("search") Search search,
			Model model) throws Exception {

		System.out.println("common/getPaymentList");

//		if(search.getCurrentPage() == null) {
//			search.setCurrentPage(1);
//		}

		model.addAttribute("list", paymentService.adminPaymentList(payment, search).get("list"));
		model.addAttribute("totalCount", paymentService.adminPaymentList(payment, search).get("totalCount"));
		return "common/adminPaymentList";
	}

	@GetMapping("common/getStatistics")
	public String getStatistics(Model model) throws Exception {

		Search search = new Search();

		Map<String, Object> map = paymentService.getMonthList(search);
		Map<String, Object> map2 = paymentService.getWeekList(search);
		Map<String, Object> map3 = paymentService.getDayList(search);
		Map<String, Object> map4 = paymentService.getSelectList(search);
		UserData userData = userService.getJoinPath();
		System.out.println("유저데이터값::::" + userData);
		model.addAttribute("userData", userData);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("list2", map2.get("list2"));
		model.addAttribute("list3", map2.get("list3"));
		model.addAttribute("list4", map2.get("list4"));
		return "common/adminStatistics";
	}

	@RequestMapping(value = "/common/mainSearch")
	public String mainSearch(@RequestParam("type") int type, Search search, HttpSession session, Model model)
			throws Exception {

		System.out.println(search);

		User user = (User) session.getAttribute("dbUser");

		if (type == 1) {
			System.out.println("moimSearch");
			model.addAttribute("list", moimService.getMoimList(search).get("list"));
			if (user != null) {
				model.addAttribute("list2", moimService.getMyMoimList(user.getUserId()).get("list2"));
			}
			return "moim/moimMain";
		} else {

			System.out.println("flashSearch");
			model.addAttribute("list", flashService.getFlashList(search).get("list"));
			return "flash/flashMain";
		}
	}

	@RequestMapping("common/getUserInfo")
	public String getUserInfo( @RequestParam("userId") String userId, 
								Model model) throws Exception {
		userService.getUser(userId);
		System.out.println("이거확인 : "+userService.getUser(userId));
		model.addAttribute("user", userService.getUser(userId));
		return "common/getUserInfo";
	}

//		@CrossOrigin(origins = "http://localhost:82")
//		@GetMapping(value="/chat/chatList")
//		public String chatList() {
//			System.out.println("chatList : GET");
//			return "common/chatList";
//		}
//		
//		@GetMapping(value="/chat/joinRoom")
//		public String joinRoom(@RequestParam("userId") String userId, @RequestParam("trgt") String trgt,
//				@RequestParam("type")String type, Model model) throws Exception {
//			
//			System.out.println("joinRoom : GET");
//			
//			model.addAttribute("user", userService.getUser(userId));
//			model.addAttribute("type", type);
//			if(type.equals("1")) {
//				model.addAttribute("target", userService.getUser(trgt));
//				return "common/chatRoom";
//			}else{
//				model.addAttribute("target", moimService.getMoim(Integer.parseInt(trgt)));
//				return "common/groupRoom";
//			}
//		}
}
