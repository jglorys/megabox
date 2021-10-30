<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Megabox Admin</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- AJAX를 사용하기 위해 slim 아닌 풀버전의 jquery로 교체 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <link rel="stylesheet" type="text/css" href="/static/css/style.css">
 
</head>
<body style="background-color: #E6E6E6;">
	<div class="container adminSignIn">
		<header>
			<div class="d-flex align-items-center justify-content-center">
				<img src="https://w.namu.la/s/1fcec37b924dd133f451ac4d3fa4563469da23ca9732d78a9d47e2944060da9feb6f1a8f76837f259f6a822db6976ce89eb266548c3de58fe221923cbc54abd7634444414316e26ca191a3a356d97490" width="300">
			</div>
		</header>
		
		<section class="contents">
			<div class="adminLoginForm mt-5">
				<%-- administrator --%>
				<div class="d-flex justify-content-center align-items-center">
					<h3>Administrator</h3>
				</div>
							  
				<%-- 입력창&버튼 --%>
				<div class="d-flex justify-content-center align-items-center">
					<div class="col-4">
						<div class="d-flex justify-content-center align-items-center m-4">
							<input type="text" id="adminLoginId" placeholder="아이디"  class="form-control">
						</div>
						<div class="d-flex justify-content-center align-items-center m-4">
							<input type="password" id="adminPassword" placeholder="비밀번호" class="form-control">
						</div>
						<div class="d-flex justify-content-center align-items-center m-4">
							<button type="button" id="signInBtn" class="btn btn-secondary btn-block">로그인</button>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<script>
		$(document).ready(function(){
			
			$('#signInBtn').on('click', function(e){
				let loginId = $('#adminLoginId').val().trim();
				if (loginId == '') {
					alert("관리자 아이디를 입력해주세요");
					return false;
				}
				
				let password = $('#adminPassword').val();
				if (password == '') {
					alert("관리자 비밀번호를 입력해주세요");
					return false;
				}
				
				let formData = new FormData();
				formData.append('loginId', loginId);
				formData.append('password', password);
				
				$.ajax({
					type: 'post',
					url: '/admin/administrator/sign_in',
					data: formData,
					processData: false,	// 파일 업로드 필수 설정
					contentType: false,
					success: function(data) {
						if (data.result == 'success') {
							alert("관리자 로그인 완료");
							location.href = "/admin/movie/movie_list_view";
						} 
					},
					error:function(e) {
							alert("관리자 로그인에 실패했습니다" + e);
						}
				});
			});
		});
	
	
	</script>
</body>
</html>



