<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="d-flex justify-content-center pt-5 mb-4">
	<b>박스오피스</b>
</div>
<hr width="120" noshade>

<div class="d-flex justify-content-between align-items-center mt-5">
		<%-- 포스터 이미지 --%>
		
		<c:forEach items="${movieList}" var="movie" begin="0" end="3">
			<div class="col-3">
				<div class="d-flex justify-content-center">
						<img src="${movie.posterImage}" width="220px" style="border-radius: 1em;">
				</div>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn text-white mt-2 p-1" style="border-radius: 1em;height: 40px ;width: 100px;background-color: #380B61;" onclick="location.href='/schedule/movie_schedule_view?movieId='+ ${movie.id} ">예매</button>
				</div>
			</div>
		</c:forEach>
</div>

<script>
$(document).ready(function(){
	//console.log("영화목록: " + $('.movieList').data('movie-list'));
	
	
});
	

</script>