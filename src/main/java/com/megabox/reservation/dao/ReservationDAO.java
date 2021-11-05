package com.megabox.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.reservation.model.Reservation;

@Repository
public interface ReservationDAO {
	public List<Reservation> selectReservationListByScheduleId(int scheduleId);
	
	public void insertReservation(Reservation reservation);
	
	public Reservation selectReservation (int id);
	
}
