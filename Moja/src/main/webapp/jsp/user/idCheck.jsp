<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
var check=false;
$(function(){
	$("#close").click(function(){
		window.close();
	})
	$("#use").click(function(){
		window.close();
		check = true;
	})
})
</script>
<meta charset="utf-8">
<title>모두의자격증</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
        rel="stylesheet"><!--구글폰트-->
    <script src="https://kit.fontawesome.com/e72539902e.js" crossorigin="anonymous"></script> <!--아이콘 사용-->
    <style>
body{
	background: white;
}
header{
	display:none;
}
footer{
	display:none;
}
#footer{
	display:none;
}

    </style>
    
<title>Insert title here</title>
</head>
<body>
<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">

			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">

						<div class="login-wrap p-4 p-lg-5">
						<h2>ID중복확인</h2>
						<br>
			      	<div class="d-flex">
						
			      	</div>
			      		<div class="form-group mb-3">
			      			
			      			<label class="label">${id}${msg }</label>
			      			<c:if test="${msg eq '는 사용할 수 있습니다' }">			      			
			      			<a id="use">사용하기</a>
			      			</c:if>
			      			<c:if test="${msg eq '는 사용할 수 없습니다' }">
			      			<a id="close">닫기</a>
			      			</c:if>
			      		</div>
		            
		            
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="../../js/jquery.min.js"></script>
  <script src="../../js/popper.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/main.js"></script>


</body>
</html>