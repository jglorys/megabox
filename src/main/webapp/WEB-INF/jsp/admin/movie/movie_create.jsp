<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="col-6">
		<button type="button" class="btn btn-secondary mb-4" onclick="location.href='/admin/movie/movie_list_view'">등록취소</button>
		<table class="table table-striped w-75 ml-5 mt-2">
			<tbody class="text-center">
				<tr>
					<th class="bg-light">제목</th>
					<td>
						<input type="text" id="movieTitle" class="form-control" placeholder="제목을 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">감독</th>
					<td>
						<input type="text" id="movieDirector" class="form-control" placeholder="감독명을 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">개봉</th>
					<td>
						<input type="text" id="movieReleasedDate" class="form-control" placeholder="예) 20210102">
					</td>
				</tr>
				<tr>
					<th class="bg-light">장르</th>
					<td>
						<input type="text" id="movieGenre" class="form-control" placeholder="장르를 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">출연</th>
					<td>
						<input type="text" id="movieActor" class="form-control" placeholder="주연배우명을 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">평점</th>
					<td>
						<input type="text" id="movieRating" class="form-control" placeholder="평점을 입력해주세요 예)9.99">
					</td>
				</tr>
				<tr>
					<th class="bg-light">상영시간(분)</th>
					<td>
						<input type="text" id="movieRunningTime" class="form-control" placeholder="예) 2시간이면 120">
					</td>
				</tr>
				<tr>
					<th class="bg-light"h>예매순위</th>
					<td>
						<input type="text" id="movieRanking" class="form-control" placeholder="예매순위를 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">상영여부</th>
					<td>
						<select id="movieIsScreening" class="form-control">
							<option value="none" disabled selected>=== 선택 ===</option>
							<option>Y</option>
							<option>N</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="bg-light">영화관람등급</th>
					<td>
						<select id="movieViewingClass" class="form-control">
							<option value="none" disabled selected>=== 선택 ===</option>
							<option>전체</option>
							<option>12세</option>
							<option>15세</option>
							<option>청불</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>	
	</div>
	
	<div class="col-6">
		<br><br>
		<%-- 영화포스터 업로드 div --%>
		<div class="d-flex justify-content-around mt-5">
			<input type="file" id="posterImgFile" accept=".jpg, .jpeg, .png, .gif" class="btn btn-primary">
			<!-- <label class="btn btn-primary btn-file">포스터 업로드<input type="file"  accept=".jpg, .jpeg, .png, .gif"></label> -->
		</div>
		<br><br><br>
		<%-- 영화 설명 --%>
		<div class="m-2 h-25">
			<textarea id="movieIntroduction" rows="4" cols="10" class="form-control" placeholder="영화 설명을 입력해주세요"></textarea>
		</div>
		<br>
		<div class="d-flex justify-content-center">
			<button type="button" id="movieUploadBtn" class="btn text-white" style="background-color: #380B61;">영화 등록</button>
		</div>
	</div>

</div>


<script>
$(document).ready(function(){
	
	// 영화 등록 버튼 클릭
	$('#movieUploadBtn').on('click', function(){
		//validation check
		let movieTitle = $('#movieTitle').val().trim();
		if (movieTitle == '') {
			alert('제목을 입력해주세요.');
			return;
		}
		let movieDirector = $('#movieDirector').val().trim();
		if (movieDirector == '') {
			alert('감독명을 입력해주세요.');
			return;
		}
		let movieReleasedDate = $('#movieReleasedDate').val().trim();
		if (movieReleasedDate == '') {
			alert('개봉일을 입력해주세요.');
			return;
		}
		let movieGenre = $('#movieGenre').val().trim();
		if (movieGenre == '') {
			alert('장르를 입력해주세요.');
			return;
		}
		let movieActor = $('#movieActor').val().trim();
		if (movieActor == '') {
			alert('주연배우명을 입력해주세요.');
			return;
		}
		let movieRating = $('#movieRating').val().trim();
		if (movieRating == '') {
			alert('평점을 입력해주세요.');
			return;
		}
		let movieRunningTime = $('#movieRunningTime').val().trim();
		if (movieRunningTime == '') {
			alert('상영시간(분)을 입력해주세요.');
			return;
		}
		
		let movieRanking = $('#movieRanking').val().trim();
		if (movieRanking == '') {
			alert('예매순위를 입력해주세요.');
			return;
		}
		let movieIsScreening = $('#movieIsScreening').val();
		if (movieIsScreening == '') {
			alert('상영여부를 입력해주세요.');
			return;
		}
		let movieViewingClass = $('#movieViewingClass').val();
		if (movieViewingClass == '') {
			alert('영화관람등급을 입력해주세요.');
			return;
		}
		
		let movieIntroduction = $('#movieIntroduction').val().trim();
		if (movieIntroduction == '') {
			alert('영화설명을 입력해주세요.');
			return;
		}
		if (movieReleasedDate.length != 8) {
			alert('개봉일이 잘못 입력되었습니다. 다시 입력해주세요');
			return;
		}
		
		// 포스터 이미지 확장자 검사
		let file = $('#posterImgFile').val(); //파일의 이름을 가지고옴
		if (file == '') {
			alert('포스터를 업로드해주세요.');
			return;
		}
		if (file != '') { //파일이 있을때 확장자 검사
			//console.log("파일명자름" + file.split('.'));
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { //없으면 -1이 나오고 그걸 찾아내야됨
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#posterImgFile').val(''); //잘못된 파일을 지운다
				return;
			}
		}
		
		// form 태그를 자바스크립트에서 만든다
		let formData = new FormData();
		formData.append('title', movieTitle);
		formData.append('director', movieDirector);
		formData.append('releasedDate', movieReleasedDate);
		formData.append('genre', movieGenre);
		formData.append('actor', movieActor);
		formData.append('rating', movieRating);
		formData.append('runningTime', movieRunningTime);
		formData.append('ranking', movieRanking);
		formData.append('isScreening', movieIsScreening);
		formData.append('viewingClass', movieViewingClass);
		formData.append('introduction', movieIntroduction);
		formData.append('file', $('#posterImgFile')[0].files[0]);
		
		//ajax
		$.ajax({
			type: 'post',
			url: '/admin/movie/create',
			data: formData,
			enctype: 'multipart/form-data',	// 파일 업로드 필수 설정
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,  // 파일 업로드 필수 설정 -----여기까지가 request를 위한 설정
			success: function(data) {
				if (data.result == 'success') {
					alert("영화 등록이 완료되었습니다");
					location.href="/admin/movie/movie_list_view";
				}
			},
			error: function(e) {
				alert("영화 등록에 실패했습니다." + e);
			}
		});
		
		
	});
	
	
});



</script>