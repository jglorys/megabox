package com.megabox.point.model;

import java.util.Date;

public class Point {
	private int id;
	private int userId;
	private Integer reservationId;
	private Integer storeId;
	private String history;
	private String plusMinus;
	private int changePoint;
	private Date createdAt;
	
	public Integer getReservationId() {
		return reservationId;
	}
	public void setReservationId(Integer reservationId) {
		this.reservationId = reservationId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
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
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getPlusMinus() {
		return plusMinus;
	}
	public void setPlusMinus(String plusMinus) {
		this.plusMinus = plusMinus;
	}
	public int getChangePoint() {
		return changePoint;
	}
	public void setChangePoint(int changePoint) {
		this.changePoint = changePoint;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	
	
}
