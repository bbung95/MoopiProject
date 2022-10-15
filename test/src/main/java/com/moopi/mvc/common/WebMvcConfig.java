//package com.moopi.mvc.common;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class WebMvcConfig implements WebMvcConfigurer {
//
//	public static final String saveDir = ClassLoader.getSystemResource("./static/").getPath().
//			substring(0, ClassLoader.getSystemResource("./static/").getPath().lastIndexOf("bin"))
//			+"src/main/resources/static/images/uploadFiles/";
//
//
//
//	//web root가 아닌 외부 경로에 있는 리소스를 url로 불러올 수 있도록 설정
//    //현재 localhost:8090/summernoteImage/1234.jpg
//    //로 접속하면 C:/summernote_image/1234.jpg 파일을 불러온다.
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/board/uploadImage/**")
//                .addResourceLocations("file:///"+saveDir);
////        		.addResourceLocations("file:///C:/test/");
//        		System.out.println("asd"+saveDir);
//        		// 파일이 저장되는 경로.
//    }
//}
