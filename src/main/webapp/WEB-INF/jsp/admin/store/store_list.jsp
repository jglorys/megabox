<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">스토어</h4>
		<button type="button" onclick="location.href='/admin/store/store_create_view' "class="btn text-white" style="background-color: #380B61;border-radius: 1em;height: 45px ;width: 150px;">스토어 등록</button>
	</div>
	<div class="d-flex justify-content-center">
		<div class="mt-4 d-flex justify-content-start flex-wrap ml-2" style="width:950px">
			<c:forEach items="${storeList}" var="store">
				<div class="m-3 d-flex justify-content-center flex-wrap" style="height:350px;width:280px ;background-color: #fff;border-radius: 1em;">
					<img src="${store.productImg}" width="250px" height="220px">
					<div style="height:130px;">
						<span class="font-weight-bold">${store.product}</span>
						<span class="text-secondary ml-5">잔여수량</span><br>
						<span class="text-secondary mt-1">${store.composition}</span><br>
						<hr width="220px">
						<h4 style="color: #380B61;">${store.price}원</h4>
					</div>
					
				</div>
			</c:forEach>
		</div>
	</div>
</div>