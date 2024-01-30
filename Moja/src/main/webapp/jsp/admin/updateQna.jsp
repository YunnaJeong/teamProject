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
</head>
<body>
	<div style="width: 80%; height: auto; margin: auto; padding: 20px;">
		<form method="post" action="qnaUpdateOK.do?q_id=${q.q_id }">
			<div style="width: 80%; height: auto; margin: auto;">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<input type="text" placeholder="제목을 입력해주세요" value="${q.q_title }"
							style="width: 100%; height: 50px; font-size: 30px;" name="q_title">
						<hr>
						<p style="height: 100%;" class="card-text">내용</p>
						<textarea rows="20" style="width: 100%;" placeholder="내용을 입력해주세요" value="${q.q_answer }" name="q_answer"></textarea>
					</div>
				</div>
				<input type="submit" value="수정" class="btn btn-primary btn-lg"
					style="float: right;">
			</div>
		</form>
	</div>
</body>
</html>