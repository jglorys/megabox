package com.megabox.admin.administrator;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.megabox.admin.administrator.bo.AdministratorBO;
import com.megabox.common.EncryptUtils;

@RequestMapping("/admin")
@RestController
public class AdministratorRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AdministratorBO administratorBO;
	
	@PostMapping("/administrator/sign_in") 
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60); //session 유지시간 = 3600초 = 60분
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		//파라미터로 받은 비밀번호를 해싱한다.
		String encryptPassword = EncryptUtils.md5(password);
		
		// id와 해싱된 비밀번호로 관리자가 맞는지 확인
		boolean isAdmin = administratorBO.checkAdministrator(loginId, encryptPassword);
		if (isAdmin == false) {
			logger.error("[/admin/administrator/sign_in] 관리자 로그인 실패");
			return result;
		}
		session.setAttribute("admin", "admin");
		result.put("result", "success");
		return result;
	}
}
