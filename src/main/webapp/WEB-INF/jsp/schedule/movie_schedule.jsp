<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<%-- 상영시간표@@ & 예매하기 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/schedule/movie_schedule_select_view"class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">상영시간표</a>
		<a href="/reservation/reservation_date_select_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매하기</a>		
	</div>
	<hr width="700" noshade>
</div>

<%-- 선택된 영화 제목 --%>
<div class="d-flex justify-content-start">
	<div class="col-3"></div>
	<div class="d-flex justify-content-start align-items-center mb-4">
			<c:if test="${movie.viewingClass eq '전체'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_A.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '12세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/0/04/KMRB_B.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '15세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/5/52/KMRB_C.png" width="40" height="40" class="mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '청불'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_D.png" width="40" height="40" class="mr-2">
			</c:if>
			<h5 class="font-weight-bold mt-1 mb-2">${movie.title}</h5>
	</div>
	
</div>


<%-- 해당 영화 스케줄표 --%>
<div class="d-flex justify-content-center">
		
	<div class="mt-3 p-1 col-10 d-flex justify-content-center"  style="background-color: #380B61; border-radius: 2em;">
		<c:forEach var="i" begin="1" end="4">
		<table class="table">
			<thead class="text-center text-white">
				<tr>
					<th style="border-top: none; "><div style="min-height:30px;">
         			11월${i}일</div></th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleViewList}" var="scheduleView">
						<%-- s${fn:substring(schedule.time,4,8)} : 1101, 1102, ... --%>
						<c:set var="date">110${i}</c:set>
						<c:if test="${fn:substring(scheduleView.schedule.time,4,8) eq date}">
							<tr>
								<td style="border-top: none; border-bottom: none; height:70px;"><div class="d-flex align-items-center justify-content-center"style="min-height:60px;">
								<a href="/reservation/reservation_seat_select_view?scheduleId=${scheduleView.schedule.id}" class="font-weight-bold p-3 bg-light" style="color: black; border-radius: 2em; text-decoration:none">${fn:substring(scheduleView.schedule.time,8,10)} : ${fn:substring(scheduleView.schedule.time,10,12)}
								(${scheduleView.leftSeat}석)</a></div></td>
							</tr>
						</c:if>
				</c:forEach>
			</tbody>
		</table>
		</c:forEach>

	</div>
</div>



