package com.megabox.moviepost;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.moviepost.bo.MoviePostViewBO;
import com.megabox.moviepost.model.MoviePostView;

@RequestMapping("/moviepost")
@Controller
public class MoviePostController {
	
	@Autowired
	private MoviePostViewBO moviePostViewBO;
	
	@Autowired
	private MovieBO movieBO;
	
	@RequestMapping("/moviepost_list_view")
	public String moviePostListView(Model model) {
		List<MoviePostView> moviePostViewList = moviePostViewBO.getMoviePostViewList();
		model.addAttribute("moviePostViewList", moviePostViewList);
		model.addAttribute("viewName", "moviepost/moviepost_list");
		return "template/layout";
	}
	
	@RequestMapping("/create_view")
	public String moviePostCreateView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			//userId가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		List<Movie> movieList = movieBO.getMovieList();
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "moviepost/moviepost_create");
		return "template/layout";
	}
}
