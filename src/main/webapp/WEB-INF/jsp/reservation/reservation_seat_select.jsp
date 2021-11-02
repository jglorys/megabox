<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<div class="d-flex mt-4">
	<div class="col-4"></div>
	<div class="mt-2">
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.movieTitle}</span><br><br>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${schedule.auditoriumName}관</span><br><br>
		<span class="font-weight-bold p-1" style="background-color:#E6E6E6; border-radius: 2em;">${fn:substring(schedule.time,0,4)}.${fn:substring(schedule.time,4,6)}.${fn:substring(schedule.time,6,8)}  |   
		${fn:substring(schedule.time,8,10)}시 ${fn:substring(schedule.time,10,12)}분
		</span><br>
	</div>
</div>
<hr width="400" noshade>

<div class="d-flex justify-content-center text-center">
	<h4>인원 및 좌석을 선택해주세요</h4>	
</div>