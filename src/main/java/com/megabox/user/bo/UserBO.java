package com.megabox.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.user.dao.UserDAO;
import com.megabox.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public void addNewUser(String loginId, String name, int yyyymmdd, String phoneNumber, String email, String encryptPassword) {
		int newUserPoint = 2000;
		userDAO.insertNewUser(loginId, name, yyyymmdd, phoneNumber, email, encryptPassword, newUserPoint);
	}
	
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public User getUser(int id) {
		return userDAO.selectUser(id);
	}
	
	public int getUserPoint(int userId) {
		User user = getUser(userId);
		int points = user.getPoint();
		return points;
	}
	
	public void updateUserPoint(int id, int usedPoint) {
		// update해야할 user의 잔여 point = 원래 포인트 - usedPoint
		int point = getUserPoint(id) - usedPoint;
		userDAO.updateUserPoint(id, point);
	}
}
