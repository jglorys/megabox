package com.megabox.moviepost.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.movie.model.Movie;
import com.megabox.moviepost.model.MoviePost;
import com.megabox.moviepost.model.MoviePostView;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@Service
public class MoviePostViewBO {
	
	@Autowired
	private MoviePostBO moviePostBO;
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private UserBO userBO;

	public List<MoviePostView> getMoviePostViewList() {
		List<MoviePostView> moviePostViewList = new ArrayList<>();
		List<MoviePost> moviePostList = moviePostBO.getMoviePostList();
		for (MoviePost moviePost : moviePostList) {
			//MoviePostView => moviePost / user / movie
			MoviePostView moviePostView = new MoviePostView();
			//1. moviePost
			moviePostView.setMoviePost(moviePost);
			//2. user
			int userId = moviePost.getUserId();
			User user = userBO.getUser(userId);
			moviePostView.setUser(user);
			//3. movie
			int movieId = moviePost.getMovieId();
			Movie movie = movieBO.getMovie(movieId);
			moviePostView.setMovie(movie);
			
			moviePostViewList.add(moviePostView);
		}
		return moviePostViewList;
	}
}
