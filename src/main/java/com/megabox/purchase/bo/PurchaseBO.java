package com.megabox.purchase.bo;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.point.bo.PointBO;
import com.megabox.purchase.dao.PurchaseDAO;
import com.megabox.purchase.model.Purchase;
import com.megabox.user.bo.UserBO;
import com.megabox.user.model.User;

@Service
public class PurchaseBO {
	
	@Autowired
	private PurchaseDAO purchaseDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PointBO pointBO;
	
	public void addPurchase(int userId,int storeId, int payment, int usedPoint) {
		// exchangeNumber : 교환번호 --> 난수생성 알고리즘
		Random rand = new Random(); //랜덤 객체 생성(디폴트 시드값 : 현재시간)
		long seed = System.currentTimeMillis(); //시드값
		rand.setSeed(seed); //시드를 설정
		int exchangeNumber = rand.nextInt(1000000000); //0~1000000000의 임의의 숫자가 반환
		purchaseDAO.insertPurchase(userId, storeId, payment, usedPoint, exchangeNumber);
		
		// 포인트가 사용됐다면 point테이블에 접근!
		if (usedPoint != 0) {
			// 포인트 사용금액만큼 User point 차감
			User user = userBO.getUser(userId);
			int point = user.getPoint() - usedPoint; //기존 user 포인트
			userBO.updateUserPoint(userId, point);
	
			// PointBO에서 Point테이블에 해당 storeId로 insert
			String history = "스토어 상품구매";
			pointBO.addPointByReservation(userId, storeId, history, "-", usedPoint);
		}
	}
	
	public List<Purchase> getPurchaseListByUserId(int userId) {
		List<Purchase> purchaseList = purchaseDAO.selectPurchaseListByUserId(userId);
		return purchaseList;
	}
}
