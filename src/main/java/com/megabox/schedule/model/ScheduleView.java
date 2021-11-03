package com.megabox.schedule.model;

import com.megabox.admin.schedule.model.Schedule;

public class ScheduleView {

	private Schedule schedule;
	private int leftSeat;
	
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	public int getLeftSeat() {
		return leftSeat;
	}
	public void setLeftSeat(int leftSeat) {
		this.leftSeat = leftSeat;
	}
	
	
}
