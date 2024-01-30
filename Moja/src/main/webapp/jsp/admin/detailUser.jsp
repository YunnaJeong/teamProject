<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>문의 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	
<style type="text/css">
	table{
    color: #000;
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
 }
 
 th, td {
    border-bottom: 1px solid;
    border-left: 1px solid;
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
</style>
</head>
<body>
	<div style="width: 80%; height: auto; margin: auto;padding:20px;">
	<header class="n-section-title first info_views-area">
                    <h1 class="tit">회원정보 </h1>
                </header>
                <hr style="border:3px solid black;">
		<table class="n-table table-row my-info-modify">
                    <colgroup>
                        <col style="width:190px">
                        <col style="width:*">
                    </colgroup>
                    <tbody>
                    <tr class="my-info-img" id="profile-image-area">
                        <th scope="row">사진</th>
                        <td>
                                <div>
                                    <div class="img"></div>
                                </div>
                            
                            <img src="../../image/person.svg" style="width:400px;height:400px;"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">아이디</th>
                        <td colspan="2"><strong>${u.u_id }</strong></td>
                    </tr>
                    <tr>
                        <th scope="row">이름(실명)</th>
                        <td>
                            <strong>${u.u_name }</strong>
                        </td>
                    </tr>
                    <tr id="nickName-area">
                        <th scope="row">생년월일</th>
                        <td><strong>${u.u_birth }</strong></td>             
                    </tr>
                    <tr id="email-area">
                        <th scope="row">주소</th>
                        <td>
                            <strong id="currentEmail">${u.u_addr }</strong>
                        </td>
                    </tr>
                    <tr id="mobile-area">
                        <th scope="row">휴대전화</th>
                        <td><strong>${u.u_phone }</strong>
                        </td>    
                    </tr>
                    <tr id="mobile-area">
                        <th scope="row">관심목록</th>
                        <td><strong>${u.u_interest }</strong>
                        </td>    
                    </tr>
                    </tbody>
                </table>
		<button style="float:right;" onclick="location.href='userDelete.do?u_id=${u.u_id }'">
			삭제
		</button>
		<button style="float:right;" onclick="location.href='user.do'">
			목록으로
		</button>
	</div>
</body>
</html>