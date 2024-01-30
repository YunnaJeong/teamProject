<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
details {
    margin-bottom: 1rem;
}

details > summary {
    background: rgba(150, 255, 150);
    padding: 1rem;
    outline: 0;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.5s;
}

details > summary::-webkit-details-marker {
    background: url(https://marshall-storage.tistory.com/attachment/cfile29.uf@993E16335F785C0037CB43.svg) no-repeat center;
    background-size: contain;
    color: transparent;
    transform: rotate3d(0, 0, 1, 90deg);
    transition: transform 0.25s;
}

details[open] > summary::-webkit-details-marker {
    transform: rotate3d(0, 0, 1, 180deg);
}

details[open] > summary {
    background: rgba(100, 255, 100);
}

details[open] > summary ~ * {
    animation: reveal 0.5s;
}

@keyframes reveal {
    from {
        opacity: 0;
        transform: translate3d(0, -10px, 0);
    }

    to {
        opacity: 1;
        transform: translate3d(0, 0, 0);
    }
}
</style>
</head>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
	<div style="width: 80%; height: auto; margin: auto;padding:20px;">
		<h1 class="mt-4">${e.jmfldnm }</h1>
		<div>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">자격구분</li>
			  <li class="list-group-item">${e.qualgbcd }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">자격구분명</li>
			  <li class="list-group-item">${e.qualgbnm }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">계열코드</li>
			  <li class="list-group-item">${e.seriescd }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">계열명</li>
			  <li class="list-group-item">${e.seriesnm }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">종목코드</li>
			  <li class="list-group-item">${e.jmcd }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">대직무분야코드</li>
			  <li class="list-group-item">${e.obligfldcd }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">대직무분야명</li>
			  <li class="list-group-item">${e.obligfldnm }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">중직무분야코드</li>
			  <li class="list-group-item">${e.mdobligfldcd }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">중직무분야명</li>
			  <li class="list-group-item">${e.mdobligfldnm }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">상세설명</li>
			  <li class="list-group-item">${e.detail }</li>
			</ul>
		</div>
		<details>
		  <summary>일정보기</summary>
		  <div>
		    <c:forEach var="ep" items="${list }" >
			<h1 class="mt-4">${ep.description }회차</h1>
			<div>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">필기시험 원서접수 시작일자</li>
			  <li class="list-group-item">${ep.docRegStartDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">필기시험 원서접수 종료일자</li>
			  <li class="list-group-item">${ep.docRegEndDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">필기시험 시작일자</li>
			  <li class="list-group-item">${ep.docExamDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">필기시험 합격(예정)자 발표일자</li>
			  <li class="list-group-item">${ep.docPassDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">응시자격 서류제출 및 필기시험 합격자 결정시작일자</li>
			  <li class="list-group-item">${ep.docSubmitStartDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">응시자격 서류제출 및 필기시험 합격자 결정종료일자</li>
			  <li class="list-group-item">${ep.docSubmitEnDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">실기,면접 시험 원서접수 시작일자</li>
			  <li class="list-group-item">${ep.pracRegStartDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">실기,면접 시험 원서접수 종료일자</li>
			  <li class="list-group-item">${ep.pracRegEndDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">실기,면접 시험 시작일자</li>
			  <li class="list-group-item">${ep.pracExamStartDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">실기,면접 시험 종료일자</li>
			  <li class="list-group-item">${ep.pracExamEndDt }</li>
			</ul>
			<ul class="list-group list-group-horizontal">
			  <li class="list-group-item">실기,면접 합격자 발표일자</li>
			  <li class="list-group-item">${ep.pracPassDt }</li>
			</ul>
		</div>
		</c:forEach>
		  </div>
		</details>
		
		<button value="목록으로" style="float:left;" onclick="location.href='exam.do'">
			목록으로
		</button>
	</div>
	</div>
</body>
</html>