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
<div class="d-flex justify-content-center text-center mb-4">
	<h4>${fn:substring(date,4,6)}월 ${fn:substring(date,6,8)}일 상영시간표입니다<br><br>
	시간대를 선택해주세요</h4>	
</div>

<div class="d-flex justify-content-center">
	<div style="border-radius: 2em; background-color: #380B61;">
		<table class="m-4">
			<c:forEach var="movieTitle" items="${movieTitleList}">			
						<tr style="height: 100px" class="mt-3">
							<th class="text-center text-white"><div style="min-width:230px;">${movieTitle}</div></th>
							<th class="text-center text-white p-3">|</th>
							<c:forEach items="${scheduleViewList}" var="scheduleView">
								<c:if test="${movieTitle eq scheduleView.schedule.movieTitle}">
									<td style="border-top: none; border-bottom: none; width:150px"><a href="/reservation/reservation_seat_select_view?scheduleId=${scheduleView.schedule.id}" class="font-weight-bold mt-4 p-3 bg-light" style="color: black; border-radius: 2em; text-decoration:none">
						  ${fn:substring(scheduleView.schedule.time,8,10)}:${fn:substring(scheduleView.schedule.time,10,12)} (${ scheduleView.leftSeat }석)</a></td>
								</c:if>
							</c:forEach>
						</tr>
			</c:forEach>	
		</table>		
	</div>
</div>


		