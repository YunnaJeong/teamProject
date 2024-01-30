<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Question Detail Page</title>
<style>
/* Basic reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {
    width: 80%;
    margin: 20px auto;
}
.title {
    font-size: 25px;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
    text-align: center;
}
.content {
    margin-bottom: 50px; /* Increased bottom margin */
    width: 1000px; /* Increased width */
    height: 300px;
    padding: 15px;
    border: 1px solid #ddd;
    background: #f9f9f9;
    margin-left: auto; /* Added to center the content box */
    margin-right: auto; /* Added to center the content box */
}
.content p {
    padding: 15px;

    background: #f9f9f9;
    font-size: 25px;
}
.button {
    display: block;
    width: 130px;
    margin: 20px auto;
    padding: 10px;
    text-align: center;
    background: orange;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 25px;
}
/* Additional styles can be added here */
</style>
</head>
<body>


<div class="container">


     <c:forEach var="b" items="${qna1}">
            <div class="title">${b.q_title}</div>
            <div class="content">
                <p>${b.q_title}</p>
            </div>
            <div class="content">
                <p>${b.q_answer}</p>
            </div>
        </c:forEach>
    </div>
    
    
    <button class="button"><a href="qnaList.do">목록으로</a></button>
</div>

</body>
</html>