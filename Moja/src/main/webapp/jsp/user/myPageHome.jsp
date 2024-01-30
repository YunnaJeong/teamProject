<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
        rel="stylesheet"><!--구글폰트-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/e72539902e.js" crossorigin="anonymous"></script> <!--아이콘 사용-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


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
 		 margin-top: 15px; /*사이드바 위아래 위치설정*/
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
            padding-top: 10px;

        }




        .myPage{
            border: solid 3px  #DDDDDD;
            border-radius: 20px;
            height: 800px;
            position: relative;
            margin: 70px 0 0 10px;
            padding-top: 30px ;
            padding-left: 10px;

        }

        .myPageTitle{
            width: 900px;
            height: 100px;
            font-size: 40px;
            font-weight: 900;
            margin: 30px 0 0 30px;
            padding: 20px 0 0 10px; 
        }

        .line1{
            width: 850px;
            height: 1px;
            border: #bebdbd 1px solid;
            margin: auto;
        }
        
        /* 내 이름과 등급  */
        .myRating{
            width: 850px; height: 200px;
            border: #DDDDDD 1px solid;
            margin: 30px auto ;
            padding : 25px 200px 20px 75px ;
            position: relative;
        }
        
        /* 글자간 간격조절 */
        .myRating li{
            font-size: 18px;
            margin-top: 20px;
            letter-spacing : 0.14em 
        }

        #myname{
            font-size: 35px;
            font-weight: bolder;
        }
        .mypageimg{
            width: 340px;
            height: 100px;
            position: absolute;
            right: 30px;
            top:50px
        }

        .container{
            margin: 50px auto;
            display: flex;
            justify-content: flex-start;
            justify-content: space-evenly;

        }

        .oneeye{
            font-size: 20px;
            margin: 30px;
        }

        .box{
            border: #DDDDDD 1px solid ;
            width: 270px;
            height: 200px;
            padding: 30px;
            position: relative;

        }

       
        .line2{
            width: 220px;
            border: #DDDDDD 1px solid;

        }


        .box li{
            margin: 10px;
        }

        .b1{
            display: grid ;
            grid-template-columns: repeat(2,1fr);
            
        }
        .b2{
             display: grid;
             grid-template-columns: repeat(2,1fr);
        }
        
        
        .itemN{
            text-align: end;
    
        }


        
        /*더보기 버튼*/
        .more {
            font-size: 12px;
            padding: 5px 10px;
            color: #ffffff;
            background: #bebdbd;
            border-radius: 9%;
            position: absolute;
            top: 150px;
            left:110px
        }

        .more:hover{
            font-weight: bold;
            background :  #ED7D31;
        }
        


        /* -------main css끝--------*/
         
         
         
         
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
             <section class="myPage">
                <div class="myPageTitle">MY PAGE</div>
                <div class="line1" ></div>
                <div class="myRating">
                    <ul>
                        <li class="myname" id="myname"><c:out value="${u_name}" />님</li>  
                        <li>현재 회원님은 일반 회원등급입니다.</li>
                    </ul>
                    
                </div>
                <!-- <div class="line1" ></div>
                <span class="oneeye">한눈에 보기</span> -->
                <div class="container">

                    <div class="box">
                        <h5>관심자격증</h5>
                        <div class="line2"></div>
                        <div class="b1">
                                <li class="item">담긴 자격증</li>
                                <li class="itemN">${wish } 건</li>
                        </div>
                        <A href="myWishlist.do" class="more" id="more1">더보기</A>
                    </div>
                    
                    <div class="box">
                        <h5>내문의</h5>
                        <div class="line2"></div>
                        <div class="b2">   
                            <li class="item">답변대기</li>
                            <li class="itemN">${inquireN} 건</li>
                            <li class="item">답변완료</li>
                            <li class="itemN">${inquireY} 건</li>
                        </div> 
                        <A href="myInquire.do" class="more" id="more2">더보기</A>
                    </div>
                    
                    
                    <div class="box">
                        <h5>스터디 작성글</h5>
                        <div class="line2"></div>
                        <div class="b2">
                            <li class="item">모집대기</li>
                            <li class="itemN">${StudyN} 건</li>
                            <li class="item">모집완료</li>
                            <li class="itemN">${StudyY} 건</li>
                        </div>  
                        <A href="myStudyList.do" class="more" id="more3">더보기</A>
                    </div>

                </div>
            </div>
             </section>
        </article>
    </main>


</body>
</html>