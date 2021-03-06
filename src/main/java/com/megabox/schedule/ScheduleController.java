package com.megabox.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.schedule.bo.ScheduleViewBO;
import com.megabox.schedule.model.ScheduleView;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {

	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private ScheduleViewBO scheduleViewBO;
	
	@RequestMapping("/movie_schedule_select_view")
	public String movieScheduleSelect(Model model) {

		List<Movie> movieList = movieBO.getMovieList();
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "schedule/movie_schedule_select");
		return "template/layout";
	}
	
	@RequestMapping("/movie_schedule_view")
	public String movieSchedule(Model model,
							@RequestParam("movieId") int movieId
								) {
		Movie movie = movieBO.getMovie(movieId);
		List<ScheduleView> scheduleViewList = scheduleViewBO.getScheduleViewListByMovieId(movieId);
		
		model.addAttribute("movie", movie);
		model.addAttribute("scheduleViewList", scheduleViewList);
		model.addAttribute("viewName", "schedule/movie_schedule");
		return "template/layout";
	}
	
}
