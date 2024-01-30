<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.onload = function() {
		history.pushState(null, null, 'user.do');
	}
</script>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		<h1 class="mt-4">회원관리</h1>
		<form method="post" action="userAllDelete.do">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 회원 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>del</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>del</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="u" items="${list }">
							<tr>
								<td><a href="userDetail.do?u_id=${u.u_id }" style="color:black;">${u.u_id }</a></td>
								<td>${u.u_name }</td>
								<td>${u.u_birth }</td>
								<td>${u.u_phone }</td>
								<td>${u.u_addr }</td>
								<td><input type="checkbox" name="del_id" value="${u.u_id }"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<input type="submit" value="삭제" style="float: right;">		
		</div>
		</form>
	</div>
</body>
</html>