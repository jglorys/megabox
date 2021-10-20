package com.megabox.admin.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.mysql.cj.util.StringUtils;

@RequestMapping("/admin/movie")
@Controller
public class AdminMovieController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MovieBO movieBO;
	
	@RequestMapping("/movie_list_view")
	public String movieListView(
						Model model,
						HttpServletRequest request) {
		// 관리자 로그인된 상태에서만 페이지 접근 가능
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			//세션에 admin 없으면 로그인 하는 페이지로 보낸다 (redirect)
			logger.info("[/admin/movie/movie_list_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";	
		}
		List<Movie> movieList = movieBO.getMovieList();
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "movie/movie_list");
		return "admin/template/layout";
	}
	
	@RequestMapping("/movie_create_view")
	public String movieCreateView(
						Model model,
						HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/movie/movie_create_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		model.addAttribute("viewName", "movie/movie_create");
		return "admin/template/layout";
	}
	
	@RequestMapping("/movie_update_view")
	//?movieId=${movie.id}
	public String movieUpdateView(
				HttpServletRequest request,
				Model model,
				@RequestParam("movieId") int movieId
			) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/movie/movie_update_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		
		Movie movie = movieBO.getMovie(movieId);
		model.addAttribute("movie", movie);
		model.addAttribute("viewName", "movie/movie_update");
		return "admin/template/layout";
	}
	
}
