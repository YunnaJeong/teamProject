<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/studyPostWriteCSS.css">
<meta charset="utf-8">
<title>모두의 자격증</title>
</head>
<body>
	<br>
	<br>
	<div class="css-11g30v6">
		<%-- 글 제목 내용 부분 전체 --%>
		<form action="studyPostWriteOK.do" method="post">
			<%--작성된 내용 보낼곳 --%>
			<hr class="studyPostWriteTitleLine">
			<%--제목 입력하는곳 위 아래로 구분선 --%>
			<div
				class="mantine-InputWrapper-root mantine-Textarea-root mantine-1y7fzyr">
				<%--제목 입력 감싸고 있는 div --%>
				<div
					class="mantine-Input-wrapper mantine-Textarea-wrapper mantine-1v7s5f8">
					<textarea
						class="mantine-Input-input mantine-Textarea-input mantine-goibal"
						id="title" name="s_title" aria-label="title"
						placeholder="제목을 입력해주세요." aria-invalid="false"
						style="height: 39px;"></textarea>
					<%--제목 입력하는곳 --%>
				</div>
			</div>
			<%--제목 입력 감싸고 있는 div --%>
			<hr class="studyPostWriteTitleLine">
			<%--제목 입력하는곳 위 아래로 구분선 --%>

			<div class="css-140imd4">
				<%--스터디 주제로 할 자격증 적는 곳 --%>
				<ul class="css-5kov97">
					<input placeholder="자격증 입력" name="exam_name" class="css-1ryum8s">
				</ul>
			</div>
			<br>
			<div class="css-1utzp2z">
				<div class="editor-container">
					<div data-testid="editor-content-container"
						class="editor-content-container markdown-body">
						<textarea class="studyPostContent" placeholder="글 내용을 적어주세요." name="s_content"></textarea>
						<%-- 스터디 글 내용 적어놓을 곳 --%>
					</div>
				</div>
			</div>
			<br>
			<div class="css-os36di">
				<%-- 글 등록버튼이랑 취소버튼 묶음 --%>
				<button
					class="mantine-UnstyledButton-root mantine-Button-root mantine-1276sa2"
					type="submit" data-button="true">
					<div class="mantine-1yjkc96 mantine-Button-inner">
						<span class="mantine-1ryt1ht mantine-Button-label">등록</span>
					</div>
				</button>

				<button
					class="mantine-UnstyledButton-root mantine-Button-root mantine-1uni1zy"
					type="button" data-button="true" onclick="history.back()"><%--버튼 누르면 뒤로가기 --%>
					<div class="mantine-1yjkc96 mantine-Button-inner">
						<span class="mantine-1ryt1ht mantine-Button-label">취소</span>
					</div>
				</button>
			</div>
		</form>
	</div>
</body>
</html>