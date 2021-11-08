<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<%-- 영화>>>전체영화@@ & 무비포스트 --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/movie/movie_list_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">전체영화</a>
		<a href="#" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">무비포스트</a>		
	</div>
	<hr width="700" noshade>
</div>

<div class="d-flex justify-content-center">
	<div class="d-flex flex-wrap" style="border-radius: 2em; background-color: #380B61; width:1200px; " >
	<c:forEach var="movie" items="${movieList}">
		<div class="col-3 mt-3 mb-3">
				<div class="d-flex justify-content-center">
						<span class="text-white mb-2">${movie.ranking}위</span>
				</div>
				<div class="d-flex justify-content-center">
						<a href="#" class="movieDetailBtn" data-toggle="modal" data-target="#movieDetaliModal" 
						data-movie-title="${movie.title}" data-movie-director="${movie.director}"
						data-movie-releaseddate="${movie.releasedDate}" data-movie-genre="${movie.genre}"
						data-movie-actor="${movie.actor}" data-movie-rating="${movie.rating}"
						data-movie-runningtime="${movie.runningTime}" data-movie-viewingclass="${movie.viewingClass}"
						data-movie-introduction="${movie.introduction}" data-movie-poster="${movie.posterImage}">
						<img src="${movie.posterImage}" width="220px" style="border-radius: 1em;"></a>
				</div>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-light mt-2 p-1" style="border-radius: 1em;height: 40px ;width: 100px;" onclick="location.href='/schedule/movie_schedule_view?movieId='+ ${movie.id} ">예매</button>
				</div>
				
		</div>
	
	</c:forEach>
	</div>
</div>

<!-- movieDetail Modal -->
<div class="modal fade" id="movieDetaliModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content" style="border-radius: 2em; background: rgba(0, 0, 0, 0.9); height:700px;">
    	<div class="modal-body d-flex">
    		<div class="w-50">
    			<input type="image" src="" id="moviePosterImage" style="border-radius: 1em;">
    		</div>
    		<table class="w-50" style="border-radius: 1em; background: #fff;">
				<tbody class="text-center">
					<tr>
						<th class="bg-light">제목</th>
						<td>
							<input type="text" id="movieTitle" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">감독</th>
						<td>
							<input type="text" id="movieDirector" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">개봉</th>
						<td>
							<input type="text" id="movieReleasedDate" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">장르</th>
						<td>
							<input type="text" id="movieGenre" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">출연</th>
						<td>
							<textarea id="movieActor" class="font-weight-bold" style="text-color:#000;border-radius: 1em; width:250px;border: none; background: transparent; resize: none;" disabled></textarea>
							<%--<input type="text" id="movieActor" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
							 --%>
						</td>
					</tr>
					<tr>
						<th class="bg-light">평점</th>
						<td>
							<input type="text" id="movieRating" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">상영시간</th>
						<td>
							<input type="text" id="movieRunningTime" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">관람등급</th>
						<td>
							<input type="text" id="movieViewingClass" class="font-weight-bold" style="text-color:#000;border-radius: 1em; height: 20px;border: none; background: transparent;" disabled>
						</td>
					</tr>
					<tr>
						<th class="bg-light">설명</th>
						<td>
							<textarea id="movieIntroduction" class="font-weight-bold" style="text-color:#000;border-radius: 1em; width:300px;height: 120px;border: none; background: transparent;resize: none;" disabled></textarea>
						</td>
					<tr>
					</tr>
				</tbody>	
			</table>
   		</div>
   	</div>
  </div>
</div>

<script>
$(document).ready(function(){
	$('.movieDetailBtn').on('click', function(e){
		e.preventDefault();
		// 모달이 띄워질때,
		// 지금 클릭된 태그의 movieId를 가져온다.  $('.more-btn').data 해서 가져오면, 첫번째 클래스에 있는 postId만 가져오게 됨!!!!
		let movieTitle = $(this).data('movie-title');
		let movieDirector = $(this).data('movie-director');
		let movieReleasedDate = $(this).data('movie-releaseddate');
		let movieGenre = $(this).data('movie-genre');
		let movieActor = $(this).data('movie-actor');
		let movieRating = $(this).data('movie-rating');
		let movieRunningTime = $(this).data('movie-runningtime') + '분';
		let movieViewingClass = $(this).data('movie-viewingclass') + '관람가';
		let movieIntroduction = $(this).data('movie-introduction');
		let moviePosterImage = $(this).data('movie-poster');
		
		$('#movieTitle').val(movieTitle);
		$('#movieDirector').val(movieDirector);
		$('#movieReleasedDate').val(movieReleasedDate);
		$('#movieGenre').val(movieGenre);
		$('#movieActor').val(movieActor);
		$('#movieRating').val(movieRating);
		$('#movieRunningTime').val(movieRunningTime);
		$('#movieViewingClass').val(movieViewingClass);
		$('#movieIntroduction').val(movieIntroduction);
		$('#moviePosterImage').val(moviePosterImage);
		
	});
	
	
	
});


</script>