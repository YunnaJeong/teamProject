<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap" rel="stylesheet"><!--구글폰트-->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
	<link rel="stylesheet" href="../../css/loginstyle.css">

<style>
    
        /* 초기화 */
        body,h1,h2,h3,div,p,ul, li,dl, dt,dd {
            margin: 0;
            padding: 0
        }

        /*바디 기본폰트설정,구글 폰트설정함*/
        body { 
            font-family: 'Poppins', 'Noto Sans KR', sans-serif;
            font-size: 14px;
            line-height: 1.5
            
        }

        .header {
            width: 1200px;
            height: 90px;
            margin: 0 auto;
            padding: 15px 10px 0px 5px;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: #575656;

        }

        .logo img {
            width: 260px;
            height: 90px;
        }

        .menuBar {
            width: 550px;
            height: 90px;
        }

        .gnb {
            height: 90px;
            display: flex;
            justify-content: space-between;
            font-size: 22px;
            padding-right: 20px;
        }

        .gnb li {
            align-self: center;
        }

        .topMenu {       
            padding-bottom: 13px;
            position: relative;
        }

        .TM {
            display: flex;
            justify-content: flex-end;
            font-size: 15px;
            padding: 0 5px 0 5px;
            width: 210px;
            height: 25px;
        }

        .searchBar {
            border: 3px solid #928e8e;
            border-radius: 7px;
            height: 23px;
        }
    
        /*돋보기아이콘*/
        .fa-magnifying-glass{  
            position: absolute;
            right: 9px;  /*모니터 크기에 따라 위치 달라짐.필요하면 수치조정하기 */
            bottom: 19px;
            color: #928e8e;
        }



        /*--------header CSS 끝-----*/

        /* -------main css---------*/


        /* 배너-레이아웃용이므로 삭제하고 작업 ㄱ  */
        .banner {
            width: 1fr;
            height: 320px;
            background: #DDDDDD;
        }

        .article {
            width: 1200px;
            height: 1000px;
        }


        /* -------main css끝--------*/

        

        /* ----footer CSS ---- */
        
        .footer {
            width: 1fr;
            height: 320px;
            background: #4F4A45;
            color: #ffffff;

        }

        .ft_info {
            width: 1215px;
            margin: auto;
            padding-top: 14px;
            font-size: 15px;
            position: relative;
        }

        .ft_link {
            margin: 20px;
        }

        .ft_link li {
            list-style: disc
        }

        .fa-brands{
            width: 100px;
            height: 30px;
        }
        .sns{
            width: 350px;
            height: 50px;
            position: absolute;
            right: 5px;
            bottom: 70px;
            display: flex;
            align-content: space-between;

        }
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
        rel="stylesheet"><!--구글폰트-->
    <script src="https://kit.fontawesome.com/e72539902e.js" crossorigin="anonymous"></script> <!--아이콘 사용-->
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
							<form action="idFindOK.do" method="post" class="signin-form">
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">이름</label>
			      			<input type="text" class="form-control" name="name" placeholder="이름" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<div class="col-tit">휴대폰</div>
        <div class="col-content">
            <select class="col_select" name="phone1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
            </select>
            -
            <input type="text" id="HPhone1" class="inpTxt" name="phone2" maxlength="4" size="10">
            -
            <input type="text" id="HPhone2" class="inpTxt" name="phone3" maxlength="4" size="10">
        </div>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary submit px-3">ID찾기</button>
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
		
									</div>
									<div class="w-50 text-md-right">
										<a href="idFind.do">아이디를 잊으셨나요?</a><br>
										<a href="pwFind.do">비밀번호를 잊으셨나요?</a>
									</div>
		            </div>
		          </form>
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