<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL Formatting --%>

<%-- 나의 메가박스>>>예매내역@@ $ 구매내역 & 멤버십포인트 & 회원정보수정 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/user/reservation_list_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">예매내역</a>
		<a href="/user/purchase_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">구매내역</a>		
		<a href="/user/point_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">멤버십포인트</a>		
		<a href="/user/user_update_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">회원정보 수정</a>		
	</div>
	<hr width="900" noshade>
</div>

<div class="d-flex justify-content-center">
	<div style=" width:600px;" >
	<c:if test="${empty reservationScheduleList}">
		<div class="d-flex justify-content-center mt-5 pt-5 mb-5">
			<h1 class="font-weight-bold" style="color: #380B61;">예매 내역이 없습니다</h1>
		</div>
	</c:if>
	<c:forEach var="reservationSchedule" items="${reservationScheduleList}">
		<div class="p-4 m-4" style="background-color: #E6E6E6; border-radius:1em;">
			<span class="font-weight-bold p-1">예매날짜 :
			<fmt:formatDate value="${reservationSchedule.reservation.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span><br><br>
			<span class="font-weight-bold p-1">${reservationSchedule.schedule.movieTitle}</span><br><br>
			<span class="font-weight-bold p-1" style="background-color: #F2F5A9;">${reservationSchedule.schedule.auditoriumName}관</span><br><br>
			<span class="font-weight-bold p-1" style="background-color: #F2F5A9;">${fn:substring(reservationSchedule.schedule.time,0,4)}.${fn:substring(reservationSchedule.schedule.time,4,6)}.${fn:substring(reservationSchedule.schedule.time,6,8)}  |   
			${fn:substring(reservationSchedule.schedule.time,8,10)}시 ${fn:substring(reservationSchedule.schedule.time,10,12)}분
			</span><br><br>
			<span class="font-weight-bold p-1">성인 ${reservationSchedule.reservation.adult}명 / 청소년 ${reservationSchedule.reservation.adolescent}명 / 경로 ${reservationSchedule.reservation.senior}명</span><br><br>
			<span class="font-weight-bold p-1" style="background-color: #F2F5A9;">좌석 : ${fn:replace(reservationSchedule.reservation.seatLocation, ',', ' & ')}</span><br><br>
			<span class="font-weight-bold p-1">결제금액 : ${reservationSchedule.reservation.payment}원</span>
			<div class="d-flex justify-content-end">
				<button type="button" class="btn text-white reservationCancelBtn" data-reservation-id="${reservationSchedule.reservation.id}" style="background-color: #380B61; border-radius:2em;">예매취소</button>
			</div>
		</div>
		
	</c:forEach>
	</div>
</div>

<script>
$(document).ready(function(){
	$('.reservationCancelBtn').on('click', function(){
		// 만약 날짜가 지났으면 취소 불가
		let reservationId = $(this).data('reservation-id');
		//alert(reservationId);
		// ajax
		$.ajax({
			type: 'post',
			url: '/reservation/delete',
			data: {"reservationId": reservationId},
			success: function(data) {
				if (data.result == 'success') {
					alert("예매가 취소되었습니다.");
					location.reload();
				}
			},
			error: function(e) {
				alert("예매취소에 실패했습니다. 관리자에게 문의해주세요." + e);
			}
		});
	});
	
});


</script>