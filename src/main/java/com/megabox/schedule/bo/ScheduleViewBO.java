package com.megabox.schedule.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.megabox.admin.schedule.bo.ScheduleBO;
import com.megabox.admin.schedule.model.Schedule;
import com.megabox.auditorium.bo.AuditoriumBO;
import com.megabox.reservation.bo.ReservationBO;
import com.megabox.schedule.model.ScheduleView;

@Service
public class ScheduleViewBO {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@Autowired
	private AuditoriumBO auditoriumBO;
	
	@Autowired
	private ReservationBO reservationBO;
	
	public List<ScheduleView> getScheduleViewListByMovieId(int movieId) {
		List<ScheduleView> scheduleViewList = new ArrayList<>();
		// movieId로 가져온 스케줄들
		List<Schedule> scheduleList = scheduleBO.getScheduleByMovieId(movieId);
		for (Schedule schedule : scheduleList) {
			ScheduleView scheduleView = new ScheduleView();
			// scheduleView에 스케줄/leftSeat set한다
			scheduleView.setSchedule(schedule);
			
			// 상영시간표의 잔여 좌석 수 - Reservation테이블에서 해당하는 scheduleId로 headcount 가져오기
			// 잔여 좌석 수  = auditorium.seatCnt - sum(reservation.seatcount)
			// 해당 상영관의 전체 좌석 수 
			int allSeat = auditoriumBO.getSeatCnt(schedule.getAuditoriumId());
			// 해당 스케줄의 예매 완료된 좌석 수 
			int headcount = reservationBO.getHeadcountByScheduleId(schedule.getId());
			// 잔여 좌석 수 
			int leftSeat = allSeat - headcount;
			scheduleView.setLeftSeat(leftSeat);
			
			// scheduleViewList에 add한다
			scheduleViewList.add(scheduleView);
		}
		return scheduleViewList;
	}
}
