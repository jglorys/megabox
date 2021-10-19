package com.megabox.admin.movie.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
