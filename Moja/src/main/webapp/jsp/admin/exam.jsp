<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		<h1 class="mt-4">시험</h1>
		<ol class="breadcrumb mb-4">
		</ol>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 시험 글 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>시험ID</th>
							<th>계열코드</th>
							<th>계열명</th>
							<th>자격구분</th>
							<th>자격구분명</th>
							<th>종목명</th>
							<th>del</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>시험ID</th>
							<th>계열코드</th>
							<th>계열명</th>
							<th>자격구분</th>
							<th>자격구분명</th>
							<th>종목명</th>
							<th>del</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="e" items="${list }">
						<tr>
							<td><a style="color:black;" href="examDetail.do?e_id=${e.e_id }">${e.e_id }</a></td>
							<td>${e.seriescd }</td>
							<td>${e.seriesnm }</td>
							<td>${e.qualgbcd }</td>
							<td>${e.qualgbnm }</td>
							<td>${e.jmfldnm }</td>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<form method="post">
				<input type="submit" value="삭제" style="float:right;">
			</form>
		</div>
	</div>
	
</body>
</html>