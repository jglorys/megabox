package com.megabox.reservation.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;
import com.megabox.reservation.model.Reservation;
import com.megabox.reservation.model.ReservationScheduleView;

@Service
public class ReservationScheduleViewBO {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@Autowired
	private ReservationBO reservationBO;
	
	public List<ReservationScheduleView> getReservationScheduleList (int userId) {
		List<ReservationScheduleView> reservationScheduleList = new ArrayList<>();
		List<Reservation> reservationList = reservationBO.getReservationListByUserId(userId);
		for (Reservation reservation : reservationList) {
			ReservationScheduleView reservationSchedule = new ReservationScheduleView();
			
			reservationSchedule.setReservation(reservation);
			Schedule schedule = scheduleBO.getSchedule(reservation.getScheduleId());
			reservationSchedule.setSchedule(schedule);

			// reservationScheduleList에 add한다
			reservationScheduleList.add(reservationSchedule);
		}
		return reservationScheduleList;
	}
	
}
