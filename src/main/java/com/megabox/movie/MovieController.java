package com.megabox.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;

@RequestMapping("/movie")
@Controller
public class MovieController {
	
	@Autowired
	private MovieBO movieBO;
	
	@RequestMapping("/movie_list_view")
	public String movieListView(Model model) {
		
		List<Movie> movieList =  movieBO.getMovieList();
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "movie/movie_list");
		return "template/layout";
	}
}
