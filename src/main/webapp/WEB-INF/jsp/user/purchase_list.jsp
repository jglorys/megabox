<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL Formatting --%>

<%-- 나의 메가박스>>>예매내역 $ 구매내역@@ & 멤버십포인트 & 회원정보수정 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/user/reservation_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매내역</a>		
		<a href="/user/purchase_list_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">구매내역</a>
		<a href="/user/point_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">멤버십포인트</a>		
		<a href="/user/user_update_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">회원정보 수정</a>		
	</div>
	<hr width="900" noshade>
</div>

<div class="d-flex justify-content-center">
	<div style=" width:600px;" >
	<c:if test="${empty purchaseStoreViewList}">
		<div class="d-flex justify-content-center mt-5 pt-5 mb-5">
			<h1 class="font-weight-bold" style="color: #380B61;">구매 내역이 없습니다</h1>
		</div>
	</c:if>
	<c:forEach var="purchaseStoreView" items="${purchaseStoreViewList}">
		<div class="p-4 m-4 d-flex" style="background-color: #E6E6E6; border-radius:1em;height:400px;width:600px ;">
			<div class="d-flex justify-content-center flex-wrap" style="height:350px;width:280px ;background-color: #fff;border-radius: 1em;">
					<img src="${purchaseStoreView.store.productImg}" width="220px" height="200px">
					<div style="height:130px; width:220px">
						<span class="font-weight-bold">${purchaseStoreView.store.product}</span><br>
						<span class="text-secondary mt-1">${purchaseStoreView.store.composition}</span><br>
						<hr width="220px">
						<h4 style="color: #380B61;">${purchaseStoreView.store.price}원</h4>
					</div>
			</div>
			<div class="ml-3 mt-3">
				<span class="font-weight-bold p-1">구매날짜 :
				<fmt:formatDate value="${purchaseStoreView.purchase.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span><br><br>
				<span class="font-weight-bold" style="background-color: #F2F5A9;">상품 교환번호 : ${purchaseStoreView.purchase.exchangeNumber}</span><br><br>
				<span class="font-weight-bold p-1">포인트 사용금액 : ${purchaseStoreView.purchase.usedPoint}원</span><br><br>
				<span class="font-weight-bold p-1">총 결제금액 : ${purchaseStoreView.purchase.payment}원</span>
			</div>
		</div>
	</c:forEach>
	</div>
</div>
