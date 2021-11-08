<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%-- 나의 메가박스>>>예매내역 & 멤버십포인트@@ & 회원정보수정 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/user/reservation_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매/구매내역</a>		
		<a href="/user/point_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">멤버십포인트</a>		
		<a href="#" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">회원정보 수정</a>		
	</div>
	<hr width="900" noshade>
</div>

<div class="col-8 ">
		<h4 class="text-center">${userName}님이 보유하신 포인트는 <span style="background-color: #F3F781;">${user.point}P</span> 입니다</h4>

</div>