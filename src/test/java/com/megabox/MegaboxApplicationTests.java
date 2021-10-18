package com.megabox;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.megabox.test.bo.TestBO;

@SpringBootTest
class MegaboxApplicationTests {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private TestBO testBO;
	
	
	@Test
	void contextLoads() {
		logger.debug("### Hello world!!! ###");
	}
	
	@Test
	void 더하기테스트() {
		logger.debug("$$$$ 더하기 테스트 시작!!!");
		
		int a = 10;
		int b = 20;
		assertEquals(30, sum(a,b)); //20이랑 비교하면 빨간색뜸
	}
	
	//얘는 테스트 어노테이션 안붙여도 호출됨
	int sum(int x, int y) {
		return x + y;
	}
	
	@Transactional
	// 해당 메소드에 crud가 있으면 롤백이 됨 (디비에 들어갔던 것도 다시 빼줌)
	@Test
	void 디비테스트() {
		assertNotNull(testBO.getTestList());
		//BO에서 출력한 값이 null 인지 아닌지 확인
	}
}
