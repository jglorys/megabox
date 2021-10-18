package com.megabox.admin.administrator.bo;

import org.springframework.stereotype.Service;

import com.megabox.common.EncryptUtils;

@Service
public class AdministratorBO {
	
	public boolean checkAdministrator(String loginId, String password) {
		// 관리자 비밀번호 해싱
		String adminEncryptPassword = EncryptUtils.md5("mega");
		
		// 아이디와 비밀번호가 일치하지 않으면 false
		if (loginId.equals("mega") && password.equals(adminEncryptPassword)) {
			return true;
		}
		return false;
	}
}
