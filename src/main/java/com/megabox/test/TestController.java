package com.megabox.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.megabox.test.bo.TestBO;

@Controller
public class TestController {
	
	@Autowired
	private TestBO testBO;
	
	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		return "hello world!";
	}
	
	// DB연동 테스트
	@RequestMapping("/test2")
	@ResponseBody
	public List<Map<String, Object>> test2() {
		return testBO.getTestList();
	}
	
	//JSP 연동 테스트
	@RequestMapping("/test3")
	public String test3() {
		return "test/test";
	}
}
