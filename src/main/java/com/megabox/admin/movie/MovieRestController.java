package com.megabox.admin.movie;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.megabox.admin.movie.bo.MovieBO;

@RequestMapping("/admin/movie")
@RestController
public class MovieRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MovieBO movieBO;
	
	@PostMapping("/create")
	public Map<String, Object> movieCreate(
			@RequestParam("title") String title,
			@RequestParam("director") String director,
			@RequestParam("releasedDate") String releasedDate,
			@RequestParam("genre") String genre,
			@RequestParam("actor") String actor,
			@RequestParam("rating") String rating,
			@RequestParam("runningTime") String runningTime,
			@RequestParam("ranking") String ranking,
			@RequestParam("isScreening") String isScreening,
			@RequestParam("viewingClass") String viewingClass,
			@RequestParam("introduction") String introduction,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		String n = null;
		if (admin.equals(n)) {
			logger.info("[/admin/movie/create] session 없음");
			return result;
		}
		
		int row = movieBO.createMovie(admin, title, director, genre, actor, rating, releasedDate, isScreening, runningTime, viewingClass, file, introduction, ranking);
		
		result.put("result", "success");
		return result;
		
	}
}
