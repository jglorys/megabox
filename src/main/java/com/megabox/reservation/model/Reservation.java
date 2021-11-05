package com.megabox.reservation.model;

import java.util.Date;

public class Reservation {
	private int id;
	private int userId;
	private int scheduleId;
	private int payment;
	private int usedPoint;
	private int adult;
	private int adolescent;
	private int senior;
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

	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getAdolescent() {
		return adolescent;
	}
	public void setAdolescent(int adolescent) {
		this.adolescent = adolescent;
	}
	public int getSenior() {
		return senior;
	}
	public void setSenior(int senior) {
		this.senior = senior;
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
