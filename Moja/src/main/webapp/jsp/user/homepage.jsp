<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.bg-dark {
	margin-top: 30px;
}

.display-4 {
	color: #ff8C00;
}

.lead fw-normal {
	color: white;
}

.card-img-top {
	width: 300px;
	height: 200px;
}

#youtube {
	width: 300px;
	height: 300px;
}
</style>
<meta charset="utf-8">
<title>모두의 자격증 - 모자</title>
</head>
<body>
	<header class="bg-dark py-5">

		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">모두의 자격증</h1>
				<p class="lead fw-normal text-white-50 mb-0">모두의 자격증에서 시험정보를
					한눈에!</p>
			</div>
		</div>
	</header>
	<!-- Section-->
	<c:choose>
		<c:when test="${id ne null }">
			<div class="container px-4 px-lg-5 mt-5">

				<h3>${id}님을 위한 추천 자격증</h3>
				<br>
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach items="${lists}" var="a" begin="1" end="4">
						<div class="col mb-5">
							<div class="card h-100">
								<!-- Product image-->
								<img class="card-img-top" src="../../image/${a.img}" />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${a.jmfldnm}</h5>
										<!-- Product price-->
										${a.obligfldnm }<br>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="certificationDetail.do?e_id=${a.e_id }">상세보기</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:when>
	</c:choose>
	<div class="container px-4 px-lg-5 mt-5">
		<h3>인기자격증목록</h3>
		<br>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${bestList}" var="a">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="../../image/${a.img}" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${a.jmfldnm}</h5>
								<!-- Product price-->
								${a.obligfldnm }<br>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="certificationDetail.do?e_id=${a.e_id }">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<section class="py-5">
		<c:choose>
			<c:when test="${id eq null }">
				<div class="container px-4 px-lg-5 mt-5">
					<h3>인기강의목록</h3>
					<br>
					<div
						class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<c:forEach items="${yList}" var="y">
							<div class="col mb-5">
								<div class="card h-100">
									<iframe id="youtube" src="${y.y_url }"
										title="YouTube video player" frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										allowfullscreen></iframe>
								</div>
							</div>

						</c:forEach>


					</div>
				</div>
			</c:when>
		</c:choose>


		<hr>
	</section>

</body>
</html>