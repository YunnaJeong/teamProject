<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

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


        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: #575656;

        }
   
        .main{
        width:1200px;
        height:1000px;
        margin: auto;
       
        
        }

        /*사이드바 위치 조절 및 크기조절*/
            .sideBar{
         width: 260px;
         height:980px;
         margin-top: 15px;
         background: #DDDDDD;
         left: 1000px;
         border-radius: 10px;
         float: left;
         }

         /*사이드바 메뉴위치조절*/
         .sideBar > ul{
            padding: 5px 0 0 0;
         }

         /*사이드바 마이페이지 타이틀*/
         .menuTitle{
            font-size:35px;
            font-weight: 600;
            color: #575656;
            margin: 25px 30px 10px 30px;
         }
         
         /*사이드바메뉴 설정*/
         .s_menu{
            font-size: 20px;
            font-weight: 700;
            color: #575656;
            margin: 10px;
            cursor: pointer;
            padding: 5px 10px 5px 20px;
         }

            /*사이드바메뉴 호버효과*/
         .s_menu:hover {
            background: #928e8e;
         }
         .s_menu a {
         	display:inline-block;
         	width:210px;
         }
         .s_menu a:hover{
         	 color: #ffffff;
         }
		
		


  
        /*본문*/
        .article {
            width: 930px;
            height: 1000px;
            float: right;
            position: relative;

        }

        /*내정보수정 가운데정렬*/
        .article  span{ 
            font-size: 30px;
            display: flex;
            justify-content: center;

            
        }
      
        /*내정보수정 화면프레임*/
        .myInfo{
            border: solid 3px  #DDDDDD;
            border-radius: 10px;
            height: 700px;
            position: relative;

        }
        /*form양식 담는 컨테이너*/
        .container{
            width: 500px;
            height: 600px;
            margin: 50px auto;
            /* display: grid;
            grid-template-columns: 200px 1fr;
            grid-template-rows: 60px 60px 60px 60px 60px;
            grid-gap: 10px; */
          
        }

        .lab{
            font-size: 27px;
        }



        /* 수정버튼 */
        .submitBtn{
            width: 80px;
            height: 30px;
            border-radius: 10px;
            border: none;
            background :  #d1d0cf;
            font-weight: 800px;
            color: #ffffff;
            cursor: pointer;
            position: absolute;
            top:80%;
            right: 55%;

        }
        /*재작성버튼*/
        .resetBtn{
            width: 80px;
            height: 30px;
            border-radius: 10px;
            border: none;
            background :  #d1d0cf;
            font-weight: 800px;
            color: #ffffff;
            cursor: pointer;
            position: absolute;
            top:80%;
            right: 40%;

        }

        /* 버튼 호버효과 */
        .hover:hover {
            font-weight: bold;
            background: #ED7D31;

        }


</style>
</head>
<body>
   <main id="main" class="main">
        <nav id="sideBar" class="sideBar" >
            <div class="menuTitle">마이페이지</div>
            <ul>
                <li class="s_menu"><a href="pwdCheck.do">내 정보수정</a></li>
                <li class="s_menu"><a href="myWishlist.do">위시리스트</a></li>
                <li class="s_menu"><a href="myInquire.do">내 문의</a></li>
                <li class="s_menu"><a href="myStudyList.do">스터디작성글</a></li>
             </ul>
        </nav>
        <article class="article" id="article">
            <span>내 정보수정</span>
            <hr>
            <section class="myInfo">
                <form action="updateMyInfoOK.do" method="post">
                        <div class="container">
                            <div class="item1"> <label for="u_id" class="form-label">아이디  </label></div>
                            <input type="hidden" name="u_id" value="${id }">
                            <div class="item2"> <input type="text" name="u_id" id="u_id" class="form-control" value="${id }"  disabled ><br></div>
                            <div class="item3"> <label for="u_pwd" class="form-label">비밀번호</label></div>
                            <div class="item4"> <input type="password" name="u_pwd" id="u_pwd" class="form-control" placeholder=""><br></div>
                            <div class="item5"> <label for="u_name" class="form-label">이름 : ${u_name } </label></div>
                            <div class="item6"> <input type="text" name="u_name" id="u_name" class="form-control" placeholder=" "><br></div>
                            <div class="item7"> <label for="u_phone" class="form-label">연락처 : ${u_phone } </label></div>
                            <div class="item8"> <input type="text" name="u_phone" id="u_phone" class="form-control" placeholder=" "><br></div>
                            <div class="item9"> <label for="u_addr" class="form-label">주소 : ${u_addr } </label></div>
                            <div class="item10"> <input type="text" name="u_addr" id="u_addr" class="form-control" placeholder=""><br></div>
                        </div>
                        <div>
                            <input type="submit" value="수정" class="submitBtn hover">
                            <input type="reset" value="재작성" class="resetBtn hover">
                        </div>
                    </form>
                </section>
        </article>
    </main>

</body>
</html>