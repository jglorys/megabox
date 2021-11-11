<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL Formatting --%>

<%-- 영화>>>전체영화& 무비포스트@@  --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/movie/movie_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">전체영화</a>	
		<a href="/moviepost/moviepost_list_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">무비포스트</a>
	</div>
	<hr width="700" noshade>
</div>
    
<div class="col-10 d-flex justify-content-end mb-4">
	<%-- 무비포스트 작성 버튼 --%>
	<button type="button" id="moviePostCreateBtn" class="btn text-white" onclick="location.href='/moviepost/create_view' " style="background-color: #380B61; height:50px; border-radius: 1em;">무비포스트 작성</button>
</div>



<div class="d-flex justify-content-center">
	<div>
		<c:forEach var="moviePostView" items="${moviePostViewList}">
		<div class="p-4 m-4 d-flex" style="background-color: #380B61; border-radius:1em;width:700px; height:340px;">
			<div class="col-4">
				<img src="${moviePostView.movie.posterImage}" style="width:200px;">
			</div>
			<div class="col-8 ml-2">
				<div class="d-flex justify-content-between">
					<span class=" p-1 text-white">
					<fmt:formatDate value="${moviePostView.moviePost.updatedAt}" pattern="yyyy년MM월dd일 HH시mm분"/></span>
					<c:if test="${userId eq moviePostView.moviePost.userId}">
							<a href="#" class="postDelBtn" data-moviepost-id="${moviePostView.moviePost.id}"> 
								<img src="https://www.iconninja.com/files/87/751/712/x-icon.png" width="30px" height="30px"></a>
					</c:if>
				</div><br>
				<span class=" p-1 text-white">작성자 [ ${moviePostView.user.name} ]</span><br><br>
				<span class=" p-1 text-white">영화제목 [ ${moviePostView.movie.title} ]</span><br><br>
				<textarea class="p-2 text-white" style="border:0 solid black; border-radius:1em;resize: none;width:400px;" disabled>${moviePostView.moviePost.content}</textarea>
			</div>
		</div>
		
		</c:forEach>
	</div>
</div>

<script>
$(document).ready(function(){
	$('.postDelBtn').on('click', function(e){
		e.preventDefault();
		let moviePostId = $(this).data('moviepost-id');
		
		$.ajax({
			type: 'post',
			url: '/moviepost/delete',
			data: {"moviePostId": moviePostId},
			success: function(data) {
				if (data.result == 'success') {
					alert("무비포스트가 삭제되었습니다.");
					location.reload();
				}
			},
			error: function(e) {
				alert("삭제에 실패했습니다. 관리자에게 문의해주세요." + e);
			}
		});
	});
});
</script>