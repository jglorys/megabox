package com.megabox.reservation.model;

import java.util.Date;

public class Reservation {
	private int id;
	private int userId;
	private int scheduleId;
	private int payment;
	private int usedPoint;
	private int headcount;
	private String seatLocation;
	private Date createdAt;
	
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
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
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
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public String getSeatLocation() {
		return seatLocation;
	}
	public void setSeatLocation(String seatLocation) {
		this.seatLocation = seatLocation;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
