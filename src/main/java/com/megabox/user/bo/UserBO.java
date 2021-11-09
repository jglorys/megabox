package com.megabox.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.point.bo.PointBO;
import com.megabox.user.dao.UserDAO;
import com.megabox.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PointBO pointBO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public void addNewUser(String loginId, String name, int yyyymmdd, String phoneNumber, String email, String encryptPassword) {
		int newUserPoint = 2000;
		User user = new User();
		user.setLoginId(loginId);
		user.setName(name);
		user.setYyyymmdd(yyyymmdd);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		user.setPassword(encryptPassword);
		user.setPoint(newUserPoint);
		userDAO.insertNewUser(user);
		//새로운 user에게 point줬으므로 point 테이블에도 저장
		int userId = user.getId();
		String history = "신규회원 포인트 적립";
		pointBO.addPoint(userId, history, "+", newUserPoint);
		
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
	
	public void updateUserPoint(int id, int point) {
		userDAO.updateUserPoint(id, point);
	}
}
