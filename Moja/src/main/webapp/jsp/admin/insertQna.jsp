<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>자주 묻는 질문</title>
</head>
<body>
	<div id="layoutSidenav_content">

			<form method="post" action="qnaInsertOK.do">
				<div style="width: 80%; height: auto; margin: auto;">
					<h2>QNA 등록</h2>
					<div class="card" style="border:0;">
						<div class="card-body">
							<h5 class="card-title" style="font:30px solid;">제목</h5>
							<input type="text" placeholder="제목을 입력해주세요" name="q_title"
								style="width: 100%; height: 50px; font-size: 30px;">
							<hr style="border:1px solid BLACK">
							<p style="height: 100%;" class="card-text">내용</p>
							<textarea rows="20" style="width: 100%;" placeholder="내용을 입력해주세요" name="q_answer"></textarea>
						</div>
					</div>
					<input type="submit" value="등록" class="btn btn-primary btn-lg"
						style="float: right;">
				</div>
			</form>
		</div>
</body>
</html>