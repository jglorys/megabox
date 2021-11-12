<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="d-flex justify-content-center align-items-center mt-2 ml-5" style="height:600px;">
		<div class="m-3 d-flex justify-content-center flex-wrap ml-5"  style="height:350px;width:280px ;background-color: #E6E6E6;border-radius: 1em;">
			<img src="${store.productImg}" width="220px" height="200px">
			<div style="height:130px; width:220px">
				<span id="storeId" data-store-id="${store.id}" class="font-weight-bold">${store.product}</span><br>
				<span class="text-secondary mt-1">${store.composition}</span><br>
				<hr width="220px">
				<h4 id="pay" data-origin-pay="${store.price}" style="color: #380B61;">${store.price}원</h4>
			</div>
		</div>
		
		<div class="d-flex justify-content-start align-items-center ml-5">
			<div class="w-100 ml-5">
				<h5 id="userPoints" data-user-point="${user.point}">${user.name}님의 가용 포인트 : ${user.point}P</h5>
				<input type="number" id="usedPoints" class="form-control mt-4 ml-2" style="border-radius: 1em; height: 50px ;width: 260px; font-size:18px">
				<%-- 금액 표시 --%>
				<div class="d-flex justify-content-center align-items-center m-3">
					 <textarea class="font-weight-bold" id="chargeAccount" style="width:400px; font-size:25px;border-radius: 1em; height: 200px; border:0 solid black; resize: none;" disabled></textarea>
				</div>
				<button type="button" id="cancelBtn" class="btn bg-secondary text-white mr-3" onclick = "location.href = '/store/store_list_view' " style="border-radius: 1em;height: 50px ;width: 120px;font-size:14pt">취소</button>
				<button type="button" id="purchaseBtn" class="btn text-white" style="background-color: #380B61; border-radius: 1em;height: 50px ;width: 120px;font-size:14pt">결제</button>
			</div>
		</div>
</div>

<script>
$(document).ready(function(){
	var originChargeMoney = $('#pay').data('origin-pay'); //상품금액
	var userPoints = $('#userPoints').data('user-point');
	var realChargeMoney = originChargeMoney; //실 결제 금액
	var usedPoints = 0; //포인트 사용 금액
	$('#chargeAccount').val('총 결제금액 : ' + realChargeMoney);
	
	$('#usedPoints').on('change', function(){
		usedPoints = parseInt($(this).val());
		if (usedPoints < 0) {
			$(this).val(0);
			return;
		}
		
		if (usedPoints > userPoints) {
			alert('사용 가능한 포인트를 초과하였습니다');
			$(this).val(0);
			$('#chargeAccount').val('총 결제금액 : ' + originChargeMoney);
			return;
		}
		realChargeMoney = originChargeMoney - usedPoints;
		$('#chargeAccount').val('총 결제금액 : ' + realChargeMoney);
	});
	
	$('#purchaseBtn').on('click', function(){	
		
		let storeId = $('#storeId').data('store-id');
		let payment = realChargeMoney;
		let usedPoint = usedPoints;
		
		let formData = new FormData();
		formData.append('storeId', storeId); 
		formData.append('payment', payment);
		formData.append('usedPoint', usedPoint);
		
		$.ajax({
			type: 'post',
			url: '/purchase/insert',
			data: formData,
			processData: false,	// 파일 업로드 필수 설정
			contentType: false,
			success: function(data) {
				if (data.result == 'success') {
					alert("결제가 완료되었습니다");
					location.href = "/user/purchase_list_view";
				}
			},
			error: function(e) {
				alert("결제에 실패했습니다. 관리자에게 문의해주세요" + e);
			}
		});
		
	});
	
	
	
	
});
</script>