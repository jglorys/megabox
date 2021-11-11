package com.megabox.moviepost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.moviepost.dao.MoviePostDAO;
import com.megabox.moviepost.model.MoviePost;

@Service
public class MoviePostBO {

	@Autowired 
	private MoviePostDAO moviePostDAO;
	
	public void addMoviePost(int userId, int movieId, String content) {
		moviePostDAO.insertMoviePost(userId, movieId, content);
	}
	
	public List<MoviePost> getMoviePostList() {
		List<MoviePost> moviePostList = moviePostDAO.selectMoviePostList();
		return moviePostList;
	}
	
	public void deleteMoviePost (int id) {
		moviePostDAO.deleteMoviePost(id);
	}
}
