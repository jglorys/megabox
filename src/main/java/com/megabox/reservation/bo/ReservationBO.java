package com.megabox.reservation.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.reservation.dao.ReservationDAO;
import com.megabox.reservation.model.Reservation;
import com.megabox.user.bo.UserBO;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int getHeadcountByScheduleId(int scheduleId) {
		// reservation테이블에서 해당 스케줄의 headcount 다 더한다.
		List<Reservation> reservationList = getReservationListByScheduleId(scheduleId);
		int sum = 0;
		
		for (Reservation reservation : reservationList) {
			int adult = reservation.getAdult();
			int adolescent = reservation.getAdolescent();
			int senior = reservation.getSenior();
			sum += (adult + adolescent +senior);
		}
		// 해당 스케줄에 예매한 인원수(잔여좌석 구할때)
		return sum;
	}
	
	public List<Reservation> getReservationListByScheduleId(int scheduleId) {
		List<Reservation> reservationList = new ArrayList<>();
		reservationList = reservationDAO.selectReservationListByScheduleId(scheduleId);
		return reservationList;
	}
	
	public List<String> getReservedSeats(int scheduleId) {
		String reservedSeats = "";
		// 해당 스케줄의 예약 목록 다 가져온다
		List<Reservation> reservationList = getReservationListByScheduleId(scheduleId);
		// 가져온 리스트에서 예약좌석 꺼내서 reservedSeats에 저장
		for (Reservation reservation : reservationList) {
			reservedSeats += reservation.getSeatLocation() + ",";
		}
		reservedSeats = reservedSeats.substring(0, reservedSeats.length()-1);
		List<String> reservedSeatsList = new ArrayList<>();
				//reservedSeats.split(",");
		return reservedSeatsList;
	}
	
	public int addReservation(int userId, int scheduleId, int payment, int usedPoint, int adult, int adolescent, int senior, String seatLocation) {
		Reservation reservation = new Reservation();
		reservation.setUserId(userId);
		reservation.setScheduleId(scheduleId);
		reservation.setPayment(payment);
		reservation.setUsedPoint(usedPoint);
		reservation.setAdult(adult);
		reservation.setAdolescent(adolescent);
		reservation.setSenior(senior);
		reservation.setSeatLocation(seatLocation);
	
		reservationDAO.insertReservation(reservation);
		int reservationId = reservation.getId();
		// 사용 포인트만큼 User의 point 차감해야 한다
		userBO.updateUserPoint(userId, usedPoint);
		// 추가된 해당 reservationId 리턴 (가장 마지막에 추가된 것임)
		return reservationId;
	}
	
	public Reservation getReservation (int id) {
		return reservationDAO.selectReservation(id);
	}


}
