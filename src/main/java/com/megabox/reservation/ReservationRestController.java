package com.megabox.reservation;

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

import com.megabox.reservation.bo.ReservationBO;

@RequestMapping("/reservation")
@RestController
public class ReservationRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ReservationBO reservationBO;
	
	@PostMapping("/insert")
	public Map<String, Object> insertReservation(
									HttpServletRequest request,
									@RequestParam("scheduleId") int scheduleId,
									@RequestParam("realChargeMoney") int realChargeMoney,
									@RequestParam("usedPoints") int usedPoints,
									@RequestParam("adult") int adult,
									@RequestParam("adolescent") int adolescent,
									@RequestParam("senior") int senior,
									@RequestParam("seatLocation") String seatLocation
									) {
	Map<String, Object> result = new HashMap<>();
	HttpSession session = request.getSession();
	Integer userId = (Integer) session.getAttribute("userId");
	if (userId == null) {
		logger.info("[/reservation/insert] session 없음");
		result.put("result", "error");
		return result;
	}
	// reservation에 추가 + user의 point차감
	int reservationId = reservationBO.addReservation(userId, scheduleId, realChargeMoney, usedPoints, adult, adolescent, senior, seatLocation);
	result.put("result", "success");
	result.put("reservationId", reservationId);
	return result;
	}
	
	@PostMapping("/delete")
	public Map<String, Object> deleteReservation(
									HttpServletRequest request,
									@RequestParam("reservationId") int reservationId) {
		HttpSession session = request.getSession();
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			logger.info("[/reservation/delete] session 없음");
			result.put("result", "error");
			return result;
		}
		reservationBO.deleteReservation(reservationId);
		result.put("result", "success");
		return result;
	
	}
}