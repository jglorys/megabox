<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container signUp col-8 mt-5">
	<div class="m-5 p-4">
		<h3 class="font-weight-bold d-flex justify-content-center">회원가입</h3>
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-3" style="text-align: right;">이메일</h5>
		<input type="text" id="userEmail" placeholder="이메일을 입력해주세요"  class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center ml-5">
		<h5 class="font-weight-bold col-3 ml-5" style="text-align: right;">아이디</h5>
		<input type="text" id="userLoginId" placeholder="아이디를 입력해주세요"  class="col-6 form-control">
		
		<button type="button"class="btn text-white bg-secondary ml-4" id="loginIdCheckBtn" style=" border-radius: 1em;">중복확인</button>
	</div>
	<div class="d-flex justify-content-center align-items-center ml-5">
		<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
		<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>				
		<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
	</div>
	
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-3" style="text-align: right;">이름</h5>
		<input type="text" id="userName" placeholder="이름을 입력해주세요"  class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-3" style="text-align: right;">생년월일</h5>
		<input type="text" id="userBirth" placeholder="생년월일을 입력해주세요 (예 19901212)"  class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-3" style="text-align: right;">휴대전화 번호</h5>
		<input type="text" id="userPhoneNumber" placeholder="휴대전화 번호를 입력해주세요"  class="col-6 form-control">
	</div>
	
	<div class="d-flex justify-content-center align-items-center m-4">
	<h5 class="font-weight-bold col-3" style="text-align: right;">비밀번호</h5>
		<input type="password" id="userPassword" placeholder="비밀번호를 입력해주세요" class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
	<h5 class="font-weight-bold col-3" style="text-align: right;">비밀번호 확인</h5>
		<input type="password" id="confirmUserPassword" placeholder="비밀번호를 입력해주세요" class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center p-4 m-5">
		<button type="button" id="signUpBtn" class="btn text-white btn-block" style="background-color: #380B61; height:50px;border-radius: 1em;">회원가입</button>
	</div>
	
</div>

<script>
	$(document).ready(function(){
		//아이디 중복 확인
		$('#loginIdCheckBtn').on('click', function(e){
			let loginId = $('#userLoginId').val().trim();
			
			//alert(loginId);
			
			//idCheckLength, idCheckDuplicated, idCheckOk
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none');
				$('#idCheckDuplicated').addClass('d-none');
				$('#idCheckOk').addClass('d-none');
				return;
			}
			//ajax 서버 호출(중복여부)
			$.ajax({
				type : 'get',
				url : '/user/is_duplicated_id',
				data : {'loginId' : loginId},
				success : function(data) {
					if (data.result) {
						//중복이다
						$('#idCheckLength').addClass('d-none');
						$('#idCheckDuplicated').removeClass('d-none');
						$('#idCheckOk').addClass('d-none');
					} else {
						//중복이 아니다 => idCheckOk 에서 d-none제거
						$('#idCheckLength').addClass('d-none');
						$('#idCheckDuplicated').addClass('d-none');
						$('#idCheckOk').removeClass('d-none');
					}
				},
				error : function(e) {
					alert("아이디 중복 확인에 실패 했습니다. 관리자에게 문의해주세요.")
				}
			});
		});
		
		$('#signUpBtn').on('click', function(){
			
			// validation check
			//이메일 입력 안했을때
			let email=$('#userEmail').val().trim();
			if (email == '') {
				alert("이메일을 입력하세요");
				return;
			}
			// 아이디 입력 안 했을때
			let loginId=$('#userLoginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력하세요");
				return;
			}
			//이름 입력 안했을때
			let name = $('#userName').val().trim();
			if (name == '') {
				alert("이름을 입력하세요");
				return;
			}
			//생년월일 입력 안했을때
			let birth = $('#userBirth').val().trim();
			if (birth == '' ) {
				alert("생년월일을 입력하세요");
				return;
			}
			//휴대전화 번호 입력 안했을때
			let phoneNumber = $('#userPhoneNumber').val().trim();
			if (phoneNumber == '' ) {
				alert("휴대전화 번호를 입력하세요");
				return;
			}
			// 비밀번호 입력 안했을때
			let password=$('#userPassword').val();
			let confirmPassword=$('#confirmUserPassword').val();
			if (password == '' || confirmPassword =='') {
				alert("비밀번호를 입력하세요");
				return;
			}
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				// 일치하지 않을 때 공백으로 만들어줌
				$('#userPassword').val(''); 
				$('#confirmUserPassword').val(''); 
				return;
			}
			//중복체크 안했을때
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 해주세요");
				return;	
			}
			
			//ajax
			let formData = new FormData();
			formData.append('loginId', loginId);
			formData.append('name', name);
			formData.append('yyyymmdd', birth);
			formData.append('phoneNumber', phoneNumber);
			formData.append('email', email);
			formData.append('password', password);
			
			$.ajax({
				type: 'post',
				url: '/user/sign_up',
				data: formData,
				processData: false,	// 파일 업로드 필수 설정
				contentType: false,
				success: function(data) {
					if (data.result == 'success') {
						alert("회원가입이 완료되었습니다!");
						location.href ='/main/megabox'; // 메인화면으로 이동
					}
				},
				error: function(e) {
					alert("회원가입에 실패했습니다. 관리자에게 문의해주세요." + e);
				}
			});
			
			
		});
		
		
	});
</script>