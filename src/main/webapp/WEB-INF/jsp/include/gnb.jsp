<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="d-flex align-itmes-center">
	<%-- 로고 좌측 --%>
	<div class="col-4">
		<div class="h-50 d-flex justify-content-start">
			<c:if test="${not empty userId}">
				<span class="font-weight-bold mt-4 ml-4">${userName}님 안녕하세요</span>
			</c:if>
		</div>
		
		<div class="h-50 d-flex align-items-end justify-content-around">
			<a href="#" class="site-map-btn" data-toggle="modal" data-target="#moreModal"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png" width="30" height="30"></a>
			<a href="#" class="gnb-txt-movie"><img alt="gnb movie" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-movie.png"></a>
			<a href="#" class="gnb-txt-reservation"><img alt="gnb reservation" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-reserve.png"></a>
		</div>
	</div>

	<%-- 로고 --%>
	<div class="col-4 d-flex align-items-center justify-content-center">
		<img src="https://w.namu.la/s/1fcec37b924dd133f451ac4d3fa4563469da23ca9732d78a9d47e2944060da9feb6f1a8f76837f259f6a822db6976ce89eb266548c3de58fe221923cbc54abd7634444414316e26ca191a3a356d97490" width="300" onclick = "location.href = '/main/megabox' ">

	</div>
	<%-- 로고 우측 --%>
	<div class="col-4">
		<c:if test="${not empty userId}">
			<div class="h-50 d-flex justify-content-end">
				<a href="/user/sign_out" class="font-weight-bold ml-3 mt-4" style="color: black">로그아웃</a>
				<a href="#" class="font-weight-bold ml-3 mt-4" style="color: black">예매하기</a>
			</div>
		</c:if>
		<c:if test="${empty userId}">
			<div class="h-50 d-flex justify-content-end">
				<a href="/user/sign_in_view" class="font-weight-bold ml-3 mt-4" style="color: black">로그인</a>
				<a href="/user/sign_up_view" class="font-weight-bold ml-3 mt-4" style="color: black">회원가입</a>
				<a href="#" class="font-weight-bold ml-3 mt-4" style="color: black">예매하기</a>
			</div>
		</c:if>
		<div class="h-50 d-flex align-items-end justify-content-around">
			<a href="#" class="gnb-txt-event"><img alt="gnb event" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-event.png"></a>
			<a href="#" class="gnb-txt-store"><img alt="gnb store" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-store.png"></a>
			<a href="#"><img alt="user" src="https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_960_720.png" width="40" height="40"></a>
		</div>	
	</div>
	
</div>
<hr width="1200" noshade>

<!-- SITEMAP Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    	<div class="modal-body">
    		<h4 class="modal-title">SITE MAP</h4>
    		<table class="table mt-4 table-striped">
				<thead class="text-center">
					<tr class="bg-light">
						<th>영화</th>
						<th>예매</th>
						<th>이벤트</th>
						<th>스토어</th>
						<th>나의 메가박스</th>
						
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<td>전체영화</td>
						<td>상영시간표</td>
						<td>진행중 이벤트</td>
						<td>팝콘/음료/굿즈</td>
						<td>예매/구매내역</td>
					</tr>
					<tr>
						<td>무비포스트</td>
						<td>예매하기</td>
						<td>지난 이벤트</td>
						<td></td>
						<td>멤버십포인트</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>회원정보 수정</td>
					</tr>
					
    			</tbody>
    		</table>
    	
    	</div>
    	
    </div>
  </div>
</div>