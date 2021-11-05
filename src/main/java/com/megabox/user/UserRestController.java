package com.megabox.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.megabox.common.EncryptUtils;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedID(
					@RequestParam("loginId") String loginId
				) {
		//loginId 중복 여부 DB조회
		boolean exist = userBO.existLoginId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", exist);
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("yyyymmdd") int yyyymmdd,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		String encryptPassword = EncryptUtils.md5(password);
		// 회원가입시 만약 로그인된 session 있으면 session제거
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		
		// DB insert 
		userBO.addNewUser(loginId, name, yyyymmdd, phoneNumber, email, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("result", "success");
			
			// session
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			result.put("result", "error");
		}
		return result;
	}
}
