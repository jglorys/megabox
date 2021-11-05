package com.megabox.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	//실제 저장된 파일과 이미지 패스를 매핑해줌
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")	// http://localhost/images/... 으로 연결하겠다
		.addResourceLocations("file:///C:\\Users\\jglor\\웹개발\\6_spring_project\\megabox\\images/"); 
		//  실제 파일 저장 위치
		// "file:///"  맨 앞에 붙이기  ,   맨뒤에 "/"붙이기! - FileManagerService의 ADMIN_FILE_UPLOAD_PATH와 일치해야 함
	}
	
}
