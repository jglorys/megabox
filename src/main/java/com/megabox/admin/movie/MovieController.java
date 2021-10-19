package com.megabox.admin.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/movie")
@Controller
public class MovieController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/movie_list_view")
	public String movieListView(
						Model model,
						HttpServletRequest request) {
		// 관리자 로그인된 상태에서만 페이지 접근 가능
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (admin.equals("")) {
			//세션에 admin 없으면 로그인 하는 페이지로 보낸다 (redirect)
			logger.info("[/admin/movie/movie_list_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";	
		}
		
		model.addAttribute("viewName", "movie/movie_list");
		return "admin/template/layout";
	}
	
	@RequestMapping("/movie_create_view")
	public String movieCreateView(
						Model model,
						HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (admin.equals("")) {
			logger.info("[/admin/movie/movie_create_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		model.addAttribute("viewName", "movie/movie_create");
		return "admin/template/layout";
	}
}
