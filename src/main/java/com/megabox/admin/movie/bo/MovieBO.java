package com.megabox.admin.movie.bo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.megabox.admin.movie.dao.MovieDAO;
import com.megabox.common.FileManagerService;

@Service
public class MovieBO {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Autowired 
	private FileManagerService fileManagerService;
	
	public int createMovie(
			String admin,
			String title,
			String director,
			String genre,
			String actor,
			String rating,
			String releasedDate,
			String isScreening,
			String runningTime,
			String viewingClass,
			MultipartFile file,
			String introduction,
			String ranking
			) {
		String imagePath = null;
		
		if (file != null) {
			try {
				imagePath = fileManagerService.saveFile(imagePath, file);
			} catch (IOException e) {
				// 이미지는 실패하고 글만 올라가게
				imagePath = null;
			}
		}
		return movieDAO.insertMovie(title, director, genre, actor, rating, releasedDate, isScreening, runningTime, viewingClass, imagePath, introduction, ranking);
	}
}
