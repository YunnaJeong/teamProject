<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = function() {
		history.pushState(null, null, 'qna.do');
	}
</script>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		<h1 class="mt-4">자주 묻는 질문</h1>
		<form method="post" action="qnaAllDelete.do">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 자주 묻는 질문 목록
			</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>질문 번호</th>
								<th>질문 제목</th>
								<th>질문 답변</th>
								<th>del</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>질문 번호</th>
								<th>질문 제목</th>
								<th>질문 답변</th>
								<th>del</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="q" items="${list }">
								<tr>
									<td><a style="color:black;" href="qnaDetail.do?q_id=${q.q_id }">${q.q_id }</a></td>
									<td>${q.q_title }</td>
									<td>${q.q_answer }</td>
									<td><input type="checkbox" name="del_id" value="${q.q_id }"></td>
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