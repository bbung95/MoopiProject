package com.moopi.mvc.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.moopi.mvc.service.domain.User;

public class MyCustomInterceptor implements HandlerInterceptor{


    public boolean preHandle (	HttpServletRequest request,
    							HttpServletResponse response ) throws Exception {
    	System.out.println("====================START====================");
    	System.out.println("=============================================");
        
    	HttpSession session = request.getSession();
    	User dbUser = (User)session.getAttribute("user");
    	System.out.println("Interceptor시작 : "+dbUser);
    	
    	// session에 담긴 유저가 없을 경우 로그인페이지로 이동하게끔 설정
    	if (dbUser == null) {
    		response.sendRedirect(request.getContextPath()+"/user/loginView");
    		return false;
    	}
    	
    	// session에 유저가 있을 경우 계속 실행
    	return true;
    }
}