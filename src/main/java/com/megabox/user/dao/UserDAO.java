package com.megabox.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.user.model.User;

@Repository
public interface UserDAO {
	
	public boolean existLoginId(String loginId);
	
	public void insertNewUser(User user);
	
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User selectUser(int id);
	
	public void updateUserPoint(
			@Param("id") int id, 
			@Param("point") int point);
	
	public void updateUser(
			@Param("loginId") String loginId, 
			@Param("email") String email, 
			@Param("phoneNumber") String phoneNumber, 
			@Param("password") String password);
}
