package com.megabox.reservation.model;

import com.megabox.admin.schedule.model.Schedule;

public class ReservationScheduleView {
	private Reservation reservation;
	private Schedule schedule;
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	
	
}
