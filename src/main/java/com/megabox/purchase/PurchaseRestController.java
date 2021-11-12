package com.megabox.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.megabox.purchase.bo.PurchaseBO;

@RequestMapping("/purchase")
@RestController
public class PurchaseRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PurchaseBO purchaseBO;
	
	@PostMapping("/insert")
	public Map<String, Object> insertPurchase(@RequestParam("storeId") int storeId,
											@RequestParam("payment") int payment,
											@RequestParam("usedPoint") int usedPoint,
											HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			logger.info("[/reservation/insert] session 없음");
			result.put("result", "error");
			return result;
		}
		purchaseBO.addPurchase(userId, storeId, payment, usedPoint);
		
		result.put("result", "success");
		return result;
	}
}
