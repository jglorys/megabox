package com.megabox.admin.schedule.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.admin.schedule.dao.ScheduleDAO;
import com.megabox.admin.schedule.model.Schedule;
import com.megabox.auditorium.bo.AuditoriumBO;
import com.megabox.auditorium.model.Auditorium;

@Service
public class ScheduleBO {
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private AuditoriumBO auditoriumBO;
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	
	public void addSchedule(int movieId, int auditoriumId, String time) {
		
		Movie movie = movieBO.getMovie(movieId);
		Auditorium auditorium = auditoriumBO.getAuditorium(auditoriumId);
		String movieTitle = movie.getTitle();
		int auditoriumName = auditorium.getName();
		
		scheduleDAO.insertSchedule(movieId, movieTitle, auditoriumId, auditoriumName, time);
	}
	
	public List<Schedule> getScheduleList() {
		return scheduleDAO.selectScheduleList();
	}
}
