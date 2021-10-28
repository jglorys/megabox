<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">상영시간표</h4>
		<button type="button" onclick="location.href='/admin/schedule/schedule_create_view' "class="btn text-white" style="background-color: #380B61;">상영시간표 등록</button>
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
				<td>${schedule.time}</td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>
