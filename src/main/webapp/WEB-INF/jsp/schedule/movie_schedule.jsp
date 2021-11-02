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
		<a href="#" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매하기</a>		
	</div>
	<hr width="700" noshade>
</div>

<%-- 선택된 영화 제목 --%>
<div class="d-flex justify-content-start">
	<div class="col-3"></div>
	<h5 class="font-weight-bold mt-3 mb-5">${movie.title}</h5>
</div>


<%-- 해당 영화 스케줄표 --%>
<div class="d-flex justify-content-center">
		
	<div class="mt-4 col-10 d-flex justify-content-center">
		
		<table class="table">
			<thead class="text-center">
				<th>11월1일</th>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleList}" var="schedule">
						<%-- s${fn:substring(schedule.time,4,8)} : 1101, 1102, ... --%>
						<c:if test="${fn:substring(schedule.time,4,8) eq '1101'}">
							<tr>
								<td>${fn:substring(schedule.time,8,10)} : ${fn:substring(schedule.time,10,12)}</td>
							</tr>
							
						</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<table class="table">
			<thead class="text-center">
				<th>11월2일</th>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleList}" var="schedule">
						<%-- s${fn:substring(schedule.time,4,8)} : 1101, 1102, ... --%>
						<c:if test="${fn:substring(schedule.time,4,8) eq '1102'}">
							<tr>
								<td>${fn:substring(schedule.time,8,10)} : ${fn:substring(schedule.time,10,12)}</td>
							</tr>
							
						</c:if>
				</c:forEach>
			</tbody>
		</table>
		<table class="table">
			<thead class="text-center">
				<th>11월3일</th>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleList}" var="schedule">
						<%-- s${fn:substring(schedule.time,4,8)} : 1101, 1102, ... --%>
						<c:if test="${fn:substring(schedule.time,4,8) eq '1103'}">
							<tr>
								<td>${fn:substring(schedule.time,8,10)} : ${fn:substring(schedule.time,10,12)}</td>
							</tr>
							
						</c:if>
				</c:forEach>
			</tbody>
		</table>		
		<table class="table">
			<thead class="text-center">
				<th>11월4일</th>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleList}" var="schedule">
						<%-- s${fn:substring(schedule.time,4,8)} : 1101, 1102, ... --%>
						<c:if test="${fn:substring(schedule.time,4,8) eq '1104'}">
							<tr>
								<td>${fn:substring(schedule.time,8,10)} : ${fn:substring(schedule.time,10,12)}</td>
							</tr>
							
						</c:if>
				</c:forEach>
			</tbody>
		</table>		
		
	</div>
</div>


<script>
	
</script>

