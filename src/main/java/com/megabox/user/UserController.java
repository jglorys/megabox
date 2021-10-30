package com.megabox.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@RequestMapping("/sign_in_view")
	public String signIn(Model model) {
		
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/sign_up_view")
	public String signUp(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOutView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		
		return "redirect:/main/megabox";
	}
}
