package com.megabox.admin.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.admin.schedule.model.Schedule;

@Repository
public interface ScheduleDAO {
	
	public void insertSchedule(
			@Param("movieId") int movieId,
			@Param("movieTitle") String movieTitle,
			@Param("auditoriumId") int auditoriumId,
			@Param("auditoriumName") int auditoriumName,
			@Param("time") String time);
	
	public List<Schedule> selectScheduleList();
}
