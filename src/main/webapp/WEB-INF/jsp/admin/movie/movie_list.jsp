<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">영화</h4>
		<button type="button" onclick="location.href='/admin/movie/movie_create_view' "class="btn text-white" style="background-color: #380B61;">영화 등록</button>
	</div>
	
	<table class="table mt-4 table-hover table-striped">
		<thead class="text-center">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>감독</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<tr>
				<td>1</td>
				<td>아버지의 길</td>
				<td>슬로단 고르보비치</td>
				<td>
					<button type="button" class="btn btn-secondary">수정</button>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>007 노 타임 투 다이</td>
				<td>캐리 후쿠나가</td>
				<td>
					<button type="button" class="btn btn-secondary">수정</button>
				</td>
			</tr>
		</tbody>
	
	</table>

</div>

