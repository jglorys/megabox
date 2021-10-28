package com.megabox.admin.schedule.model;

import java.util.Date;

public class Schedule {
	int id;
	int movieId;
	String movieTitle;
	int auditoriumId;
	int auditoriumName;
	String time;
	Date createdAt;
	Date updatedAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getAuditoriumId() {
		return auditoriumId;
	}
	public void setAuditoriumId(int auditoriumId) {
		this.auditoriumId = auditoriumId;
	}
	public int getAuditoriumName() {
		return auditoriumName;
	}
	public void setAuditoriumName(int auditoriumName) {
		this.auditoriumName = auditoriumName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
}
