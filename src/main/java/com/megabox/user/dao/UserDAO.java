package com.megabox.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.user.model.User;

@Repository
public interface UserDAO {
	
	public boolean existLoginId(String loginId);
	
	public void insertNewUser(
			@Param("loginId") String loginId,
			@Param("name") String name,
			@Param("yyyymmdd") int yyyymmdd,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email,
			@Param("password") String password,
			@Param("point") int point);
	
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
}
