<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL Core태그 --%>

<div class="p-5">
	<div class="d-flex justify-content-between">
		<h4 class="font-weight-bold">영화</h4>
		<button type="button" onclick="location.href='/admin/movie/movie_create_view' "class="btn text-white" style="background-color: #380B61;border-radius: 1em;height: 45px ;width: 150px;">영화 등록</button>
	</div>
	
	<table class="table mt-4 table-hover table-striped">
		<thead class="text-center">
			<tr class="bg-light">
				<th>순위</th>
				<th>제목</th>
				<th>감독</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<c:forEach items="${movieList}" var="movie">
			<tr>
				<td>${movie.ranking}</td>
				<td>${movie.title}</td>
				<td>${movie.director}</td>
				<td>
					<a href="/admin/movie/movie_update_view?movieId=${movie.id}" ><button type="button" class="btn btn-secondary"  style="border-radius: 1em; height: 40px ;width: 100px;">수정</button></a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>

</div>

