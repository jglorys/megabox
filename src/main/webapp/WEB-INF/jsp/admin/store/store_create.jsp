<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="col-6">
		<button type="button" class="btn btn-secondary mb-4" onclick="location.href='/admin/store/store_list_view'" style="border-radius: 1em;height: 40px ;width: 110px;">등록취소</button>
		<table class="table table-striped w-100 ml-5 mt-2">
			<tbody class="text-center">
				<tr>
					<th class="bg-light">상품명</th>
					<td>
						<input type="text" id="productName" class="form-control" placeholder="상품명을 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">구성</th>
					<td>
						<textarea id="productComposition" rows="4" cols="10" class="form-control" placeholder="상품 구성을 입력해주세요"></textarea>
					</td>
				</tr>
				<tr>
					<th class="bg-light">판매가격</th>
					<td>
						<input type="number" id="productPrice" class="form-control" placeholder="판매가격을 입력해주세요">
					</td>
				</tr>
				<tr>
					<th class="bg-light">판매가능 수량</th>
					<td>
						<select id="productAmount" class="form-control">
							<option value="none" disabled selected>=== 선택 ===</option>
							<option value="100">100개</option>
							<option value="200">200개</option>
							<option value="300">300개</option>
							<option value="400">400개</option>
							<option value="500">500개</option>
							<option value="1000">1000개</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>	
	</div>
	
	<div class="col-6">
		<br><br>
		<%-- 상품사진 업로드 div --%>
		<div class="d-flex justify-content-around mt-5">
			<input type="file" id="productImgFile" accept=".jpg, .jpeg, .png, .gif" class="btn btn-primary">
			<!-- <label class="btn btn-primary btn-file">포스터 업로드<input type="file"  accept=".jpg, .jpeg, .png, .gif"></label> -->
		</div>
		<br><br><br>
		<br>
		<div class="d-flex justify-content-center">
			<button type="button" id="storeUploadBtn" class="btn text-white" style="background-color: #380B61;border-radius: 1em;height: 45px ;width: 150px;">상품 등록</button>
		</div>
	</div>

</div>


<script>
$(document).ready(function(){
	
	$('#productPrice').on('change', function(){
		let productPrice = parseInt($(this).val());
		if (productPrice < 0) {
			$(this).val(0);
			return;
		}
	});
	
	$('#storeUploadBtn').on('click', function(){
		//validation check
		let productName = $('#productName').val().trim();
		if (productName == '') {
			alert('상품명을 입력해주세요.');
			return;
		}
		let productComposition = $('#productComposition').val().trim();
		if (productComposition == '') {
			alert('상품구성을 입력해주세요.');
			return;
		}
		let productPrice = $('#productPrice').val().trim();
		if (productPrice == '') {
			alert('상품가격을 입력해주세요.');
			return;
		}
		let productAmount = $('#productAmount').val().trim();
		if (productAmount == null) {
			alert('판매가능수량을 선택해주세요.');
			return;
		}
		// 상품 이미지 확장자 검사
		let file = $('#productImgFile').val(); //파일의 이름을 가지고옴
		if (file == '') {
			alert('상품이미지를 업로드해주세요.');
			return;
		}
		if (file != '') { //파일이 있을때 확장자 검사
			//console.log("파일명자름" + file.split('.'));
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { //없으면 -1이 나오고 그걸 찾아내야됨
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#productImgFile').val(''); //잘못된 파일을 지운다
				return;
			}
		}
		
		let formData = new FormData();
		formData.append('productName', productName);
		formData.append('productComposition', productComposition);
		formData.append('productPrice', productPrice);
		formData.append('productAmount', productAmount);
		formData.append('file', $('#productImgFile')[0].files[0]);
		//ajax
		$.ajax({
			type: 'post',
			url: '/admin/store/create',
			data: formData,
			enctype: 'multipart/form-data',	// 파일 업로드 필수 설정
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,  // 파일 업로드 필수 설정 -----여기까지가 request를 위한 설정
			success: function(data) {
				if (data.result == 'success') {
					alert("상품 등록이 완료되었습니다");
					location.href="/admin/store/store_list_view";
				}
			},
			error: function(e) {
				alert("상품 등록에 실패했습니다." + e);
			}
		});
	});
	
});

</script>