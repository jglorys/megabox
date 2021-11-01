<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<%-- 상영시간표@@ & 예매하기 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/schedule/movie_schedule_select_view" class="font-weight-bold mt-4 bg-secondary p-3" style="color: black; text-decoration:none">상영시간표</a>
		<a href="#" class="font-weight-bold mt-4 bg-light p-3" style="color: black; text-decoration:none">예매하기</a>		
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
		
	<div class="mt-4 col-10">
		<table class="table">
			<thead class="text-center">
				<tr>
					<th>11/1</th>
					<th>11/2</th>
					<th>11/3</th>
					<th>11/4</th>
					<th>11/5</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${scheduleList}" var="schedule">
			${schedule.movieTitle}
			${schedule.auditoriumName}
			${schedule.time}
		

				</c:forEach>
			
			</tbody>
			
		</table>
		
	</div>
</div>


