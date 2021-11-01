package com.megabox;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;


@Controller
public class MainController {
	
	@Autowired
	private MovieBO movieBO;
	
	@RequestMapping("/main/megabox")
	public String mainMegabox(Model model) {
		
		List<Movie> movieList =  movieBO.getMovieList();
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "main/megabox");
		return "template/layout";
	}
}
