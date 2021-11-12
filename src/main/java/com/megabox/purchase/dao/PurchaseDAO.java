package com.megabox.purchase.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.purchase.model.Purchase;

@Repository
public interface PurchaseDAO {
	
	public void insertPurchase(@Param("userId") int userId, 
								@Param("storeId") int storeId, 
								@Param("payment") int payment, 
								@Param("usedPoint") int usedPoint, 
								@Param("exchangeNumber") int exchangeNumber);
	
	public List<Purchase> selectPurchaseListByUserId(int userId);
}
