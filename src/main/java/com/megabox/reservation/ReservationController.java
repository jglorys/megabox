package com.megabox.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;

@RequestMapping("/reservation")
@Controller
public class ReservationController {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@RequestMapping("/reservation_date_select_view")
	public String ReserveDateSelect(Model model) {
		
		model.addAttribute("viewName", "reservation/reservation_date_select");
		return "template/layout";
	}
	
	@RequestMapping("/reservation_movie_select_view")
	public String ReservationMovieSelect(Model model,
									@RequestParam("date") int date) {
		
		List<Schedule> scheduleList = scheduleBO.getScheduleList();
		
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("date", date);
		model.addAttribute("viewName", "reservation/reservation_movie_select");
		return "template/layout";
	}
	
	@RequestMapping("/reservation_seat_select_view")
	public String ReservationSeatSelect(Model model,
										@RequestParam("scheduleId") int scheduleId) {
		//해당 영화와 시간대의 스케줄 
		Schedule schedule = scheduleBO.getSchedule(scheduleId);
		// 그 스케줄에 해당하는 상영관pk로 상영관의 예매 완료된 좌석 가져옴
		
		
		
		model.addAttribute("schedule", schedule);

		model.addAttribute("viewName", "reservation/reservation_seat_select");
		return "template/layout";
	}
}
