package com.megabox.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.point.model.Point;

@Repository
public interface PointDAO {
	public void insertPointByReservation(
									@Param("userId") int userId,
									@Param("reservationId") int reservationId, 
									@Param("history") String history, 
									@Param("plusMinus") String plusMinus, 
									@Param("changePoint") int changePoint);
	
	public void deletePointByReservation(
									@Param("userId") int userId, 
									@Param("reservationId")int reservationId);
	
	public List<Point> selectPointListByUserId (int userId);
	
	public void insertPoint (
							@Param("userId") int userId, 
							@Param("history") String history, 
							@Param("plusMinus") String plusMinus,
							@Param("changePoint") int changePoint);
}
