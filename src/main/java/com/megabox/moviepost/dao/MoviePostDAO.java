package com.megabox.moviepost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.moviepost.model.MoviePost;

@Repository
public interface MoviePostDAO {
	
	public void insertMoviePost(
								@Param("userId") int userId,
								@Param("movieId") int movieId, 
								@Param("content") String content);

	public List<MoviePost> selectMoviePostList();

	public void deleteMoviePost(int id);
}
