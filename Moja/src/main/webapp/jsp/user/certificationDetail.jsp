<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증 상세</title>
<!-- 부트스트랩 CSS 파일 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
iframe{
	height: 700px;
	width: 100%;
}
h1 {
	text-align: left;
}

hr {
	border: 1px solid black;
}

.likeIcon {
	height: 60px;
	width: 60px;
}

textarea {
	overflow-y: auto; /* 세로 스크롤 추가. 내용이 넘칠때만 세로 스크롤바 표시 */
	resize: none; /* textarea 크기고정*/
}

.custom-link {
	color: inherit; /* 하이퍼링크 파란색 제거 */
	text-decoration: none; /* 링크 밑줄 제거 */
}

img {
	width: 100%;
}
</style>
<!-- Chart.js 라이브러리 추가. 그래프에 사용-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<!-- <script src="https://apis.google.com/js/api.js"></script>  -->

<script type="text/javascript">
const urlParams = new URL(location.href).searchParams;
const e_id = urlParams.get('e_id');
	window.onload = function() {
		history.pushState(null, null, 'certificationDetail.do?e_id='+e_id);
	}
</script>
</head>
<body>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<h1>${CertiDetailVO.jmfldnm}</h1>
			</div>
			<div class="col-md-6 text-right">
					<c:if test="${result == false}">
						<a href="wishlistInsert.do?e_id=${CertiDetailVO.e_id}&id=${id}"
							class="custom-link"> <svg xmlns="http://www.w3.org/2000/svg"
								width="40" height="30" fill="currentColor" class="bi bi-bag"
								viewBox="0 0 16 16">
            <path
									d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
        </svg>
						</a>
					</c:if>
					<c:if test="${result == true}">
						<a href="wishlistDelete.do?e_id=${CertiDetailVO.e_id}&id=${id}"
							class="custom-link"> <svg xmlns="http://www.w3.org/2000/svg"
								width="40" height="30" fill="currentColor"
								class="bi bi-bag-check" viewBox="0 0 16 16">
            <path fill-rule="evenodd"
									d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0" />
            <path
									d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
        </svg>
						</a>
					</c:if>

			</div>
		</div>
	</div>
	<hr>

	<div class="container mt-5">

		<!-- 탭 네비게이션 -->
		<ul class="nav nav-tabs" id="myTabs">
			<li class="nav-item"><a class="nav-link active" id="tab1-tab"
				data-toggle="tab" href="#tab1">상세설명</a></li>
			<li class="nav-item"><a class="nav-link" id="tab2-tab"
				data-toggle="tab" href="#tab2">강의</a></li>
		</ul>

		<!-- 탭 콘텐츠 -->
		<div class="tab-content mt-2">
			<!-- 탭 1 -->
			<div class="tab-pane fade show active" id="tab1">
				<form>
					<div class="detail-group">
						<label for="qualgbnm">자격구분명:</label> <input type="text"
							class="form-control" id="qualgbnm"
							value="${CertiDetailVO.qualgbnm}" readonly>
					</div>
					<br>
					<div class="detail-group">
						<label for="seriesnm">계열명:</label> <input type="text"
							class="form-control" id="seriesnm"
							value="${CertiDetailVO.seriesnm}" readonly>
					</div>
				</form>
				<div class="row mt-3">
					<div class="col-md-6">
						<div class="detail">
							<label for="detail">개요:</label> <br>
							<textarea class="form-control" id="detail" rows="10" readonly>${CertiDetailVO.detail}</textarea>
						</div>
					</div>
					<div class="col-md-6">
						<div class="url">
							<label for="url">홈페이지 주소:</label> <br> <a
								href="https://www.q-net.or.kr/man001.do?imYn=Y&gSite=Q"
								target="_blank" rel="noopener noreferrer"
								style="font-size: 1.3em; display: inline-block; max-width: 100%;">
								https://www.q-net.or.kr/man001.do?imYn=Y&gSite=Q </a>
						</div>
						<div class="img">
							<img alt="" src="${imagePath}">
						</div>
					</div>
				</div>
				<br>

				<!-- 그래프 -->
				<div class="Chart">
					<p class="text-center">합격률</p>
					<canvas id="passRateChart" width="100" height="50"></canvas>
				</div>
				<br> <br>

				<!-- 시험 일정 테이블 -->
				<div class="card mt-5">
					<div class="card-header"
						style="background-color: #FFA500; color: white;">
						<h5 class="mb-0">올해 시험 일정</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">회차</th>
										<th scope="col">필기시험 원서접수 시작일자</th>
										<th scope="col">필기시험 원서접수 종료일자</th>
										<th scope="col">필기시험 시작일자</th>
										<th scope="col">필기시험 합격(예정)자 발표일자</th>
										<th scope="col">응시자격 서류제출 및 필기시험 합격자 결정시작일자</th>
										<th scope="col">응시자격 서류제출 및 필기시험 합격자 결정종료일자</th>
										<th scope="col">실기,면접 시험 원서접수 시작일자</th>
										<th scope="col">실기,면접 시험 원서접수 종료일자</th>
										<th scope="col">실기,면접 시험 시작일자</th>
										<th scope="col">실기,면접 시험 종료일자</th>
										<th scope="col">실기,면접 합격자 발표일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ep" items="${list}">
										<tr>
											<th scope="row">${ep.description}회차</th>
											<td>${ep.docRegStartDt}</td>
											<td>${ep.docRegEndDt}</td>
											<td>${ep.docExamDt}</td>
											<td>${ep.docPassDt}</td>
											<td>${ep.docSubmitStartDt}</td>
											<td>${ep.docSubmitEnDt}</td>
											<td>${ep.pracRegStartDt}</td>
											<td>${ep.pracRegEndDt}</td>
											<td>${ep.pracExamStartDt}</td>
											<td>${ep.pracExamEndDt}</td>
											<td>${ep.pracPassDt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>


			</div>
			<!-- 탭 2 -->
			<div class="tab-pane fade" id="tab2" style="width: 100%;">
				<p>유튜브</p>
				<iframe width="100%" height="500" src="${youtube.y_url}"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>

			</div>
		</div>

	</div>


	<!-- 부트스트랩 및 jQuery 스크립트 파일 링크 -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	<script>
        
        const labels = ['2020', '2021', '2022'];

        // 합격률 값
        const dataWrite = ["${wrVOP.passRate2020}", "${wrVOP.passRate2021}", "${wrVOP.passRate2022}"];
        const dataPractice = ["${prVOP.passRate2020}", "${prVOP.passRate2021}", "${prVOP.passRate2022}"];

        // 합격률 그래프
        const passRateChart = new Chart(document.getElementById('passRateChart').getContext('2d'), {
            type: 'line', 
            data: {
            labels: labels,
            datasets: [{
                label: '필기',
                borderColor: '#36A2EB',
                data: dataWrite,
                fill: false,
            },
            {
                label: '실기',
                borderColor: '#FF0000',
                data: dataPractice,
                fill: false,
            }],
        },
            options: {
                Responsive: false,
                plugins: {
                    legend: {
                        display: true,
                    },
                    datalabels: {
                        formatter: (value, ctx) => {
                            return labels[ctx.dataIndex] + '\n' + data[ctx.dataIndex] + '%';
                        },
                        color: '#fff',
                        anchor: 'center',
                        align: 'center',
                        offset: 0,
                        font: {
                            size: '10',
                        }
                    }
                },
                tooltips: {
                    enabled: false,
                },
            },
        });
    </script>




</body>
</html>
