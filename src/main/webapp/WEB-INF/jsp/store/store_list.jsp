<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>
    
<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">팝콘/음료/굿즈</h4>
	</div>
	<div class="d-flex justify-content-center">
		<div class="mt-4 d-flex justify-content-start flex-wrap ml-2" style="width:950px">
			<c:forEach items="${storeList}" var="store">
				<div class="m-3 d-flex justify-content-center flex-wrap " style="height:350px;width:280px ;background-color: #380B61;border-radius: 1em;">
					<a href="/store/store_purchase_view?storeId=${store.id}" style="color: black; text-decoration:none">
						<img src="${store.productImg}" width="220px" height="200px">
						<div style="height:130px; width:220px">
							<span class="font-weight-bold" style="color: #FAFAFA;">${store.product}</span><br>
							<span class="mt-1" style="color: #E6E6E6">${store.composition}</span><br>
							<br>
							<h4 style="color: #FAFAFA;">${store.price}원</h4>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>