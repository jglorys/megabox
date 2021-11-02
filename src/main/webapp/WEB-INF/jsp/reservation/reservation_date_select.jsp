<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
    
<%-- 예매>>>상영시간표 & 예매하기@@ --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/schedule/movie_schedule_select_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">상영시간표</a>	
		<a href="/reservation/reservation_date_select_view"class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">예매하기</a>	
	</div>
	<hr width="700" noshade>
</div>

<div class="d-flex justify-content-center">
	<h3>날짜를 선택해주세요</h3>
</div>

<div class="d-flex justify-content-center m-4">
			<a href="/reservation/reservation_movie_select_view?date=20211101" class="font-weight-bold mt-4 p-3 bg-light" style=" border-radius: 2em; color: black; text-decoration:none">11월 1일</a>
			<a href="/reservation/reservation_movie_select_view?date=20211102" class="font-weight-bold ml-3 mt-4 p-3 bg-light" style=" border-radius: 2em; color: black; text-decoration:none">11월 2일</a>
			<a href="/reservation/reservation_movie_select_view?date=20211103" class="font-weight-bold ml-3 mt-4 p-3 bg-light" style=" border-radius: 2em; color: black; text-decoration:none">11월 3일</a>
			<a href="/reservation/reservation_movie_select_view?date=20211104" class="font-weight-bold ml-3 mt-4 p-3 bg-light" style=" border-radius: 2em; color: black; text-decoration:none">11월 4일</a>
</div>
