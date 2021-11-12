package com.megabox.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megabox.admin.store.bo.StoreBO;
import com.megabox.admin.store.model.Store;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/store_list_view")
	public String storeListView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		model.addAttribute("viewName", "store/store_list");
		return "template/layout";
	}
	
	@RequestMapping("/store_purchase_view")
	public String storeListView(Model model,
								HttpServletRequest request,
								@RequestParam("storeId") int storeId) {
		//session check
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");	
		if (userId == null) {
			//세션에 id가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		User user = userBO.getUser(userId);
		Store store = storeBO.getStore(storeId);
		
		model.addAttribute("user", user);
		model.addAttribute("store", store);
		model.addAttribute("viewName", "store/store_purchase");
		return "template/layout";
		
	}
	
}
