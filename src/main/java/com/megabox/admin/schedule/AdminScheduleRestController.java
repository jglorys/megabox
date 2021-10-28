package com.megabox.admin.schedule;

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

import com.megabox.admin.schedule.bo.ScheduleBO;
import com.mysql.cj.util.StringUtils;

@RequestMapping("/admin/schedule")
@RestController
public class AdminScheduleRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@PostMapping("/create")
	public Map<String, Object> scheduleCreate(
						@RequestParam("movieId") int movieId,
						@RequestParam("auditoriumId") int auditoriumId,
						@RequestParam("time") String time,
						HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/schedule/create] session 없음");
			return result;
		}
		
		scheduleBO.addSchedule(movieId, auditoriumId, time);
		
		result.put("result", "success");
		return result;
		
		
	}
}
