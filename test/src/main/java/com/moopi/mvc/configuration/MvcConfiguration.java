//package com.moopi.mvc.configuration;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//import com.moopi.mvc.interceptor.LoggerInterceptor;
//
//@Configuration
//public class MvcConfiguration implements WebMvcConfigurer {
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new LoggerInterceptor())
////		.addPathPatterns("/user/getMyHome"); // 미로그인시 접근불가
////		.addPathPatterns("/user/myInformation")
////		.addPathPatterns("/user/updateLeaveUserView")
////		.addPathPatterns("/user/updateProfile")
////		.addPathPatterns("/user/updateUserView")		
////		.addPathPatterns("/user/updatePwdView")
////		
//		.addPathPatterns("/user/addUserInfo"); // 미로그인시 접근가능
////		.excludePathPatterns("/user/addUserView")
////		.excludePathPatterns("/user/getId")
////		.excludePathPatterns("/user/getMobileAuth")
////		.excludePathPatterns("/user/loginView")
////		.excludePathPatterns("/user/addUserInfo")
////		.excludePathPatterns("/user/searchIdView")
////		.excludePathPatterns("/user/searchUserPwd")
////		.excludePathPatterns("/user/updatePwdView")
////		
////		.excludePathPatterns("/moim/listMoim");		// 모임리스트
////		.excludePathPatterns("/flash/listFlash")	// 번개리스트
////		.excludePathPatterns("/board/listBoard") 	// 무피게시판
////		
////		
////		.addPathPatterns("/report/**")
////		.addPathPatterns("/payment/**");
//		
//		
//
//		
//		
//		// TODO Auto-generated method stub
//		WebMvcConfigurer.super.addInterceptors(registry);
//	}
//	
//	
//
//}
