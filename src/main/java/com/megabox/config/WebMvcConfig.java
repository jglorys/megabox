package com.megabox.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")	// http://localhost/images/qwer_1633347398902/KakaoTalk_20180224_215432988.jpg
		.addResourceLocations("file:///C:\\Users\\jglor\\웹개발\\6_spring_project\\megabox\\images\\admin/"); 
		//  실제 파일 저장 위치
		// "file:///"  맨 앞에 붙이기  ,   맨뒤에 "/"붙이기!
	}
	
}
