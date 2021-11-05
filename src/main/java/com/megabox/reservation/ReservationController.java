package com.megabox.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.movie.bo.MovieBO;
import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;
import com.megabox.auditorium.bo.AuditoriumBO;
import com.megabox.reservation.bo.ReservationBO;
import com.megabox.reservation.model.Reservation;
import com.megabox.schedule.bo.ScheduleViewBO;
import com.megabox.schedule.model.ScheduleView;
import com.megabox.user.bo.UserBO;

@RequestMapping("/reservation")
@Controller
public class ReservationController {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@Autowired
	private ReservationBO reservationBO;
	
	@Autowired
	private AuditoriumBO auditoriumBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ScheduleViewBO scheduleViewBO;
	
	@Autowired
	private MovieBO movieBO;
	
	@RequestMapping("/reservation_date_select_view")
	public String reserveDateSelect(Model model, HttpServletRequest request) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		model.addAttribute("viewName", "reservation/reservation_date_select");
		return "template/layout";
	}
	
	@RequestMapping("/reservation_movie_select_view")
	public String reservationMovieSelect(Model model,
									@RequestParam("date") int date,
									HttpServletRequest request) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		// date에 해당하는 스케줄뷰 리스트만 뽑아옴
		List<ScheduleView> scheduleViewList = scheduleViewBO.getScheduleViewListByDate(date);
		// date에 상영하는 영화id만 가져옴
		List<String> movieTitleList = scheduleBO.getMovieTitleByDate(date);
		
		model.addAttribute("scheduleViewList", scheduleViewList);
		model.addAttribute("movieTitleList", movieTitleList);
		model.addAttribute("date", date);
		model.addAttribute("viewName", "reservation/reservation_movie_select");
		return "template/layout";
	}
	
	@RequestMapping("/reservation_seat_select_view")
	public String reservationSeatSelect(Model model,
										@RequestParam("scheduleId") int scheduleId,
										HttpServletRequest request) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		// 해당 영화&시간대의 상영스케줄 
		Schedule schedule = scheduleBO.getSchedule(scheduleId);
		// 그 스케줄에 해당하는 pk로 상영관의 예매 완료된 좌석 가져옴
		StringBuilder reservedSeats = reservationBO.getReservedSeats(scheduleId);
		// 영화관의 전체 좌석 수
		int seatCount = auditoriumBO.getSeatCnt(schedule.getAuditoriumId());
		// 영화 관람등급
		String viewingClass = movieBO.getViewingClass(schedule.getMovieId());
		
		model.addAttribute("viewingClass", viewingClass);
		model.addAttribute("reservedSeats", reservedSeats);
		model.addAttribute("seatCount", seatCount);
		model.addAttribute("schedule", schedule);
		model.addAttribute("viewName", "reservation/reservation_seat_select");
		return "template/layout";
	}
	
	@RequestMapping("/reservation_pay_view")
	public String reservationPayView(Model model,
								@RequestParam("scheduleId") int scheduleId,
								@RequestParam("selectedSeats") String selectedSeats,
								@RequestParam("adult") int adult,
								@RequestParam("adolescent") int adolescent,
								@RequestParam("senior") int senior,
								@RequestParam("pay") int pay,
								HttpServletRequest request) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";	
		}
		Schedule schedule = scheduleBO.getSchedule(scheduleId);
		// userBO로 부터 가용포인트를 가져온다.
		int userPoints = userBO.getUserPoint(userId);

		model.addAttribute("userPoints", userPoints);
		model.addAttribute("schedule", schedule);
		model.addAttribute("pay", pay);
		model.addAttribute("adult", adult);
		model.addAttribute("adolescent", adolescent);
		model.addAttribute("senior", senior);
		model.addAttribute("selectedSeats", selectedSeats);
		model.addAttribute("viewName", "reservation/reservation_pay");
		return "template/layout";
		
	}
	
	@RequestMapping("/reservation_result_view")
	public String reservationResultView(Model model,
									HttpServletRequest request,
									@RequestParam("reservationId") int reservationId ) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";	
		}
		Reservation reservation = reservationBO.getReservation(reservationId);
		Schedule schedule = scheduleBO.getSchedule(reservation.getScheduleId());
		model.addAttribute("schedule", schedule);
		model.addAttribute("reservation", reservation);
		model.addAttribute("viewName", "reservation/reservation_result");
		return "template/layout";
		
	}
}
