package com.moopi.mvc.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.moopi.mvc.interceptor.MyCustomInterceptor;


@Configuration
public class MyConfig implements HandlerInterceptor {
    
	public void addInterceptors ( InterceptorRegistry registry){
        registry.addInterceptor (new MyCustomInterceptor())
        .addPathPatterns("/user/getMyHome")
        .addPathPatterns("/user/loginView")
        .addPathPatterns("/moim/**");
 
    }
}