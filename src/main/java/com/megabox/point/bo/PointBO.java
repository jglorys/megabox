package com.megabox.point.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.point.dao.PointDAO;
import com.megabox.point.model.Point;

@Service
public class PointBO {
	@Autowired
	private PointDAO pointDAO;
	
	public void addPointByReservation(int userId,int reservationId, String history, String plusMinus, int changePoint) {
		pointDAO.insertPointByReservation(userId, reservationId, history, plusMinus, changePoint);
	}
	
	public void deletePointByReservation(int userId, int reservationId) {
		pointDAO.deletePointByReservation(userId, reservationId);
	}
	
	public List<Point> getPointListByUserId (int userId) {
		List<Point> pointList = pointDAO.selectPointListByUserId(userId);
		return pointList;
	}
	
	public void addPoint (int userId, String history, String plusMinus, int changePoint) {
		pointDAO.insertPoint(userId, history, plusMinus, changePoint);
	}
	
	public void addPointByStore(int userId,int storeId, String history, String plusMinus, int changePoint) {
		pointDAO.insertPointByStore(userId, storeId, history, plusMinus, changePoint);
	}
	
}
