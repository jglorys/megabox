<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

    
    
<div class="d-flex justify-content-center mt-5">
	<div class="text-center mt-3">
		<h2>무비포스트 작성</h2>
		<hr width="400" noshade>
	</div>
</div>

<div class="d-flex justify-content-center mt-5">
	<div>
		<div>
			<h5>영화 선택</h5>
			<select class="form-control mt-4" id="selectedMovie">
					<option value="none" disabled selected>=== 선택 ===</option>
					<c:forEach items="${movieList}" var="movie">
						<option value="${movie.id}">${movie.title} - ${movie.director}</option>
					</c:forEach>
			</select>
		</div>
		<div class="mt-5">
			<textarea id="moviePostContent" cols="50" rows="12" class="form-control" placeholder="무비포스트를 입력해주세요" style="width:500px; height="></textarea>
		</div>
		<div class="d-flex justify-content-between mt-5">
			<button type="button" id="cancelBtn" class="btn bg-secondary text-white" onclick="location.href='/moviepost/moviepost_list_view' " style="border-radius: 1em;height: 50px ;width: 150px;">취소</button>
			<button type="button" id="moviePostCreateBtn" class="btn text-white" style="background-color: #380B61; border-radius: 1em;height: 50px ;width: 150px;">업로드</button>
		</div>
	
	
	</div>
</div>



<script>
$(document).ready(function(){
	$('#moviePostCreateBtn').on('click', function(){
		//validation check
		let movieId = $('#selectedMovie').val();
		let moviePostContent = $('#moviePostContent').val();
		if (movieId == null) {
			alert('영화를 선택해주세요');
			return;
		} 
		if (moviePostContent == '') {
			alert('무비포스트를 입력해주세요');
			return;
		} 
		
		
		let formData = new FormData();
		formData.append('movieId', movieId);
		formData.append('moviePostContent', moviePostContent);
		
		$.ajax({
			type: 'post',
			url: '/moviepost/create',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("무비포스트가 성공적으로 업로드되었습니다");
					location.href="/moviepost/moviepost_list_view";
				}
			},
			error: function(e) {
				alert("무비포스트 업로드에 실패했습니다." + e);
			}
		});
		
	});
	
	
});
</script>