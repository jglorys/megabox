package com.megabox.admin.movie.model;

import java.util.Date;

public class Movie {
	int id;
	String title;
	String director;
	String genre;
	String actor;
	double rating;
	String releasedDate;
	String isScreening;
	int runningTime;
	String viewingClass;
	String posterImage;
	String introduction;
	int ranking;
	Date createdAt;
	Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getReleasedDate() {
		return releasedDate;
	}
	public void setReleasedDate(String releasedDate) {
		this.releasedDate = releasedDate;
	}
	public String getIsScreening() {
		return isScreening;
	}
	public void setIsScreening(String isScreening) {
		this.isScreening = isScreening;
	}
	public int getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}
	public String getViewingClass() {
		return viewingClass;
	}
	public void setViewingClass(String viewingClass) {
		this.viewingClass = viewingClass;
	}
	public String getPosterImage() {
		return posterImage;
	}
	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
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