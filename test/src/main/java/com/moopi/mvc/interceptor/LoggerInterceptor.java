//package com.moopi.mvc.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//import com.moopi.mvc.service.domain.User;
//
//public class LoggerInterceptor extends HandlerInterceptorAdapter {
//	
//	private final Logger logger = LoggerFactory.getLogger(this.getClass());
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		logger.debug("========================================================");
//		logger.debug("======================= BEGIN ==========================");
//		logger.debug("Request URI ===> " + request.getRequestURI());
//		
//		HttpSession session = request.getSession();
//		User loginUser = (User) session.getAttribute("user");
//		System.out.println("Interceptor실행 : "+loginUser);
//		
//		if(loginUser == null) {
//			response.sendRedirect(request.getContextPath()+"/user/loginView");
//			return false;
//		}
//		
//		return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		logger.debug("======================== END ===========================");
//		logger.debug("========================================================");
//		
//	}
//	
//	
//	
//
//}
