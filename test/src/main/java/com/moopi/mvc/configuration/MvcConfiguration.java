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
//		
////		// 인터셉터등록 : 비회원은 접근불가
////		.addPathPatterns("/moim/listMoim");		// 모임리스트
////		
////		// 인터셉터예외 : 비회원도 접근가능
////		.excludePathPatterns("/user/addUserView")
//		
//		// 유저 인터셉터예외
//		.excludePathPatterns("/user/loginView/")
//		.excludePathPatterns("/user/addUserView")
//		.excludePathPatterns("/user/addUserInfo")
//		.excludePathPatterns("/user/getMobileAuth")
//		.excludePathPatterns("/user/searchIdView")
//		.excludePathPatterns("/user/updatePwdView")
//		.excludePathPatterns("/user/searchUserPwd")
//		
//		.addPathPatterns("/user/getMyHome")
//		.addPathPatterns("/user/updateProfile")
//		
//
//		
////		 addPathPatterns("/**") : URL 전체를 인터셉터로 제어
////		 excludePathPatterns(notLoadList) : /, /login, /loginProcess URL을 제외하고 인터셉터로 제어
//		
//		// 인터셉터등록
//		.addPathPatterns("/moim/listMoim");		// 모임리스트
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
