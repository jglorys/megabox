<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<%-- 상영시간표@@ & 예매하기 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/schedule/movie_schedule_select_view"class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">상영시간표</a>
		<a href="#" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매하기</a>		
	</div>
	<hr width="700" noshade>
</div>

<div class="d-flex justify-content-center">
	<h3  style="color: #380B61;">영화를 선택해주세요</h3>
</div>

<div class="d-flex">
	<div class="col-4"></div>
	<div class="col-4 ml-3">
	<c:forEach items="${movieList}" var="movie">
		<div class="m-3 d-flex justify-content-start align-items-center">
			<c:if test="${movie.viewingClass eq '전체'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_A.png" width="40" height="40" class="mt-3 mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '12세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/0/04/KMRB_B.png" width="40" height="40" class="mt-3 mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '15세'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/5/52/KMRB_C.png" width="40" height="40" class="mt-3 mr-2">
			</c:if>
			<c:if test="${movie.viewingClass eq '청불'}">
				<img src="https://upload.wikimedia.org/wikipedia/commons/b/bf/KMRB_D.png" width="40" height="40" class="mt-3 mr-2">
			</c:if>
			<a href="/schedule/movie_schedule_view?movieId=${movie.id}" class="font-weight-bold mt-4 p-3 bg-light" style=" border-radius: 2em; color: black; text-decoration:none">${movie.title}</a>
		</div>
	</c:forEach>
	</div>
</div>
