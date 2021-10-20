package com.megabox.admin.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.admin.movie.model.Movie;


@Repository
public interface MovieDAO {

	public int insertMovie(
			@Param("title") String title,
			@Param("director") String director,
			@Param("genre") String genre,
			@Param("actor") String actor,
			@Param("rating") String rating,
			@Param("releasedDate") String releasedDate,
			@Param("isScreening") String isScreening,
			@Param("runningTime") String runningTime,
			@Param("viewingClass") String viewingClass,
			@Param("posterImage") String posterImage,
			@Param("introduction") String introduction,
			@Param("ranking") String ranking
			);
	
	public List<Movie> selectMovieList();
	
	public Movie selectMovie(int id);
	
	public void updateMovie(
			@Param("id") int id, 
			@Param("rating") String rating, 
			@Param("isScreening") String isScreening,  
			@Param("ranking") String ranking, 
			@Param("introduction") String introduction);
}
