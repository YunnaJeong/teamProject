<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
        
         /* -------main css---------*/
        
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



 
        /*섹션*/
        .inquireList{
            border: solid 3px  #DDDDDD;
            margin: 60px 0 0 10px;
            border-radius: 10px;
            height: 850px;
            position: relative;
        }

        /*작성한 문의글 보기 문구*/
        .tableTitle{
            font-size: 30px;
            font-weight: 600;
            margin: 80px 50px 10px 50px;
          

        }

        /*테이블*/
        .inquireListT{
            width: 90%;
            margin: 10px auto;
            border-top: #DDDDDD 3px solid;
            border-bottom: #DDDDDD 3px solid;


        }

		.InquireTitle{
		 	width:200px;
		}


        /*삭제버튼*/
        .deleteBtn{
            position: absolute;
            width: 55px;
            height: 27px;
            top : 100px;
            right: 50px;
            border-radius: 10px;
            border: none;
            background :  #d1d0cf;
            font-weight: 600px;
            font-size: 18px;
            letter-spacing: 0.1em;

            text-align: center;
            color: #ffffff;
            cursor: pointer;

        }
        .deleteBtn:hover {
            font-weight: bold;
            background :  #ED7D31;

        }
        
        			/*페이지네이션 */
        .pageNum{
            display: flex;
            justify-content: flex-start;
            justify-content: space-evenly;
            width: 140px;
            text-align: center;
            position:absolute;
           	bottom:200px;
           	left:380px;
        
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
                <section class="inquireList">
                    <div class="tableTitle">작성한 문의글 보기 </div>
                    <form action="DeleteMyInquireList.do" method="post">
                    <table class="table  table-striped  inquireListT">
                        <thead>
                          <tr>
                            <th scope="col"></th>
                            <th scope="col">작성자</th>
                            <th scope="col" class="InquireTitle"><a href="#">제목</th>
                            <th scope="col">문의일자</th>
                            <th scope="col">답변일자</th>
                            <th scope="col">답변상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "i" items ="${list }" > 
                         <tr>
                            <td><input type="checkbox" name="checkedId" value="${i.i_id }" id="checkedId"> </td>
                            <th scope="row">${i.u_id }</th>
                            <th scope="col"><a href="#">${i.i_title }</a></th>
                            <th scope="row">${i.i_answerDate }</th>
                            <th scope="row">${i.i_inquiryDate }</th>
                            <th scope="row">${empty i.i_state ? 'N' : i.i_state}</th>
                          </tr>
                        </c:forEach>
                         
                     
                 
                        </tbody>
                      </table>
                      <input type="submit" value="삭제" class="deleteBtn" >
	                    <ul class="pageNum">
                    <c:forEach var="i" begin="1" end="${totalPage}">
	                        <li class="pNum n1"><a href="myInquire.do?pageNUM=${i}">${i}</a></li>
					</c:forEach>	
	                    </ul> 
                    
                    
                    </form>
                    
                </section>
        </article>
    </main>

</body>
</html>