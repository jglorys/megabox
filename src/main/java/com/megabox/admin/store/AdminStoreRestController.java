package com.megabox.admin.store;

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
import org.springframework.web.multipart.MultipartFile;

import com.megabox.admin.store.bo.StoreBO;
import com.mysql.cj.util.StringUtils;

@RequestMapping("/admin/store")
@RestController
public class AdminStoreRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private StoreBO storeBO;
	
	@PostMapping("/create")
	public Map<String, Object> storeCreate(
			@RequestParam("productName") String productName,
			@RequestParam("productComposition") String productComposition,
			@RequestParam("productPrice") int productPrice,
			@RequestParam("productAmount") int productAmount,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		String admin = (String) session.getAttribute("admin");
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		if (StringUtils.isNullOrEmpty(admin)) {
			logger.info("[/admin/store/create] session 없음");
			return result;
		}
		
		storeBO.addStore(productName, productComposition, productPrice, productAmount, file);
		
		result.put("result", "success");
		return result;
		
		
	}
}
