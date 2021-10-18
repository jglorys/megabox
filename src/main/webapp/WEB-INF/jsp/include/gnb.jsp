<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="d-flex align-itmes-center">
	<%-- 로고 좌측 --%>
	<div class="col-4">
		<div class="h-50 d-flex justify-content-start">
			<span class="font-weight-bold mt-4 ml-4">이서영님 안녕하세요</span>
		</div>
		<div class="h-50 d-flex align-items-end justify-content-around">
			<a href="#" class="site-map-btn" data-toggle="modal" data-target="#moreModal"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png" width="30" height="30"></a>
			<a href="#" class="gnb-txt-movie"><img alt="gnb movie" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-movie.png"></a>
			<a href="#" class="gnb-txt-reservation"><img alt="gnb reservation" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-reserve.png"></a>
		</div>
	</div>

	<%-- 로고 --%>
	<div class="col-4 d-flex align-items-center justify-content-center">
		<img src="https://w.namu.la/s/1fcec37b924dd133f451ac4d3fa4563469da23ca9732d78a9d47e2944060da9feb6f1a8f76837f259f6a822db6976ce89eb266548c3de58fe221923cbc54abd7634444414316e26ca191a3a356d97490" width="300">

	</div>
	<%-- 로고 우측 --%>
	<div class="col-4">
		<div class="h-50 d-flex justify-content-end">
			<a href="#" class="font-weight-bold ml-3 mt-4" style="color: black">로그아웃</a>
			<a href="#" class="font-weight-bold ml-3 mt-4" style="color: black">예매하기</a>
		</div>
		<div class="h-50 d-flex align-items-end justify-content-around">
			<a href="#" class="gnb-txt-event"><img alt="gnb event" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-event.png"></a>
			<a href="#" class="gnb-txt-store"><img alt="gnb store" src="https://img.megabox.co.kr/static/pc/images/common/gnb/gnb-txt-store.png"></a>
			<a href="#"><img alt="user" src="https://cdn.pixabay.com/photo/2017/02/25/22/04/user-icon-2098873_960_720.png" width="40" height="40"></a>
		</div>	
	</div>
	
</div>

<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="modal-header">
    		<h4 class="modal-title">SITE MAP</h4>
    	</div>
    	<div class="modal-body"></div>
    	<div class="modal-footer"></div>
    </div>
  </div>
</div>