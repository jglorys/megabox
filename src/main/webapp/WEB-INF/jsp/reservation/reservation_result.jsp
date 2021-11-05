<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<div class="d-flex mt-4">
	<div class="col-2"></div>
	<div class="mt-4 ml-4 col-8 d-flex">
		<div class="col-8">
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.movieTitle}</span><br><br>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.auditoriumName}관</span><br><br>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${fn:substring(schedule.time,0,4)}.${fn:substring(schedule.time,4,6)}.${fn:substring(schedule.time,6,8)}  |   
			${fn:substring(schedule.time,8,10)}시 ${fn:substring(schedule.time,10,12)}분
			</span><br><br>
			<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">성인 ${reservation.adult}명 / 청소년 ${reservation.adolescent}명 / 경로 ${reservation.senior}명</span><br><br>
			<span class="font-weight-bold p-1 mr-5" style="background-color:#E6E6E6; border-radius: 2em;">좌석 : ${fn:replace(reservation.seatLocation, ',', ' & ')}</span>
		</div>
		<div class="col-3 d-flex align-items-end justify-content-end">
			<span class="font-weight-bold p-1">금액 : ${reservation.payment}원</span>
		</div>
		<br>
	</div>
</div>
<hr width="700" noshade> 

<div class="d-flex justify-content-center mt-5 pt-5 mb-5">
	<h1 class="font-weight-bold" style="color: #380B61;">예매가 완료되었습니다</h1>

</div>