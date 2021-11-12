package com.megabox.reservation.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.point.bo.PointBO;
import com.megabox.reservation.dao.ReservationDAO;
import com.megabox.reservation.model.Reservation;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PointBO pointBO;
	
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
	
	public String getReservedSeats(int scheduleId) {
		String reservedSeats = "";
		// 해당 스케줄의 예약 목록 다 가져온다
		List<Reservation> reservationList = getReservationListByScheduleId(scheduleId);
		// 가져온 리스트에서 예약좌석 꺼내서 reservedSeats에 저장
		for (Reservation reservation : reservationList) {
			reservedSeats += reservation.getSeatLocation() + ",";
		}
//		reservedSeats = reservedSeats.substring(0, reservedSeats.length()-1);
//		String[] seartArr = reservedSeats.split(",");
//		List<String> reservedSeatsList = Arrays.asList(seartArr);
		if (reservedSeats == "") {
			return "0";
		}
		reservedSeats = reservedSeats.substring(0, reservedSeats.length()-1);
		
		return reservedSeats;
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
		// 사용 포인트만큼 User의 point 차감해야 한다 - 포인트가 사용됐다면!!!!
		if (usedPoint != 0) {
			// update해야할 user의 잔여 point = 원래 포인트 - usedPoint
			User user = userBO.getUser(userId);
			int point = user.getPoint() - usedPoint;
			userBO.updateUserPoint(userId, point);
			// PointBO에서 Point테이블에 해당 reservationId로 insert
			String history = "영화예매";
			pointBO.addPointByReservation(userId, reservationId, history, "-", usedPoint);
		}
		// 추가된 해당 reservationId 리턴 (가장 마지막에 추가된 것임)
		return reservationId;
	}
	
	public Reservation getReservation (int id) {
		return reservationDAO.selectReservation(id);
	}

	public List<Reservation> getReservationListByUserId (int userId) {
		List<Reservation> reservationList = reservationDAO.selectReservationListByUserId(userId);
		return reservationList;
	}
	
	public void deleteReservation (int id) {
		// 포인트 차감했던거 복원
		Reservation reservation = getReservation(id);
		User user = userBO.getUser(reservation.getUserId());
		int usedPoint = reservation.getUsedPoint(); //사용했던 포인트
		int prevPoint = user.getPoint() + usedPoint; //다시 user객체에 set
		userBO.updateUserPoint(user.getId(), prevPoint);
		// PointBO에서 해당 reservationId에 해당하는거 찾아서 지우기
		pointBO.deletePointByReservation(user.getId(), reservation.getId());
		// id에 해당하는 reservation 삭제
		reservationDAO.deleteReservation(id);
		
	}
}
