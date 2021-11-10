package com.megabox.admin.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.admin.schedule.model.Schedule;
import com.mysql.cj.util.StringUtils;

@RequestMapping("/admin/store")
@Controller
public class AdminStoreController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/store_list_view")
	public String storeListView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/store/store_list_view] session 없음");
			return "redirect:/admin/administrator/sign_in_view";
		}
		
		
		model.addAttribute("viewName", "/store/store_list");
		return "admin/template/layout";
	}
}
