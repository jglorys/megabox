<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<%-- 나의 메가박스>>>예매내역 & 멤버십포인트@@ & 회원정보수정 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/user/reservation_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매/구매내역</a>		
		<a href="/user/point_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">멤버십포인트</a>		
		<a href="#" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">회원정보 수정</a>		
	</div>
	<hr width="900" noshade>
</div>

<div class="d-flex justify-content-center">
	<div class="col-8">
		<br><h4 class="mt-3">${userName}님이 보유하신 포인트는 <span style="background-color: #F2F5A9;">${user.point}P</span> 입니다</h4><br>
		<div class="d-flex justify-content-center mt-4">
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>적립/사용내역</th>
						<th>적립/사용금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="point" items="${pointList}">
						<tr>
							<td>${point.createdAt}</td>
							<td>${point.history}</td>
							<td>${point.plusMinus}${point.changePoint}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
