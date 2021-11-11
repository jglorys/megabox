package com.megabox.moviepost;

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

import com.megabox.moviepost.bo.MoviePostBO;

@RequestMapping("/moviepost")
@RestController
public class MoviePostRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MoviePostBO moviePostBO;
	
	@PostMapping("/create")
	public Map<String, Object> createMoviePost(
								@RequestParam("movieId") int movieId,
								@RequestParam("moviePostContent")String moviePostContent,
								HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			logger.info("[/moviepost/create] session 없음");
			result.put("result", "error");
			return result;
		}
		moviePostBO.addMoviePost(userId, movieId, moviePostContent);
		
		result.put("result", "success");
		return result;
	}
	
	@PostMapping("/delete")
	public Map<String, Object> deleteMoviePost(@RequestParam("moviePostId") int moviePostId,
												HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		moviePostBO.deleteMoviePost(moviePostId);
		
		result.put("result", "success");
		return result;
	}
}
