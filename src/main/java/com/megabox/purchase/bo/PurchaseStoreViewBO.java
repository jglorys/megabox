package com.megabox.purchase.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.admin.store.bo.StoreBO;
import com.megabox.admin.store.model.Store;
import com.megabox.purchase.model.Purchase;
import com.megabox.purchase.model.PurchaseStoreView;

@Service
public class PurchaseStoreViewBO {
	
	@Autowired
	private PurchaseBO purchaseBO;
	
	@Autowired
	private StoreBO storeBO;
	
	public List<PurchaseStoreView> getPurchaseStoreViewList(int userId) {
		List<PurchaseStoreView> purchaseStoreViewList = new ArrayList<>();
		List<Purchase> purchaseList = purchaseBO.getPurchaseListByUserId(userId);
		for ( Purchase purchase : purchaseList) {
			PurchaseStoreView purchaseStoreView = new PurchaseStoreView();
			// 1. purchase
			purchaseStoreView.setPurchase(purchase);
			// 2. store
			int storeId = purchase.getStoreId();
			Store store = storeBO.getStore(storeId);
			purchaseStoreView.setStore(store);
			
			purchaseStoreViewList.add(purchaseStoreView);
		}
		return purchaseStoreViewList;
	}
}
