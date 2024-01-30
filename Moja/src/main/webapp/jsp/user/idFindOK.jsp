<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

    </style>
    
<title>모두의 자격증</title>
</head>
<body>
<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">

			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>모두의자격증</h2>
								<p>아직 회원이 아니신가요?</p>
								<a href="join.do" class="btn btn-white btn-outline-white">회원가입</a>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">ID찾기</h3>
			      		</div>								
			      	</div>
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">ID</label>
			      			<label class="label">회원님의 아이디는 ${findId} 입니다</label>
			      			
			      		</div>
		            
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
		
									</div>
									<div class="w-50 text-md-right">
										<a href="idFind.do">아이디를 잊으셨나요?</a><br>
										<a href="pwFind.do">비밀번호를 잊으셨나요?</a>
									</div>
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