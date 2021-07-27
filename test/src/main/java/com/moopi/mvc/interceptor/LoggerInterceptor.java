//package com.moopi.mvc.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.util.ObjectUtils;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.moopi.mvc.service.domain.User;
//
//public class LoggerInterceptor implements HandlerInterceptor{
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
//		User user = (User)session.getAttribute("loginUser");
//		
//		if(ObjectUtils.isEmpty(user)) {
//			
//		}
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
