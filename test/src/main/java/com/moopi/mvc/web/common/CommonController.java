package com.moopi.mvc.web.common;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moopi.mvc.common.Page;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.common.impl.CommonService;
import com.moopi.mvc.service.domain.Payment;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.domain.UserData;
import com.moopi.mvc.service.flash.impl.FlashService;
import com.moopi.mvc.service.moim.impl.MoimService;
import com.moopi.mvc.service.payment.impl.PaymentService;
import com.moopi.mvc.service.report.impl.ReportService;
import com.moopi.mvc.service.user.impl.UserService;

@Controller
public class CommonController {

	@Autowired
	private UserService userService;
	@Autowired
	private MoimService moimService;
	@Autowired
	private FlashService flashService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ReportService reportService;

	@Value("${page.pageUnit}")
	int pageUnit;

	@Value("10")
	int pageSize;

	public CommonController() {
	}

	@RequestMapping("/")
	public String main(Model model) {

		System.out.println("/main");

		model.addAttribute("interest", commonService.getInterest());

		return "main";
	}

	@GetMapping("common/adminMoopi")
	public String adminMoopi(HttpSession session) {

		System.out.println("adminMoopi : GET");
		User user = (User) session.getAttribute("dbUser");
		if (user != null && user.getUserRole().equals("1")) {

			return "common/adminStatistics";
		}
		return "redirect:/";
	}

	@RequestMapping("common/getUserList")
	public String getUsetList(@ModelAttribute Search search, @RequestParam(defaultValue = "0") int searchState, Model model) throws Exception {

		System.out.println("common/getUsetList : GET");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		
		Map<String, Object> map = userService.getUserList(search, searchState);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("totalCount", map.get("totalCount"));

		return "common/adminUserList";
	}

	@RequestMapping("common/getMoimList")
	public String getMoimList(@ModelAttribute Search search , Model model) throws Exception {
		
		System.out.println("common/getMoimList : GET");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = moimService.getMoimList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("totalCount", map.get("totalCount"));

		return "common/adminMoimList";
	}

	@RequestMapping("common/getFlashList")
	public String getFlashList(@ModelAttribute Search search , Model model) throws Exception {

		System.out.println("common/getFlashList : GET");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
				
		Map<String, Object> map = flashService.getFlashList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("resultPage", resultPage);
		
		return "common/adminFlashList";
	}

	@RequestMapping("common/getReportList")
	public String getReportList(@ModelAttribute("search") Search search, Model model) throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		
		Map<String, Object> map = reportService.getReportList(search, model );
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
		
		
		System.out.println("common/getReportList : GET");
		
		model.addAttribute("list", reportService.getReportList(search, model).get("list"));
		model.addAttribute("resultPage", resultPage);
		
		return "common/adminReportList";
	}

	@RequestMapping("common/getPaymentList")
	public String getPaymentList(@ModelAttribute("payment") Payment payment, @ModelAttribute("search") Search search,
			Model model) throws Exception {

		System.out.println("common/getPaymentList");

		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
			
		Map<String, Object> map = paymentService.adminPaymentList(payment, search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("option", payment.getOption());
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("totalCount", map.get("totalCount"));
		
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

		System.out.println("써치의값:::"+search);
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("dbUser");
		
		model.addAttribute("interest", commonService.getInterest());
		
		if (type == 1) {
			System.out.println("moimSearch");
			
			model.addAttribute("search", search);
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

}
