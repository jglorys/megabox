package com.megabox.admin.administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdministratorController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/administrator/sign_in_view")
	public String signInView() {
		return "admin/administrator/sign_in";
	}
	
	@RequestMapping("/administrator/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		
		
		 if ( admin.equals("") ) { // session 없음
		 logger.info("[/admin/administrator/sign_out] session 없음"); 
		 return "redirect:/admin/administrator/sign_in_view"; 
		 }
		 
		// session 초기화
		session.invalidate();
		// redirect 뒤에는 RequestMapping의 URL이 들어감
		return "redirect:/admin/administrator/sign_in_view";
	}

}
