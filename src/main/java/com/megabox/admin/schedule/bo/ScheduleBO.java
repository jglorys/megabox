package com.megabox.admin.schedule.bo;

import java.util.ArrayList;
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
	
	public List<Schedule> getScheduleByMovieId(int movieId) {
		return scheduleDAO.selectScheduleByMovieId(movieId);
	}
	
	public Schedule getSchedule(int id) {
		return scheduleDAO.selectSchedule(id);
	}
	
	public List<String> getMovieTitleByDate(int date) {
		List<String> movieTitleList = new ArrayList<>();
		String yyyymmdd = Integer.toString(date);
		List<Schedule> scheduleList = getScheduleList();
		for (Schedule schedule : scheduleList) {
			if (schedule.getTime().startsWith(yyyymmdd)) {
				String movieTitle = schedule.getMovieTitle();
				if(movieTitleList.contains(movieTitle)) {
					//배열에 이미 동일한 영화Title 존재
					continue;
				}
				movieTitleList.add(movieTitle);
			}
		}
		return movieTitleList;
	}
}
