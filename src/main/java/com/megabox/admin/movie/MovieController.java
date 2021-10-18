package com.megabox.admin.movie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class MovieController {
	
	@RequestMapping("/movie/movie_list_view")
	public String movieListView(Model model) {
		
		model.addAttribute("viewName", "movie/movie_list");
		return "template/layout";
	}
}
