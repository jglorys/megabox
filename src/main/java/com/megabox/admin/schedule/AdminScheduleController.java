package com.megabox.admin.schedule;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;
import com.megabox.auditorium.bo.AuditoriumBO;
import com.megabox.auditorium.model.Auditorium;
import com.mysql.cj.util.StringUtils;

@RequestMapping("/admin/schedule")
@Controller
public class AdminScheduleController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AuditoriumBO auditoriumBO;
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@RequestMapping("/schedule_list_view")
	public String scheduleListView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/schedule/schedule_list_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		List<Schedule> scheduleList = scheduleBO.getScheduleList();
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("viewName", "/schedule/schedule_list");
		return "admin/template/layout";
	}
	
	@RequestMapping("/schedule_create_view")
	public String scheduleCreateView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/schedule/schedule_create_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		
		List<Auditorium> auditoriumList = new ArrayList<>();
		List<Movie> movieList = new ArrayList<>();
		
		auditoriumList = auditoriumBO.getAuditoriumList();
		movieList = movieBO.getMovieList();
		
		model.addAttribute("auditoriumList", auditoriumList);
		model.addAttribute("movieList", movieList);
		model.addAttribute("viewName", "/schedule/schedule_create");
		return "admin/template/layout";
	}
}
