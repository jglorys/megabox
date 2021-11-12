package com.megabox.purchase.model;

import com.megabox.admin.store.model.Store;

public class PurchaseStoreView {
	private Purchase purchase;
	private Store store;
	
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	
	
}
