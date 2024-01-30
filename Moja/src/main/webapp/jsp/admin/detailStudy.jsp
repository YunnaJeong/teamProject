<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/css/npm_tinymce.11812fb7b9e7501ca2a8.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/css/MAIN.9d0b26897ffd11f61f81.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/css/_post_study_item.8371276e43c7cccade20.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/vendor/bulma-accordion.min.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/vendor/bulma-switch.min.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/vendor/bulma-tooltip.min.css">
<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/fontawesome/css/all.css">

<title>Insert title here</title>
<style>
.pg___questions_detail .community-post-info {
	position: relative;
	padding: 42px 32px;
}

.pg___questions_detail .answer-info .answer-info__header .answer-info__title
	{
	height: 27px;
	margin-bottom: 0;
	font-size: 18px;
	font-weight: 700;
	letter-spacing: -.3px;
	color: #495057;
}
</style>
</head>
<body>
	<br>
	<br>
	<main id="main">
		<section
			class="community-post-detail__section community-post-detail__post"
			data-id="233255"
			style="margin: auto; width: 50%; border: solid; padding: 20px; border-color: #ff8C00; border-radius: 10px">

			<div class="section__content">
				<div class="community-post-info">
					<!-- 제목, 작성자이름, 작성시각, 에디터 -->
					<div class="community-post-info__header">

						<div class="header__title">
							<h1>${s.s_title }</h1>
						</div>
						<br>
						<div class="header__sub-title">
							<div class="header__sub-title__content">
								<!--작성자, 작성일, 시간, 조회수 -->
								<h6 class="user-name">
									작성자 : <a href="/users/393414/@2now">${s.u_id }</a>
								</h6>
								<div class="content-date">
									<span class="sub-title sub-title__created-at"> <span
										class="sub-title__title">작성일</span> <span
										class="sub-title__value">${s.s_date }</span>
									</span> <span class="sub-title sub-title__view-count"> <span
										class="sub-title__title">조회수</span> <span
										class="sub-title__value">${s.s_count }</span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<hr style="color: black; border: solid">
					<div class="community-post-info__content">
						<!-- 스터디 글 내용 부분 -->

						<div style="min-height: 300px">
							<pre>
						${s.s_content }
						</div>
						<br>
						<br>
						<div class="post__features">
							<!-- 모집완료, 좋아요-->

							<div class="flex-row feature__status e-status e-hover-toggle"
								data-status="1" style="float: right">
								<button
									class="ac-button is-md is-solid button-rounded undefined "
									style="background: #ff8c00" onclick="location.href='study.do'">
									<b>글 목록</b>
								</button>
								<button
									class="ac-button is-md is-solid button-rounded undefined "
									style="background: #ff8c00" onclick="location.href='studyDelete.do?s_id=${s.s_id}'">
									<b>글 삭제</b>
								</button>
							</div>
							<!-- 글목록 끝 -->

							<div class="flex-row feature__status e-status e-hover-toggle"
								data-status="1" style="float: left">

								<button
									class="ac-button is-md is-solid button-rounded undefined "
									disabled="" style="background: #ff8c00">모집완료</button>
							</div>
							<!-- 모집완료 버튼 끝 -->

							<div
								class="flex-row feature__recommend e-post-like e-hover-toggle"
								data-id="233255" data-status="" data-cnt="2">

								<button
									class="ac-button is-md is-outlined is-white button-rounded undefined ">
									<svg width="16" height="16" viewBox="0 0 16 16"
										xmlns="http://www.w3.org/2000/svg">
										<path fill="#1B1C1D" fill-rule="evenodd" clip-rule="evenodd"
											d="M4.49095 2.66666C3.10493 2.66666 1.66663 3.92028 1.66663 5.67567C1.66663 7.74725 3.21569 9.64919 4.90742 11.0894C5.73796 11.7965 6.571 12.3653 7.19759 12.7576C7.51037 12.9534 7.7704 13.1045 7.95123 13.2061C7.96818 13.2156 7.98443 13.2247 7.99996 13.2333C8.01549 13.2247 8.03174 13.2156 8.04869 13.2061C8.22952 13.1045 8.48955 12.9534 8.80233 12.7576C9.42892 12.3653 10.262 11.7965 11.0925 11.0894C12.7842 9.64919 14.3333 7.74725 14.3333 5.67567C14.3333 3.92028 12.895 2.66666 11.509 2.66666C10.1054 2.66666 8.9751 3.59266 8.4743 5.09505C8.40624 5.29922 8.21518 5.43693 7.99996 5.43693C7.78474 5.43693 7.59368 5.29922 7.52562 5.09505C7.02482 3.59266 5.89453 2.66666 4.49095 2.66666ZM7.99996 13.8018L8.22836 14.2466C8.08499 14.3202 7.91493 14.3202 7.77156 14.2466L7.99996 13.8018ZM0.666626 5.67567C0.666626 3.368 2.55265 1.66666 4.49095 1.66666C6.01983 1.66666 7.25381 2.48414 7.99996 3.73655C8.74611 2.48414 9.98009 1.66666 11.509 1.66666C13.4473 1.66666 15.3333 3.368 15.3333 5.67567C15.3333 8.22121 13.4657 10.3823 11.7407 11.8509C10.863 12.5982 9.98767 13.1953 9.33301 13.6052C9.00516 13.8104 8.73133 13.9696 8.53847 14.0779C8.44201 14.1321 8.36571 14.1737 8.31292 14.2019C8.28653 14.2161 8.26601 14.2269 8.25177 14.2344L8.2352 14.2431L8.23054 14.2455L8.22914 14.2462C8.22897 14.2463 8.22836 14.2466 7.99996 13.8018C7.77156 14.2466 7.77173 14.2467 7.77156 14.2466L7.76938 14.2455L7.76472 14.2431L7.74815 14.2344C7.73391 14.2269 7.71339 14.2161 7.687 14.2019C7.63421 14.1737 7.55791 14.1321 7.46145 14.0779C7.26858 13.9696 6.99476 13.8104 6.66691 13.6052C6.01225 13.1953 5.13695 12.5982 4.25917 11.8509C2.53423 10.3823 0.666626 8.22121 0.666626 5.67567Z"></path></svg>
									<div class="text features__text">2</div>
								</button>
								<div class="message e-target-hover-toggle hide">2명이 이 글을
									좋아합니다!</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<br>
		<section
			class="community-post-detail__section community-post-detail__answer"
			style="margin: auto; width: 50%; background: #F8F9FA; padding: 30px; border-radius: 20px">
			<!--댓글 부분  -->
			<div class="section__content">
				<div class="answer-info">
					<div class="answer-info__header" style="padding: 10px">
						<div class="answer-info__title">
							댓글 <span class="answer-info__title--count">${cnt }</span>
						</div>
					</div>
					<div class="community-post-info__content">
						<div class="answer-comment" data-id="new">
							<div class="bootstrap-components comment__input">
								<div class="e-signin">
									<input type="text" placeholder="댓글을 작성해보세요."
										class="form-control form-control-lg " required="">
								</div>
							</div>
							<div class="comment__editor e-comment__editor">
								<div class="markdown-body"></div>
								<div class="bootstrap-components comment__footer flex-row">
									<div class="flex-right mt-2">

										<button type="button"
											class="btn btn-outline-secondary e-post-comment-cancel cancel-btn">
											취소</button>
										&nbsp;
										<button type="button" class="btn e-post-comment"
											style="background: #ff8C00; color: white;">등록</button>

									</div>
								</div>
							</div>
						</div>
						<c:forEach var="r" items="${list }">
							<div class="content__body">
								<div
									class="content__body__comment-list e-content__body__comment-list">
									<div class="answer__comment" data-id="116324">
										<a id="116324" class="answer__comment-snap" name="116324"></a>
										<div class="comment__card"
											style="border: solid; background: white; border-color: white; border-radius: 10px">
											<div class="comment__header flex-row">
												<div class="flex-column comment__sub-header">
	
													<div class="flex-row comment__user-name-container">
														<a href="/users/372707/@" class="comment__user-name">${r.u_id }</a>
													</div>
													<span class="comment__updated-at">${r.r_date }</span>
												</div>
											</div>
											<div class="comment__body markdown-body">
												<p>${r.r_content }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>