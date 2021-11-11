<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div>
	<div class="d-flex justify-content-start">
		<button type="button" class="btn btn-secondary mb-4" onclick="location.href='/admin/schedule/schedule_list_view'" style="border-radius: 1em;height: 40px ;width: 110px;">등록취소</button>
	</div>
	<div class="d-flex justify-content-center">
		<table class="table table-striped w-75 ml-5 mt-2">
				<tbody class="text-center">
					<tr>
						<th>영화 선택</th>
						<td>
							<select class="form-control" id="scheduleMovie">
							  <option value="none" disabled selected>=== 선택 ===</option>
							  <c:forEach items="${movieList}" var="movie">
							  	<option value="${movie.id}">${movie.title} - ${movie.director}</option>
							  </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>상영관 선택</th>
						<td>
							<select class="form-control" id="scheduleAuditorium">
							  <option value="none" disabled selected>=== 선택 ===</option>
							  <c:forEach items="${auditoriumList}" var="auditorium">
							  	<option value="${auditorium.id}">${auditorium.name}관</option>
							  </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>상영 날짜 & 시간 (시간은 24시간 형식)</th>
						<td>
							<input type="text" id="scheduleTime" class="form-control" placeholder="2022/11/22 13:44 => 202211221344">
						</td>
					</tr>
				</tbody>
		</table>
	</div>
	<div class="d-flex justify-content-center mt-5">
		<button type="button" id="scheduleUploadBtn" class="btn text-white" style="background-color: #380B61; border-radius: 1em;height: 50px ;width: 150px;">상영시간표 등록</button>
	</div>
</div>		


<script>
$(document).ready(function(){
	
	//scheduleUploadBtn 클릭
	$('#scheduleUploadBtn').on('click', function(){
		//validation check
		let movieId = $('#scheduleMovie').val(); 
		let auditorium = $('#scheduleAuditorium').val();
		let time = $('#scheduleTime').val().trim();
		
		if (movieId == null) {
			alert('영화를 선택해주세요');
			return;
		} 
		if (auditorium == 'none'){
			alert('상영관을 선택해주세요');
			return;
		}
		if (time == '' || time.length != 12) {
			alert('상영날짜와 시간을 입력해주세요');
			return;
		}
		alert(time.substring(0,4) + '년' + time.substring(4,6) + '월' + time.substring(6,8) + '일' + time.substring(8,10) + '시' + time.substring(10,12) + '분으로 등록합니다.' );
		
		//alert(movieId);
		let auditoriumId = $('#scheduleAuditorium').val();
		
		let formData = new FormData();
		formData.append('movieId', movieId);
		formData.append('auditoriumId', auditoriumId);
		formData.append('time', time);
		
		$.ajax({
			type: 'post',
			url: '/admin/schedule/create',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("상영시간표 등록이 완료되었습니다");
					location.href="/admin/schedule/schedule_list_view";
				}
			},
			error: function(e) {
				alert("영화 등록에 실패했습니다." + e);
			}
		});
	});
	
});




</script>