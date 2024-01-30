<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>FAQ & qna Collection Page</title>
<style>

.container {
    /* ... */
    text-align: center;
    padding-bottom: 20px;
}
.header-title {
    font-size: 30px; /* 제목 폰트 크기 */
    text-align: center;
    margin-top: 20px;
    border-bottom: 3px solid #000; /* 밑줄 */
    display: line-block; 
    padding-bottom: 5px; /* 밑줄과 텍스트 사이 여백 */
}
.icon-group {
    display: flex;
    justify-content: center; /* 아이콘을 중앙에 배치 */
    margin: 20px 0;
    font-size: 30px;
}
.icon-with-title {
    margin: 0 10px; /* 아이콘 간격 줄임 */
    /* 나머지 스타일... */
}
/* 나머지 스타일... */
</style>
</head>
<body>


<div class="container">
    <div class="header-title">고객센터</div>
    <div class="icon-group">
        <div class="icon-with-title">
            <!-- 이미지를 앵커 태그로 감싸기 -->
            <a href="qnaList.do">
                <img src="../../image/qna.png" alt="qna">
            </a>
            <div class="title">자주 묻는 질문</div>
        </div>
        <div class="icon-with-title">
            <!-- 이미지를 앵커 태그로 감싸기 -->
            <a href="inquiryList.do">
                <img src="../../image/inquiry.png" alt="inquiry">
            </a>
            <div class="title">문의 모음</div>
        </div>
    </div>
</div>
</body>
</html>
