<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
        rel="stylesheet"><!--구글폰트-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e72539902e.js" crossorigin="anonymous"></script> <!--아이콘 사용-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


</head>
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
        height:1000px;    /*메인에 높이를 명확히 지정해 푸터 이동없도록 변경*/
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

        }

        /*메인 타이틀 관심자격증 가운데정렬*/
        .article  span{ 
            font-size: 30px;
            display: flex;
            justify-content: flex-start;
            margin:10px 10px 0px;
            padding-top: 10px;

        }
        
        .line1{
            margin: 3px 10px 10px;
        }

        /*섹션*/
        .wishlist{
            border: solid 3px  #DDDDDD;
            border-radius: 10px;
            height: 800px;
            padding: 40px;
            position: relative;
            display: flex;
            justify-content: flex-start;
            justify-content: space-evenly;
            flex-wrap: wrap;


        }

        /*관심자격증 리스트 공통클래스*/
        .box{ 
             border: #DDDDDD 1px solid;
            border-radius: 7%;
            width: 250px;
            height: 300px;
            position: relative;
            padding:0px
            

        }

        /*자격증 이미지 공통*/
        .cerImg{
            border-top-left-radius: 7%;
            border-top-right-radius: 7%;
            width: 250PX;
            height: 150PX;
        }

        /*자격증 정보 공통*/
        .cerInfo{
            padding: 10px;

        }

        /*자격증명 공통*/
        .cerTitle{
            font-size: 17px;
            font-weight: 700;
        }

        /* 자격증 시험일 공통 */
        .cerDay{
            font-size: 12px;
            margin-top: 6px;
        }

               /*자세히보기 버튼*/
        .more{
            position: absolute;
            width: 100px;
            height: 23px;
            bottom : 9px;
            left: 15px;
            border-radius: 5px;
            border: none;
            background :  #ED7D31;
            color: #ffffff;
            font-size: 11px;
            text-align: center;
            padding-top: 5px;
        }
        /*삭제하기 버튼*/
        .del{
            position: absolute;
            width: 100px;
            height: 23px;
            bottom : 9px;
            right: 15px;
            border-radius: 5px;
            border: none;
            background :  #ED7D31;
            color: #ffffff;
            font-size: 11px;
            text-align: center;
            padding-top: 5px;
        
        }
		/*페이지네이션 */
       .pageNum{
       		
            display: flex;
            justify-content: flex-start;
            justify-content: space-evenly;
            width: 140px;
            text-align: center;
            position:absolute;
           	bottom:40px;
           	left:400px;
        
        }
        .pNum{
            background: #ffffff;
            border: 1px solid #DDDDDD;
            color: #ED7D31;
            width: 28px;
            height: 34px;
            font-size: 22px;
            border-radius: 5px;
            cursor: pointer;
        }
        .pNum:hover{
            background: #ED7D31;
            border: 1px solid #ED7D31;
        }
        .pNum a {
        display: inline-block; 
        width:28px;
        }
		.pNum a:hover{
		color:#ffffff;		
		}

        /* -------main css끝--------*/

 

</style>
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
                <span>관심 자격증</span>
                <hr class="line1">
                <section class="wishlist">
	
		           <c:forEach var ="w" items ="${list }" > 
                    <div class="cer1 box">
                 
	                  		 <%-- <img src="../../image/${w.img}" class="cerImg" id="cerImg1"/>  --%>
	                  		 	<c:if test="${w.img == 'null' }">
	                  		 		<img src="../../image/backimg2.jpg" class="cerImg" id="cerImg1"/>
	                  		 	</c:if>
	                  		 	<c:if test="${w.img != 'null' }">
	                  				<img src="../../image/${w.img}" class="cerImg" id="cerImg1"/>
	                  		 	</c:if>
                    		
	                        <ul class="certInfo1 cerInfo" id="certInfo1">
	                            <li class="cerTitle">${w.jmfldnm }</li>
	                            <li class="cerDay">카테고리: ${w.mdobligfldnm }</li>
	                        
	                            <a href="#" name="cerNo" value="" class="more">상세보기</a>
	                            <a href="DeleteMyWishlist.do?e_id=${w.e_id}" name="cerNoDel" value="" class="del del1">삭제</a>
	                        </ul>
	                    </div>
	               </c:forEach>
	 			   <ul class="pageNum">
			             <c:forEach var="i" begin="1" end="${totalPage}">
					        <li class="pNum n1"><a href="myWishlist.do?pageNUM=${i}">${i}</a></li>
						</c:forEach>	
					</ul>
                </section>
        </article>
    </main>

</body>
</html>