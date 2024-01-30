<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>문의 상세</title>
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
		history.pushState(null, null, 'qnaDetail.do?q_id='+q.q_id);
	}
</script>
</head>
<body>
	<div style="width: 80%; height: auto; margin: auto;padding:20px;">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">${q.q_title }</h4>
				<h6 class="card-subtitle mb-2 text-body-secondary">관리자
				</h6>
				<hr>
				<p style="height: 500px;" class="card-text">${q.q_answer }</p>
			</div>
		</div>
		<button style="float:left;" onclick="location.href='qna.do'">
			목록으로
		</button>
		<button value="수정" style="float:right;" onclick="location.href='qnaUpdate.do?q_id=${q.q_id}'">
			수정
		</button>
		<button value="삭제" style="float:right;" onclick="location.href='qnaDelete.do?q_id=${q.q_id}'">
			삭제
		</button>
	</div>
</body>
</html>