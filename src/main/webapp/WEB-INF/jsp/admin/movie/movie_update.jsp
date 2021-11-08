<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="col-6">
		<button type="button" class="btn btn-secondary mb-4" onclick="location.href='/admin/movie/movie_list_view'" style="border-radius: 1em;height: 40px ;width: 110px;">목록으로</button>
		<table class="table table-striped w-75 ml-5 mt-2">
			<tbody class="text-center">
				<tr>
					<th class="bg-light">제목</th>
					<td>
						<span class="font-weight-bold">${movie.title}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">감독</th>
					<td>
						<span class="font-weight-bold">${movie.director}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">개봉</th>
					<td>
						<span class="font-weight-bold">${movie.releasedDate}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">장르</th>
					<td>
						<span class="font-weight-bold">${movie.genre}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">출연</th>
					<td>
						<span class="font-weight-bold">${movie.actor}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">평점</th>
					<td>
						<input type="text" id="movieRating" class="form-control" value="${movie.rating}">
					</td>
				</tr>
				<tr>
					<th class="bg-light">상영시간(분)</th>
					<td>
						<span class="font-weight-bold">${movie.runningTime}</span>
					</td>
				</tr>
				<tr>
					<th class="bg-light">예매순위</th>
					<td>
						<input type="text" id="movieRanking" class="form-control" value="${movie.ranking}">
					</td>
				</tr>
				<tr>
					<th class="bg-light">상영여부</th>
					<td>
						<input type="text" id="movieIsScreening" class="form-control" value="${movie.isScreening}">
					</td>
				</tr>
				<tr>
					<th class="bg-light">영화관람등급</th>
					<td>
						<span class="font-weight-bold">${movie.viewingClass}</span>
					</td>
				</tr>
			</tbody>
		</table>	
	</div>
	
	<div class="col-6">
		<br><br>
		<%-- 영화포스터 업로드 div --%>
		<div class="d-flex justify-content-around">
			<img src="${movie.posterImage}" alt="포스터 이미지" width="300px">
			<%-- <input type="file" id="posterImgFile" accept=".jpg, .jpeg, .png, .gif" class="btn btn-primary">--%>
		</div>
		<br><br>
		<%-- 영화 설명 --%>
		<div class="m-2">
			<textarea id="movieIntroduction" rows="4" cols="10" class="form-control">${movie.introduction}</textarea>
		</div><br>
		<div class="d-flex justify-content-center mb-5">
			<button type="button" id="movieUpdateBtn" class="btn text-white" style="background-color: #380B61; border-radius: 1em;height: 50px ;width: 120px;">수정 완료</button>
		</div>
	</div>
</div>
<div class="w-100" style="height: 50px ;"></div>

<script>
$(document).ready(function(){
	
	$('#movieUpdateBtn').on('click', function(){
		//validation check
		let movieRating = $('#movieRating').val().trim();
		if (movieRating == '') {
			alert('평점을 입력해주세요.');
			return;
		}
		let movieRanking = $('#movieRanking').val().trim();
		if (movieRanking == '') {
			alert('예매순위를 입력해주세요.');
			return;
		}
		let movieIsScreening = $('#movieIsScreening').val().trim();
		if (movieIsScreening == '') {
			alert('상영여부를 입력해주세요.');
			return;
		}
		let movieIntroduction = $('#movieIntroduction').val().trim();
		if (movieIntroduction == '') {
			alert('영화설명을 입력해주세요.');
			return;
		}
		
		// formData
		let formData = new FormData();
		formData.append('id', ${movie.id})
		formData.append('rating', movieRating);
		formData.append('isScreening', movieIsScreening);
		formData.append('ranking', movieRanking);
		formData.append('introduction', movieIntroduction);
		
		// ajax
		$.ajax({
			type: 'post',
			url: '/admin/movie/update',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("영화 수정이 완료되었습니다");
					location.href = "/admin/movie/movie_list_view";	
				}
			},
			error: function(e) {
				alert("영화 수정에 실패했습니다." + e);
			}
		});
	});
});



</script>

