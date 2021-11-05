<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container signIn">
		

	<div class="userLoginForm mt-5">
		<div class="d-flex justify-content-center m-5">
			<h3 class="font-weight-bold mt-4">로그인</h3>
		</div>
		
		<%-- 입력창&버튼 --%>
		<div class="d-flex justify-content-center align-items-center">
			<div class="col-4">
				<div class="d-flex justify-content-center align-items-center m-4">
					<input type="text" id="userLoginId" placeholder="아이디"  class="form-control">
				</div>
				<div class="d-flex justify-content-center align-items-center m-4">
					<input type="password" id="userPassword" placeholder="비밀번호" class="form-control">
				</div>
				<div class="d-flex justify-content-center align-items-center m-4">
					<button type="button" id="signInBtn" class="btn btn-block text-white" style="background-color: #380B61;">로그인</button>
				</div>
				<div class="d-flex justify-content-center align-items-center m-4">
					<button type="button" id="signUpBtn" class="btn btn-block bg-secondary text-white" onclick = "location.href = '/user/sign_up_view' ">회원가입</button>
				</div>
			</div>
		</div>
	</div>

</div>

<script>
	$(document).ready(function(){
		
		$('#signInBtn').on('click', function(e){
			let loginId = $('#userLoginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력해주세요");
				return false;
			}
			
			let password = $('#userPassword').val();
			if (password == '') {
				alert("비밀번호를 입력해주세요");
				return false;
			}	
				
			let formData = new FormData();
			formData.append('loginId', loginId);
			formData.append('password', password);
			
			//해당 아이디 없을 경우
			$.ajax({
				type: 'get',
				url: '/user/is_duplicated_id',
				data : {'loginId' : loginId},
				success : function(data) {
					if (!data.result) {
						//!data.result => 중복아니다(없는 아이디)
						alert("존재하지 않는 아이디입니다");
						location.reload(true);
					}
				},
				error : function(e) {
					alert("아이디 존재유무 확인에 실패 했습니다. 관리자에게 문의해주세요.")
				}
			});
			
			// 비밀번호가 일치 하지 않는 경우
			
			
			$.ajax({
				type: 'post',
				url: '/user/sign_in',
				data: formData,
				processData: false,	// 파일 업로드 필수 설정
				contentType: false,
				success: function(data) {
					if (data.result == 'success') {
						location.href = "/main/megabox";
					}
				},
				error: function(e) {
					alert("로그인에 실패했습니다. 관리자에게 문의해주세요" + e);
				}
			});
		});
	});


</script>