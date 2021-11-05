<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">상영시간표</h4>
		<button type="button" onclick="location.href='/admin/schedule/schedule_create_view' "class="btn text-white" style="background-color: #380B61;border-radius: 1em;height: 45px ;width: 150px;">상영시간표 등록</button>
	</div>
	
	<table class="table mt-4 table-hover table-striped">
		<thead class="text-center">
			<tr class="bg-light">
				<th>No.</th>
				<th>영화 제목</th>
				<th>상영관</th>
				<th>상영일시</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<c:forEach items="${scheduleList}" var="schedule">
			<tr>
				<td>${schedule.id}</td>
				<td>${schedule.movieTitle}</td>
				<td>${schedule.auditoriumName}관</td>
				<td>
				${fn:substring(schedule.time,0,4)}년
				${fn:substring(schedule.time,4,6)}월
				${fn:substring(schedule.time,6,8)}일
				${fn:substring(schedule.time,8,10)}시
				${fn:substring(schedule.time,10,12)}분</td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>
