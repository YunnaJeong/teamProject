<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = function() {
		history.pushState(null, null, 'inquiry.do');
	}
</script>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		<h1 class="mt-4">문의</h1>
		<form method="post" action="inquiryAllDelete.do">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 문의 글 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>문의 번호</th>
							<th>문의 제목</th>
							<th>문의 내용</th>
							<th>문의 일자</th>
							<th>답변 상태</th>
							<th>문의 작성자</th>
							<th>del</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>문의 번호</th>
							<th>문의 제목</th>
							<th>문의 내용</th>
							<th>문의 일자</th>
							<th>답변 상태</th>
							<th>문의 작성자</th>
							<th>del</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="i" items="${list }">
						<tr>
							<td><a style="color:black;" href="inquiryDetail.do?i_id=${i.i_id }">${i.i_id }</a></td>
							<td>${i.i_title }</td>
							<td>${i.i_content }</td>
							<td>${i.i_inquiryDate }</td>
							<td>${i.i_state }</td>
							<td>${i.u_id }</td>
							<td><input type="checkbox" name="del_id" value=${i.i_id }></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
			<div>
			<input type="submit" value="삭제" style="float: right;">		
		</div>
		</form>
	</div>
</body>
</html>