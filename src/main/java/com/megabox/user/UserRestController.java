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
		Map<String, Object> result = new HashMap<>();
		
		// 존재하는 아이디인지 확인 - loginId 중복 여부 DB조회
		boolean exist = userBO.existLoginId(loginId);
		if (exist) {
			// 존재하면 loginId와 password로 user확인 후 로그인
			User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
			if (user != null) {
				result.put("result", "success");
				// session
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userLoginId", user.getLoginId());
			} else {
				// 아이디는 있는데 비밀번호 일치하지 않는 경우
				result.put("result", "discord");
			}
		} else {
			// 해당 아이디 없는 경우
			result.put("result", "nullUser");
		}
		return result;
	}
}
