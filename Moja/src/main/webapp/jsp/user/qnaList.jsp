<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>qna Page</title>
<style>
        #qnaList {

    margin-left: 300px; /* 사이드바 너비 + 20px 만큼 콘텐츠를 오른쪽으로 이동 */
    width: calc(100% - 220px); /* 전체 너비에서 사이드바 너비를 뺀 만큼 설정 */
    margin-top: 80px; /* 필요에 따라 상단 여백 조정 */
}
#qna{
width:1200px;
margin : 30px auto;
}
#qnaList h1 {
    margin-bottom: 20px;
    border-bottom: 2px solid #000; /* black solid line */
    display: line-block; /* to ensure the border is only as long as the text */
    padding-bottom: 10px; /* to provide some spacing between the text and the line */
    font-size: 40px;
    text-align: center;
}
#qnaList table {
    width: 100%;
    border-collapse: collapse;
}
#qnaList th, #qnaList td {
    border: 1px solid #ddd;
    padding: 20px;
    text-align: left;
    font-size: 22px;
}
#qnaList th {
    background-color: #f2f2f2;
    font-size: 22px;
}
/* Basic reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

 /*사이드바 위치 조절 및 크기조절*/
   .sideBar{
        width: 200px; /* 사이드바의 너비 설정 */
    height: 1100px; 
    position: absolute; /* 절대 위치 변경 */
    top: 120px; /* 헤더의 높이만큼 아래로 설정 */
    left: 60px; /*20px 떨어진 위치에 설정 */
    background: #DDDDDD;
    border-radius: 10px;
    padding: 20px;
    box-sizing: border-box;
    overflow-y: auto; 
         }



         /*사이드바메뉴간 거리조절*/
         .sideBar  li{
            font-size: 22px;
    padding: 10px 10px; /* 위아래 패딩을 10px로, 좌우 패딩도 10px로 줄임 */
    white-space: nowrap; /* 텍스트가 한 줄로 나오도록 설정 */
         }

         /*사이드바메뉴 호버효과*/
         .s_menu:hover{
            font-size: 25px;
            color: #14152c;

         }
	.sideBar > ul {
    padding: 20px 0 ; /* 상단 패딩을 조금 줄임 */
}

</style>
</head>
<body>
<!-- Assuming header and footer are included via separate JSP includes -->


<div id="qnaList">
	<h1>고객센터</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>

            </tr>
        </thead>
        <tbody>
           
            <c:forEach var="b" items="${qna1}">
            <tr>
                <td>${b.q_id}</td>
                 <td><a href="qnaDetail.do?q_id=${b.q_id}">${b.q_title}</a></td>
                
            </tr>
            </c:forEach>
           
        </tbody>
    </table>
</div>
<nav id="sideBar" class="sideBar">
    <ul>
        <li class="s_menu"><a href="qnaList.do">자주묻는 질문</a></li>
        <li class="s_menu"><a href="inquiryList.do">1:1 문의</a></li>
        <li class="s_menu"><a href="inquiryWrite.do">문의 작성하기</a></li>

    </ul>
</nav>

</body>
</html>