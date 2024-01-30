<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Inquiry Submission Page</title>
<style>
/* 페이지 기본 스타일링 */
body {
    font-family: Arial, sans-serif;
}

/* 입력란 컨테이너 스타일링 */
.inquiry-form-container {
    width: 1000px;
    margin: 20px auto;
    
}

/* 입력란 레이블 스타일링 */
.inquiry-form-container label {
    display: block;
    margin-bottom: 10px;
    font-size: 20px;
    color: #333;
}

/* 텍스트 입력란 스타일링 */
.inquiry-form-container input[type="text"],
.inquiry-form-container textarea {
    width: 100%; /* 100% width for responsiveness */
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 20px;
    background: #f9f9f9;
}

.inquiry-form-container textarea {
    height: 200px; /* Set the height for the textarea */
    text-align: left;
    vertical-align: top; /* Ensure the text starts from the top */
    resize: vertical; /* Allow only vertical resizing */
}

/* 버튼 컨테이너 스타일링 */
.button-container {
    text-align: center;
    margin-top: 20px;
}

/* 버튼 스타일링 */
.button-container button {
    padding: 10px 20px;
    font-size: 20px;
    border-radius: 4px;
    border: none;
    margin-right: 10px;
    cursor: pointer;
}

/* 등록 버튼 스타일링 */
.submit-button {
    background-color: orange;
    color: white;
}

/* 등록 버튼 호버 효과 */
.submit-button:hover {
    background-color: darkorange;
}

/* 취소 버튼 스타일링 */
.cancel-button {
    background-color: #ddd;
    color: #333;
}

/* 취소 버튼 호버 효과 */
.cancel-button:hover {
    background-color: #ccc;
}
</style>
</head>
<body>
<!-- 헤더와 푸터 포함되어 있다고 가정 -->
<form action="inquiryWriteOK.do">
<!-- 제목 입력란 -->
<div class="inquiry-form-container">
    <label for="inquiry-title">제목을 입력하세요</label>
    <input type="text" id="inquiry-title" name="inquiryTitle" placeholder="제목" required>
</div>

<!-- 내용 입력란 -->
<div class="inquiry-form-container">
    <label for="inquiry-content">문의를 작성하세요.</label>
    <textarea id="inquiry-content" name="inquiryContent" placeholder="내용" required></textarea>
</div>

<!-- 버튼 그룹 -->
<div class="button-container">
    <button type="submit" class="submit-button">문의 등록하기</button>
    <button type="button" class="cancel-button"><a href="inquiryList.do">취소</a></button>
    
     
</div>
</form>
<script>
// 여기에 필요한 자바스크립트를 추가하세요.
</script>

</body>
</html>
