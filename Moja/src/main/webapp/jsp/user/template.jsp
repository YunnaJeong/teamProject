<%@page import="action.NewListAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

$(function(){
	<%new NewListAction().pro(request, response);%>
	var bottom = $("#content").height()+350;
	var width = $(".templateBody").width();
	$("#footer").css("top",bottom);
	$("#footer").css("width",width);
	
	$("#content").css("width",width);
	$("#header").css("width",width);
	
	$(window).resize(function () {
		bottom = $("#content").height()+350;
		width = $(".templateBody").width();
		$("#footer").css("top",bottom);
		$("#footer").css("width",width);
		
		$("#content").css("width",width);
		$("#header").css("width",width);
		
	})
})
</script>
<title>Insert title here</title>
</head>

<body class="templateBody" style="min-height: 100vh;">
	<header>
	<div id="header" >
		<jsp:include page="header.jsp"/>
	</div>
	</header>
	
	<div id="content">
		<jsp:include page="${viewPage}"/>
	</div>
	
	<div id="footer" style="position : absolute;">
		<jsp:include page="footer.jsp"/>
	</div>

</body>
</html>