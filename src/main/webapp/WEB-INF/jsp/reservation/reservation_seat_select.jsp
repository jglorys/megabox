<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<div class="d-flex mt-4">
	<div class="col-3"></div>
	<div class="mt-4 mb-3">
		<div  id="viewingClass" data-viewing-class="${viewingClass}">
			<c:if test="${viewingClass eq '전체'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_A.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${viewingClass eq '12세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/0/04/KMRB_B.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${viewingClass eq '15세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/5/52/KMRB_C.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${viewingClass eq '청불'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_D.png" width="40" height="40" class="mr-2">
			</c:if>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.movieTitle}</span><br><br>
		</div>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.auditoriumName}관</span><br><br>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${fn:substring(schedule.time,0,4)}.${fn:substring(schedule.time,4,6)}.${fn:substring(schedule.time,6,8)}  |   
		${fn:substring(schedule.time,8,10)}시 ${fn:substring(schedule.time,10,12)}분
		</span><br>
	</div>
</div>
<hr width="700" noshade>

<div class="d-flex justify-content-center text-center" id="scheduleId" data-schedule-id="${schedule.id}">
	<h4>인원 및 좌석을 선택해주세요</h4>
</div>

<div class="d-flex justify-content-center mt-4">
	<div class="m-4">
		<div class="d-flex justify-content-center">
			<img alt="screen" src="https://www.megabox.co.kr/static/pc/images/reserve/img-theater-screen.png" class="mb-4">
		</div>
		<div class="d-flex justify-content-center">
			<div>
			<c:set var="row">A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T</c:set>
			<c:forEach var="i" begin="0" end="${seatCount/10 -1}" items="${row}">
				<div class="mb-1">
					<button type="button" class="btn btn-light mr-3 font-weight-bold" style="width: 50px; background-color:#FBFBEF;">${i}</button>
					<c:forEach var="j" begin="1" end="10">
						<button type="button" class="btn seatBtn" style="width: 50px;" data-seat-row="${i}" data-seat-col="${j}">${j}</button>
					</c:forEach>
					<br>
				</div>
			</c:forEach>
			</div>
		</div>

	</div>
	<div class="mt-2 pt-1">
	
		<div class="text-white p-1 m-1" style="background-color:#380B61; border-radius: 2em; height: 400px;">
			<div class="mt-3 text-center">인원선택</div>
			<hr width="150" style="color: #FFFFFF" noshade>
			<div class="d-flex justify-content-center align-items-center m-2">
				<span id="adult" class="text-center w-25 mr-3">성인</span>
				<input type="number" id="adultCnt" class="form-control mt-2 w-50" style="border-radius: 1em;" value="0">
			</div>
			<div class="d-flex justify-content-center align-items-center m-2">
				<span id="adolescent" class="text-center w-25 mr-3">청소년</span>
				<input type="number" id="adolescentCnt" class="form-control mt-2 w-50" style="border-radius: 1em;" value="0">
			</div>
			<div class="d-flex justify-content-center align-items-center m-2">
				<span id="senior" class="text-center w-25 mr-3">경로</span>
				<input type="number" id="seniorCnt" class="form-control mt-2 w-50" style="border-radius: 1em;" value="0">
			</div>
			<%-- 선택된 좌석 표시 --%>
			<div class="d-flex justify-content-center align-items-center m-2 mt-4">
				<input type="text" class="form-control font-weight-bold" id="seatsLocation" style="border-radius: 1em; height: 120px ;width: 240px;word-break:break-all;">
			</div>
		</div>
		<%-- 금액 표시 --%>
		<div class="d-flex justify-content-center align-items-center m-2">
			 <textarea rows="3" cols="12" class="form-control font-weight-bold mt-3" id="chargeAccount" style="border-radius: 1em; height: 90px; border:0 solid black;"></textarea>
		</div>
		<%-- 결제하기 버튼 --%>
		<div class="d-flex justify-content-end mt-1">
			<button type="button" id="reservationBtn" class="btn btn-block text-white" style="background-color: #380B61;border-radius: 1em;">예매하기</button>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	// 청소년관람불가인 경우 안내문구
	var viewingClass = $('#viewingClass').data('viewing-class');
	//alert(viewingClass);
	if (viewingClass == '청불') {
		alert("청소년 관람불가 등급입니다. 미성년자는 입장이 제한됩니다.");
		$('#adolescentCnt').hide();
		$('#adolescent').hide();
	}
	
	// 변수 선언
	var adult = 0; //성인 인원수 
	var adolescent = 0; //청소년 인원 수
	var senior = 0; //경로 인원 수 
	var sum = 0; // 전체 선택 인원 수 
	var seniorAlert = false;
	
	var selectedSeats = ''; // 선택된 좌석 (A1,B2,)
	var selectedSeatsCnt = 0; // 선택된 좌석 개수
	
	// 인원 수 선택먼저하고 좌석 선택해야함
	$('#adultCnt').on('change', function(){
		let adultCnt = parseInt($(this).val());
		if (adultCnt < 0) {
			$(this).val(0);
			return;
		}
		//adult = adultCnt;
		sum = adultCnt + adolescent + senior;
		if (sum >= 11) {
			alert("최대 10명까지 예매 가능합니다.");
			$(this).val(0);
			adult = 0;
			sum = adult + adolescent + senior;
			//console.log(sum , adult);
			return;
		}
		// 인원수 줄어들어서 선택된 좌석수보다 적어질 경우
		if (selectedSeatsCnt > sum) {
			// 선택된 좌석을 먼저 지우라고 alert
			alert("선택하신 좌석수와 인원수가 일치하지 않습니다. 좌석을 먼저 선택해제 해주세요.");
			$(this).val(adult); //이전 값 넣어준다
			sum = adult + adolescent + senior;
			console.log('좌석수' + selectedSeatsCnt + '//인원수' + sum);
			return;
		}
		adult = adultCnt;
		// 금액 계산
		var pay = (adult*13000) + (adolescent*10000) + (senior*6000);
		var text = '총 관람인원	 ' + sum +'명\n\n';
		text += '   총 금액	     '+ pay + '원';

		$('#chargeAccount').val(text);
		
	});
	$('#adolescentCnt').on('change', function(){
		let adolescentCnt = parseInt($(this).val());
		if (adolescentCnt < 0) {
			$(this).val(0);
			return;
		}
		//adolescent = adolescentCnt;
		sum = adult + adolescentCnt + senior;
		if (sum >= 11) {
			alert("최대 10명까지 예매 가능합니다.");
			$(this).val(0);
			adolescent = 0;
			sum = adult + adolescent + senior;
			//console.log(sum , adolescent);
			return;
		}
		// 인원수 줄어들어서 선택된 좌석수보다 적어질 경우
		if (selectedSeatsCnt > sum) {
			// 선택된 좌석을 먼저 지우라고 alert
			alert("선택하신 좌석수와 인원수가 일치하지 않습니다. 좌석을 먼저 선택해제 해주세요.");
			$(this).val(adolescent); //이전 값 넣어준다
			sum = adult + adolescent + senior;
			console.log('좌석수' + selectedSeatsCnt + '//인원수' + sum);
			return;
		}
		adolescent = adolescentCnt;
		// 금액 계산
		var pay = (adult*13000) + (adolescent*10000) + (senior*6000);
		var text = '총 관람인원	 ' + sum +'명\n\n';
		text += '   총 금액	     '+ pay + '원';

		$('#chargeAccount').val(text);	
	});
	
	$('#seniorCnt').on('change', function(){
		let seniorCnt = parseInt($(this).val());
		if (seniorCnt < 0) {
			$(this).val(0);
			return;
		}
		if (seniorAlert == false) {
			seniorAlert = true;
			alert("경로 발권은 만 65세 이상 고객에게 적용되며, 상영관 입장 시 본인확인(신분증) 후 기준에 따라 입장이 제한 될 수 있습니다.");
		}
		//senior = seniorCnt;
		sum = adult + adolescent + seniorCnt;
		if (sum >= 11) {
			alert("최대 10명까지 예매 가능합니다.");
			$(this).val(0);
			senior = 0;
			sum = adult + adolescent + senior;
			//console.log(sum , adolescent);
			return;
		}
		// 인원수 줄어들어서 선택된 좌석수보다 적어질 경우
		if (selectedSeatsCnt > sum) {
			// 선택된 좌석을 먼저 지우라고 alert
			alert("선택하신 좌석수와 인원수가 일치하지 않습니다. 좌석을 먼저 선택해제 해주세요.");
			$(this).val(senior); //이전 값 넣어준다
			sum = adult + adolescent + senior;
			console.log('좌석수' + selectedSeatsCnt + '//인원수' + sum);
			return;
		}
		senior = seniorCnt;
		// 금액 계산
		var pay = (adult*13000) + (adolescent*10000) + (senior*6000);
		var text = '총 관람인원	 ' + sum +'명\n\n';
		text += '   총 금액	     '+ pay + '원';

		$('#chargeAccount').val(text);

	});
	

	$('.seatBtn').on('click', function(){
		let seatRow = $(this).data('seat-row');
		let seatCol= $(this).data('seat-col');
		//alert(seatRow + seatCol);
		let seat = seatRow + seatCol + ',';

		if ($(this).hasClass("btn-secondary") == true) {
			// 이미 선택된 좌석일 경우
			$(this).removeClass("btn-secondary");
			selectedSeats = selectedSeats.replace(seat, '');
			selectedSeatsCnt--;
		} else {
			if (selectedSeatsCnt+1 > sum) {
				// 선택된 인원보다 선택된 좌석이 많을 경우 (아직 ++ 안 된 상태이므로 +1)
				alert("선택하신 좌석이 인원수를 초과하였습니다");
				console.log('좌석수' + selectedSeatsCnt + '//인원수' + sum);
				return;
				
			}
			$(this).addClass("btn-secondary");
			selectedSeats += seat;
			selectedSeatsCnt++;
		}
		let seatsView = selectedSeats.substring(0, selectedSeats.length-1);
		$('#seatsLocation').val(seatsView);
		
		var arrSeats = seatsView.split(",");
		console.log(arrSeats);
		console.log('좌석수' + selectedSeatsCnt + '//인원수' + sum);
	});
	
	// 예매하기 버튼 클릭시
	$('#reservationBtn').on('click', function(){
		let scheduleId = $('#scheduleId').data('schedule-id');
		//alert(scheduleId);
		if (sum == 0) {
			alert('관람 인원을 선택해주세요');
			return false;
		}
		if (selectedSeats == '') {
			alert('좌석을 선택해주세요');
			return false;
		}
		if (sum != selectedSeatsCnt) {
			alert('선택하신 관람 인원과 좌석수가 일치하지 않습니다');
			return false;
		}
		location.href="/reservation/reservation_pay_view?scheduleId=" + scheduleId + "&selectedSeats=" + selectedSeats;
	});
});
</script>