<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<div class="d-flex mt-4">
	<div class="col-2"></div>
	<div class="mt-4 ml-4 col-8 d-flex">
		<div class="col-8" id="scheduleId" data-schedule-id="${schedule.id}">
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.movieTitle}</span><br><br>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.auditoriumName}관</span><br><br>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${fn:substring(schedule.time,0,4)}.${fn:substring(schedule.time,4,6)}.${fn:substring(schedule.time,6,8)}  |   
			${fn:substring(schedule.time,8,10)}시 ${fn:substring(schedule.time,10,12)}분
			</span><br><br>
			<span class="font-weight-bold p-1" id="headcount" data-adult-count="${adult}"  data-adolescent-count="${adolescent}"  
			data-senior-count="${senior}" style="background-color:#E6E6E6; border-radius: 2em;">성인 ${adult}명 / 청소년 ${adolescent}명 / 경로 ${senior}명</span><br><br>
			<span class="font-weight-bold p-1 mr-5" style="background-color:#E6E6E6; border-radius: 2em;" id="seatLocation" data-seat-location="${selectedSeats}">좌석 : ${fn:replace(selectedSeats, ',', ' & ')}</span>
		</div>
		<div class="col-3 d-flex align-items-end justify-content-end">
			<span class="font-weight-bold p-1" id="pay" data-origin-pay="${pay}">금액 : ${pay}원</span>
		</div>
		<br>
	</div>
</div>
<hr width="700" noshade> 

<div class="d-flex justify-content-center mt-5">
	<div class="col-4">
		<h5 id="userPoints" data-user-point="${userPoints}" class="ml-2">${userName}님 가용포인트 : ${userPoints} P</h5>
		<input type="number" id="usedPoints" class="form-control mt-4 ml-2" style="border-radius: 1em; height: 50px ;width: 260px; font-size:18px">
	</div>
	
	<div class="col-4 mt-4">
		<input type="text" id="realPay" readonly class="mt-4" style="border-radius: 1em; height: 50px ;width: 350px; border:0 solid black; font-size:22pt" disabled>
	</div>
</div>

<div class="d-flex mt-5">
	<div class="col-6"></div>
	<div class="col-4 mt-4 ml-4"> 
		<button type="button" id="cancelBtn" class="btn bg-secondary text-white mr-3" onclick = "location.href = '/main/megabox' " style="border-radius: 1em;height: 50px ;width: 120px;font-size:14pt">취소</button>
		<button type="button" id="payBtn" class="btn text-white" style="background-color: #380B61; border-radius: 1em;height: 50px ;width: 120px;font-size:14pt">결제</button>
	</div>
</div>


<script>
$(document).ready(function(){
	var originChargeMoney = $('#pay').data('origin-pay');
	var userPoints = $('#userPoints').data('user-point');
	var realChargeMoney = originChargeMoney; //실 결제 금액
	var usedPoints = 0; //포인트 사용 금액
	$('#realPay').val('총 결제금액 : ' + originChargeMoney);
	
	$('#usedPoints').on('change', function(){
		usedPoints = parseInt($(this).val());
		if (usedPoints < 0) {
			$(this).val(0);
			return;
		}
		if (usedPoints > userPoints) {
			alert('사용 가능한 포인트를 초과하였습니다');
			$(this).val(0);
			$('#realPay').val('총 결제금액 : ' + originChargeMoney);
			return;
		}
		realChargeMoney = originChargeMoney - usedPoints;
		$('#realPay').val('총 결제금액 : ' + realChargeMoney);
	});

	$('#payBtn').on('click', function(){	
		let scheduleId = $('#scheduleId').data('schedule-id');
		let adult = $('#headcount').data('adult-count');
		let adolescent = $('#headcount').data('adolescent-count');
		let senior = $('#headcount').data('senior-count');
		let seatLocation = $('#seatLocation').data('seat-location');
		console.log(scheduleId / adult / adolescent / senior / realChargeMoney / usedPoints / seatLocation);
		
		let formData = new FormData();
		formData.append('scheduleId', scheduleId); 
		formData.append('adult', adult); //예매 인원
		formData.append('adolescent', adolescent); 
		formData.append('senior', senior); 
		formData.append('realChargeMoney', realChargeMoney); // 실제 결제 금액
		formData.append('usedPoints', usedPoints); //포인트 사용 금액
		formData.append('seatLocation', seatLocation); // 좌석 위치
		
		$.ajax({
			type: 'post',
			url: '/reservation/insert',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("결제가 완료되었습니다");
					let reservationId = data.reservationId;
					location.href = "/reservation/reservation_result_view?reservationId=" + reservationId;
				}
			},
			error: function(e) {
				alert("결제에 실패했습니다. 관리자에게 문의해주세요" + e);
			}
		});
		
	});
	
	
});
</script>
