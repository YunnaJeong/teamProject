<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Inquiry Page</title>
<style>
        #inquiryList {
    margin-left: 300px; /* 사이드바 너비 + 20px 만큼 콘텐츠를 오른쪽으로 이동 */
    width: calc(100% - 220px); /* 전체 너비에서 사이드바 너비를 뺀 만큼 설정 */
    margin-top: 80px; /* 필요에 따라 상단 여백 조정 */
}
#inqury{
width:1200px;
margin : 30px auto;
}
#inquiryList h1 {
    margin-bottom: 20px;
    border-bottom: 2px solid #000; /* black solid line */
    display: line-block; /* to ensure the border is only as long as the text */
    padding-bottom: 10px; /* to provide some spacing between the text and the line */
    font-size: 40px;
    text-align: center;
}
#inquiryList table {
    width: 100%;
   
    border-collapse: collapse;
}
#inquiryList th, #inquiryList td {
    width: 25%;
    border: 1px solid #ddd;
    padding: 20px;
    text-align: left;
    font-size: 22px;
}
#inquiryList th {
    background-color: #f2f2f2;
    font-size: 22px;
}
/* Basic reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 페이지네이션 스타일 */
.pagination {
    display: flex;
    justify-content: center; /* 페이지 번호들을 중앙에 배치 */
    padding-left: 0;
    margin: 20px 0;
    list-style: none; /* 기본 목록 스타일 제거 */
}
.pagination a {
    color: orange;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 3px solid #ddd; /* Light grey border */
    margin: 0 4px; /* Space between page numbers */
}
.pagination a.active {
    background-color: orange;
    color: white;
    border: 3px solid orange;
}
.pagination a:hover:not(.active) {background-color: #ddd;}

/* 검색창 스타일 */
.search-container {
    display: flex;
    justify-content: center; /* This will center the search bar */
    margin-top: 20px;
}
.search-container input[type=text] {
    padding: 10px;
    margin-right: 10px;
    border: thin;
    border-bottom: 1px solid #ccc; /* underline style */
    width: 30%; /* Search bar width */
}
.search-container button {
    padding: 10px;
    background: orange;
    color: white;
    border: none;
    cursor: pointer;
}
.search-container button:hover {
    background: darkorange;
}

.button-container {
    text-align: center;
    margin-top: 20px;
}
.button {
	width: 120px;
    margin: 20px;
    padding: 10px;
    text-align: center;
    background: orange;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 23px;
}
.button:hover {
    background-color: darkorange;
}

 /*사이드바 위치 조절 및 크기조절*/
   .sideBar{
        width: 200px; /* 사이드바의 너비 설정 */
    height:1100px;
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


<div id="inquiryList">
    <h1>고객센터</h1>
    <table>
        <thead>
            <tr>               
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>답변일자</th>
            </tr>
        </thead>
        <tbody>
           
                <c:forEach var = "i" items ="${list }" > 
                         <tr>
                            <td><a href="inquiryDetail.do?i_id=${i.i_id}">${i.i_title }</a></td>
                            <td >${i.u_id }</td>
                            <td>${i.i_inquiryDate }</td>
                         <td >${i.i_answerDate }</td>
                          </tr>
                        </c:forEach>
                
    
            
            
           
                     

        </tbody>
    </table>
</div>
<!-- 페이지네이션 -->
<div class="pagination">
    <c:forEach var="i" begin="1" end="${totalPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <li class="pNum n1"><a class="active" href="inquiryList.do?pageNUM=${i}">${i}</a></li>
            </c:when>
            <c:otherwise>
                <li class="pNum n1"><a href="inquiryList.do?pageNUM=${i}">${i}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

</div>

<div class="button-container">
    <button class="button" onclick="submitInquiry();"><a href="inquiryWrite.do">문의 등록</a></button>
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