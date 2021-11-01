<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="d-flex justify-content-center pt-5">
	<b>박스오피스</b>
</div>
<hr width="120" noshade>

<div class="d-flex justify-content-between align-items-center">
		<%-- 포스터 이미지 --%>
		
		<c:forEach items="${movieList}" var="movie">
			<div class="col-3">
				<div>
						<img src="${movie.posterImage}" class="w-100">
				</div>
				<button type="button" class="btn text-white" style="background-color: #380B61;">예매</button>
			</div>
		</c:forEach>
</div>
