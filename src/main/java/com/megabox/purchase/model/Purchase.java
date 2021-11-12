package com.megabox.purchase.model;

import java.util.Date;

public class Purchase {
	private int id;
	private int userId;
	private int storeId;
	private int payment;
	private int usedPoint;
	private int exchangeNumber;
	private Date createdAt;

	public int getExchangeNumber() {
		return exchangeNumber;
	}
	public void setExchangeNumber(int exchangeNumber) {
		this.exchangeNumber = exchangeNumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
