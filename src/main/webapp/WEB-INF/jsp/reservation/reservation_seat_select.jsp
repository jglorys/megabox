<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<div class="d-flex mt-4">
	<div class="col-4"></div>
	<div class="mt-4 mb-3">
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.movieTitle}</span><br><br>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.auditoriumName}관</span><br><br>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${fn:substring(schedule.time,0,4)}.${fn:substring(schedule.time,4,6)}.${fn:substring(schedule.time,6,8)}  |   
		${fn:substring(schedule.time,8,10)}시 ${fn:substring(schedule.time,10,12)}분
		</span><br>
	</div>
</div>
<hr width="400" noshade>

<div class="d-flex justify-content-center text-center" id="scheduleId" data-schedule-id="${schedule.id}">
	<h4>인원 및 좌석을 선택해주세요</h4>
</div>

<div class="d-flex justify-content-center mt-4">
	<div class="m-4">
		<img alt="screen" src="https://www.megabox.co.kr/static/pc/images/reserve/img-theater-screen.png" class="mb-3">
		<div class="d-flex justify-content-center">
			<div>
			<c:set var="row">a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t</c:set>
			<c:forEach var="i" begin="0" end="${seatCount/10 -1}" items="${row}">
				<div class="mb-1">
					<button type="button" class="btn btn-light mr-3" style="width: 50px; background-color:#FBFBEF;">${i}</button>
					<c:forEach var="j" begin="1" end="10">
						<button type="button" class="btn seatBtn" style="width: 50px;" data-seat-row="${i}" data-seat-col="${j}">${j}</button>
					</c:forEach>
					<br>
				</div>
			</c:forEach>
			</div>
		</div>

	</div>
</div>

<div class="d-flex justify-content-end">
	<button type="button" id="reservationBtn" class="btn text-white" style="background-color: #380B61;">예매하기</button>
</div>

<script>
$(document).ready(function(){
	var selectedSeats = '';
	$('.seatBtn').on('click', function(){
		let seatRow = $(this).data('seat-row');
		let seatCol= $(this).data('seat-col');
		//alert(seatRow + seatCol);
		let seat = seatRow + seatCol + ',';
		
		if ($(this).hasClass("btn-secondary") == true) {
			$(this).removeClass("btn-secondary");
			selectedSeats = selectedSeats.replace(seat, '');
		} else {
			$(this).addClass("btn-secondary");
			selectedSeats += seat;
		}
		//alert(selectedSeats);
	});
	
	$('#reservationBtn').on('click', function(){
		let scheduleId = $('#scheduleId').data('schedule-id');
		//alert(scheduleId);
		
		location.href="/reservation/reservation_pay_view?scheduleId=" + scheduleId + "&selectedSeats=" + selectedSeats;
	});
});
</script>