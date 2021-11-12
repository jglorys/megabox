package com.megabox.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.megabox.point.bo.PointBO;
import com.megabox.point.model.Point;
import com.megabox.purchase.bo.PurchaseStoreViewBO;
import com.megabox.purchase.model.PurchaseStoreView;
import com.megabox.reservation.bo.ReservationScheduleViewBO;
import com.megabox.reservation.model.ReservationScheduleView;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ReservationScheduleViewBO reservationScheduleBO;
	
	@Autowired
	private PointBO pointBO;
	
	
	@Autowired
	private PurchaseStoreViewBO purchaseStoreViewBO;
	
	@RequestMapping("/sign_in_view")
	public String signIn(Model model) {
		
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/sign_up_view")
	public String signUp(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOutView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		
		return "redirect:/main/megabox";
	}
	
	@RequestMapping("/reservation_list_view")
	public String reservationListView(HttpServletRequest request,
								Model model) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			//userId가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		User user = userBO.getUser(userId);
		List<ReservationScheduleView> reservationScheduleList = reservationScheduleBO.getReservationScheduleList(userId);
		model.addAttribute("reservationScheduleList", reservationScheduleList);
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/reservation_list");
		return "template/layout";
	}
	
	@RequestMapping("/purchase_list_view")
	public String purchaseListView(HttpServletRequest request,
								Model model) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			//userId가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		User user = userBO.getUser(userId);
		List<PurchaseStoreView> purchaseStoreViewList = purchaseStoreViewBO.getPurchaseStoreViewList(userId);
		model.addAttribute("purchaseStoreViewList", purchaseStoreViewList);
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/purchase_list");
		return "template/layout";
	}
	@RequestMapping("/point_view")
	public String userPointView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			//userId가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		User user = userBO.getUser(userId);
		List<Point> pointList = pointBO.getPointListByUserId(userId);
		model.addAttribute("pointList", pointList);
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/point");
		return "template/layout";
	}
	
	@RequestMapping("/user_update_view")
	public String userUpdateView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			//userId가 없으면 로그인 하는 페이지로 보낸다 (redirect)
			return "redirect:/user/sign_in_view";
		}
		model.addAttribute("viewName", "user/user_update");
		return "template/layout";
	}
}
