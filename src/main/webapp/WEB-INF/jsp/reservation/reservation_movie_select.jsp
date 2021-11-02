<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%-- 예매>>>상영시간표 & 예매하기@@ --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/schedule/movie_schedule_select_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">상영시간표</a>	
		<a href="/reservation/reservation_date_select_view"class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">예매하기</a>	
	</div>
	<hr width="700" noshade>
</div>
<%--
<button type="button" class="btn btn-secondary m-4" onclick="location.href='/reservation/reservation_date_select_view'">이전으로</button>	
 --%>
<div class="d-flex justify-content-center text-center">
	<h4>${fn:substring(date,4,6)}월 ${fn:substring(date,6,8)}일 상영시간표입니다<br><br>
	원하시는 영화와 시간을 선택해주세요</h4>	
</div>

<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<c:forEach items="${scheduleList}" var="schedule">
			<c:if test="${date eq fn:substring(schedule.time,0,8)}">
				<div class="mt-5 text-center">
					<a href="/reservation/reservation_seat_select_view?scheduleId=${schedule.id}" class="font-weight-bold mt-4 p-3 bg-light" style="color: black; border-radius: 2em; text-decoration:none">
				${schedule.movieTitle}  ${fn:substring(schedule.time,8,10)}:${fn:substring(schedule.time,10,12)}</a>	
				</div>
				
			</c:if>
		</c:forEach>
	</div>
</div>

		