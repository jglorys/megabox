package com.megabox.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@Autowired
	private MovieBO movieBO;
	
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
		List<Schedule> scheduleList = scheduleBO.getScheduleByMovieId(movieId);
		Movie movie = movieBO.getMovie(movieId);
		model.addAttribute("movie", movie);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("viewName", "schedule/movie_schedule");
		return "template/layout";
	}
	
}
