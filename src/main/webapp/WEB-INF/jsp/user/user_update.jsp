<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 나의 메가박스>>>예매내역 & 멤버십포인트 & 회원정보수정@@ --%>
<div class="mt-4 p-3">
	<div class="d-flex justify-content-around align-items-center">
		<a href="/user/reservation_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">예매내역</a>		
		<a href="/user/purchase_list_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">구매내역</a>
		<a href="/user/point_view" class="font-weight-bold mt-4 p-3" style="color: black; text-decoration:none">멤버십포인트</a>		
		<a href="/user/user_update_view" class="font-weight-bold mt-4 p-3" style="background-color:#BDBDBD; border-radius: 2em; color: black; text-decoration:none">회원정보 수정</a>			
	</div>
	<hr width="900" noshade>
</div>

<div class="container col-8 mt-5">
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-4" style="text-align: right;">이메일</h5>
		<input type="text" id="userEmail" placeholder="이메일을 입력해주세요"  class="col-6 form-control">
	</div>
		<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-4" style="text-align: right;">휴대전화 번호</h5>
		<input type="text" id="userPhoneNumber" placeholder="휴대전화 번호를 입력해주세요"  class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-4" style="text-align: right;">기존 비밀번호</h5>
		<input type="password" id="userPassword" placeholder="기존 비밀번호를 입력해주세요" class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
		<h5 class="font-weight-bold col-4" style="text-align: right;">새 비밀번호</h5>
		<input type="password" id="newPassword" placeholder="새 비밀번호를 입력해주세요" class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center m-4">
	<h5 class="font-weight-bold col-4" style="text-align: right;">새 비밀번호 확인</h5>
		<input type="password" id="confirmNewPassword" placeholder="새 비밀번호를 입력해주세요" class="col-6 form-control">
	</div>
	<div class="d-flex justify-content-center align-items-center p-4 m-5">
		<button type="button" id="updateUserBtn" class="btn text-white btn-block" style="background-color: #380B61; border-radius: 1em; height:50px;">정보 수정</button>
	</div>
</div>


<script>
$(document).ready(function(){
	//회원 정보 업데이트 버튼 클릭
	$('#updateUserBtn').on('click', function(e){
		let userEmail = $('#userEmail').val().trim();
		let userPhoneNumber = $('#userPhoneNumber').val().trim();
		let userPassword = $('#userPassword').val();
		let newPassword = $('#newPassword').val();
		let confirmNewPassword = $('#confirmNewPassword').val();
		
		// validation check
		//이메일 입력 안했을때
		if (userEmail == '') {
			alert("이메일을 입력하세요");
			return;
		}
		//휴대전화 번호 입력 안했을때
		if (userPhoneNumber == '' ) {
			alert("휴대전화 번호를 입력하세요");
			return;
		}
		// 비밀번호 입력 안했을때
		if (userPassword == '' || newPassword == '' || confirmNewPassword =='') {
			alert("비밀번호를 입력하세요");
			return;
		}
		if (newPassword != confirmNewPassword) {
			alert("새 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			// 일치하지 않을 때 공백으로 만들어줌
			$('#newPassword').val(''); 
			$('#confirmNewPassword').val(''); 
			return;
		}
		
		//ajax
		let formData = new FormData();
		formData.append('userEmail', userEmail);
		formData.append('userPhoneNumber', userPhoneNumber);
		formData.append('userPassword', userPassword);
		formData.append('newPassword', newPassword);
		
		$.ajax({
			type: 'post',
			url: '/user/update',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("정보수정이 완료되었습니다");
					location.href ='/main/megabox'; // 메인화면으로 이동
				} else if (data.result == 'notCorrectPW') {
					// 기존의 패스워드가 일치하지 않을 경우
					alert("기존의 비밀번호가 일치하지 않습니다.");
				}
			},
			error: function(e) {
				alert("정보수정에 실패했습니다. 관리자에게 문의해주세요." + e);
			}
		});
	

	});
});

</script>