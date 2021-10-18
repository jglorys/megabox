package com.megabox.admin.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdministratorController {

	@RequestMapping("/administrator/sign_in_view")
	public String signInView() {
		return "admin/administrator/sign_in";
	}

}
