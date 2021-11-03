package com.megabox.reservation.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.reservation.dao.ReservationDAO;
import com.megabox.reservation.model.Reservation;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	public int getHeadcountByScheduleId(int scheduleId) {
		// reservation테이블에서 해당 스케줄의 headcount 다 더한다.
		List<Reservation> reservationList = getReservationListByScheduleId(scheduleId);
		int sum = 0;
		
		for (Reservation reservation : reservationList) {
			int headcount = reservation.getHeadcount();
			sum += headcount;
		}
		// 해당 스케줄에 예매한 인원수(잔여좌석 구할때)
		return sum;
	}
	
	public List<Reservation> getReservationListByScheduleId(int scheduleId) {
		List<Reservation> reservationList = new ArrayList<>();
		reservationList = reservationDAO.selectReservationListByScheduleId(scheduleId);
		return reservationList;
	}
	
	public StringBuilder getReservedSeats(int scheduleId) {
		StringBuilder reservedSeats = new StringBuilder("");
		// 해당 스케줄의 예약 목록 다 가져온다
		List<Reservation> reservationList = getReservationListByScheduleId(scheduleId);
		// 가져온 리스트에서 예약좌석 꺼내서 reservedSeats에 저장
		for (Reservation reservation : reservationList) {
			reservedSeats.append(reservation.getSeatLocation());
		}
		return reservedSeats;
	}
}
