package com.megabox.moviepost.model;

import com.megabox.admin.movie.model.Movie;
import com.megabox.user.model.User;

public class MoviePostView {
	private MoviePost moviePost;
	private User user;
	private Movie movie;
	
	public MoviePost getMoviePost() {
		return moviePost;
	}
	public void setMoviePost(MoviePost moviePost) {
		this.moviePost = moviePost;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	
	
}
