<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

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

<title>모두의 자격증</title>
<style>
.deleteButton {
	width: 16;
	height: 16;
	margin-left: auto;
	border: none;
	background: transparent;
}

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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	const urlParams = new URL(location.href).searchParams;
	const ss_id = urlParams.get('s_id');
	window.onload = function() {
		history.pushState(null, null, 'studyPostDetail.do?s_id=' + ss_id);
	}

	function studyPostDeleteButton(s_id) {
		if (window.confirm("정말 스터디 글을 삭제하시겠습니까?")) {
			var studyPostDelete = 'studyPostDelete.do?s_id=' + s_id;
			location.href = studyPostDelete;
		}
	}
	
	function changeRecruitmentButton(u_id, s_id, s_state) {
		  var uid = "<%=(String) session.getAttribute("id")%>";
		if (uid === u_id) {
			var studyStateChange = 'studyStateChange.do?s_id=' + s_id
					+ '&s_state=' + s_state;
			location.href = studyStateChange;
		}
	}

	function confirmModal(r_id, s_id) {
		if (window.confirm("정말 댓글을 삭제하시겠습니까?")) {
			var link = 'replyDelete.do?r_id=' + r_id + '&s_id=' + s_id;
			location.href = link;
		}
	}
</script>
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
							<h1>${studyVO.s_title }</h1>
						</div>
						<br>
						<div class="header__sub-title">
							<div class="header__sub-title__content">
								<!--작성자, 작성일, 시간, 조회수 -->
								<h6 class="user-name">작성자 : ${studyVO.u_id }</h6>
								<div class="content-date">
									<span class="sub-title sub-title__created-at"> <span
										class="sub-title__title">작성일</span> <span
										class="sub-title__value">${studyVO.s_date }</span>
									</span> <span class="sub-title sub-title__view-count"> <span
										class="sub-title__title">조회수</span> <span
										class="sub-title__value">${studyVO.s_count }</span>
									</span>
									<div style="float:right; ">
										<button
											class="ac-button is-sm is-solid is-gray  ac-tag ac-tag--blue ">
											<span class="ac-tag__name" style="font-weight:700">${studyVO.exam_name }</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr style="color: black; border: solid">
					<div class="community-post-info__content">
						<!-- 스터디 글 내용 부분 -->

						<div style="min-height: 300px">
							<textarea class="studyContent" readonly="readonly"
								style="height: 300px; width: 100%; border: none; resize: none; font-size: 15px">${studyVO.s_content }</textarea>
						</div>
						<br> <br>
						<div class="post__features">
							<!-- 모집완료, 좋아요-->

							<div class="flex-row feature__status e-status e-hover-toggle"
								data-status="1" style="float: right">
								<c:if test="${studyVO.u_id eq id }">
									<button
										class="ac-button is-md is-solid button-rounded undefined "
										style="background: gray"
										onclick="studyPostDeleteButton('${studyVO.s_id}')">
										<b>글 삭제</b>
									</button>
								</c:if>
								<button
									class="ac-button is-md is-solid button-rounded undefined "
									style="background: #ff8c00"
									onclick="location.href='studyList.do'">
									<b>글 목록</b>
								</button>
							</div>
							<!-- 글목록 끝 -->

							<div class="flex-row feature__status e-status e-hover-toggle"
								data-status="1" style="float: left">
								<c:if test="${studyVO.s_state eq '모집중' }">
									<button
										class="recruitmentButton ac-button is-md is-solid button-rounded undefined "
										style="background: #ff8c00"
										onclick="changeRecruitmentButton('${studyVO.u_id}','${studyVO.s_id}','${studyVO.s_state}')">${studyVO.s_state}</button>
								</c:if>
								<c:if test="${studyVO.s_state eq '모집완료' }">
									<button
										class="recruitmentButton ac-button is-md is-solid button-rounded undefined "
										style="background: gray"
										onclick="changeRecruitmentButton('${studyVO.u_id}','${studyVO.s_id}','${studyVO.s_state}')">${studyVO.s_state}</button>
								</c:if>
							</div>

							<!-- 모집완료 버튼 끝 -->

							<div
								class="flex-row feature__recommend e-post-like e-hover-toggle"
								data-id="233255" data-status="" data-cnt="2"
								style="visibility: hidden;">

								<button
									class="ac-button is-md is-outlined is-white button-rounded undefined ">
									<svg width="16" height="16" viewBox="0 0 16 16"
										xmlns="http://www.w3.org/2000/svg">
										<path fill="#1B1C1D" fill-rule="evenodd" clip-rule="evenodd"
											d="M4.49095 2.66666C3.10493 2.66666 1.66663 3.92028 1.66663 5.67567C1.66663 7.74725 3.21569 9.64919 4.90742 11.0894C5.73796 11.7965 6.571 12.3653 7.19759 12.7576C7.51037 12.9534 7.7704 13.1045 7.95123 13.2061C7.96818 13.2156 7.98443 13.2247 7.99996 13.2333C8.01549 13.2247 8.03174 13.2156 8.04869 13.2061C8.22952 13.1045 8.48955 12.9534 8.80233 12.7576C9.42892 12.3653 10.262 11.7965 11.0925 11.0894C12.7842 9.64919 14.3333 7.74725 14.3333 5.67567C14.3333 3.92028 12.895 2.66666 11.509 2.66666C10.1054 2.66666 8.9751 3.59266 8.4743 5.09505C8.40624 5.29922 8.21518 5.43693 7.99996 5.43693C7.78474 5.43693 7.59368 5.29922 7.52562 5.09505C7.02482 3.59266 5.89453 2.66666 4.49095 2.66666ZM7.99996 13.8018L8.22836 14.2466C8.08499 14.3202 7.91493 14.3202 7.77156 14.2466L7.99996 13.8018ZM0.666626 5.67567C0.666626 3.368 2.55265 1.66666 4.49095 1.66666C6.01983 1.66666 7.25381 2.48414 7.99996 3.73655C8.74611 2.48414 9.98009 1.66666 11.509 1.66666C13.4473 1.66666 15.3333 3.368 15.3333 5.67567C15.3333 8.22121 13.4657 10.3823 11.7407 11.8509C10.863 12.5982 9.98767 13.1953 9.33301 13.6052C9.00516 13.8104 8.73133 13.9696 8.53847 14.0779C8.44201 14.1321 8.36571 14.1737 8.31292 14.2019C8.28653 14.2161 8.26601 14.2269 8.25177 14.2344L8.2352 14.2431L8.23054 14.2455L8.22914 14.2462C8.22897 14.2463 8.22836 14.2466 7.99996 13.8018C7.77156 14.2466 7.77173 14.2467 7.77156 14.2466L7.76938 14.2455L7.76472 14.2431L7.74815 14.2344C7.73391 14.2269 7.71339 14.2161 7.687 14.2019C7.63421 14.1737 7.55791 14.1321 7.46145 14.0779C7.26858 13.9696 6.99476 13.8104 6.66691 13.6052C6.01225 13.1953 5.13695 12.5982 4.25917 11.8509C2.53423 10.3823 0.666626 8.22121 0.666626 5.67567Z"></path></svg>
									<div class="text features__text">2</div>
								</button>
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
							댓글 <span class="answer-info__title--count">${replyCount }</span>
						</div>

					</div>
					<div class="community-post-info__content">
						<form action="replyWrite.do?s_id=${studyVO.s_id }" method="post">
							<c:if test="${id != null }">
								<div class="answer-comment" data-id="new">

									<div class="bootstrap-components comment__input">

										<div class="e-signin">


											<input type="text" placeholder="댓글을 작성해보세요."
												class="form-control form-control-lg " required="required"
												name="R_CONTENT">

										</div>

									</div>


									<div class="comment__editor e-comment__editor">
										<div class="markdown-body"></div>
										<div class="bootstrap-components comment__footer flex-row">
											<div class="flex-right mt-2">

												<button type="button"
													class="btn btn-outline-secondary e-post-comment-cancel cancel-btn">

													취소</button>
												&nbsp; <input type="submit" class="btn e-post-comment"
													style="background: #ff8C00; color: white;" value="등록">

											</div>
										</div>
									</div>
								</div>
							</c:if>
						</form>
						<c:forEach var="reply" items="${replyList }">
							<div class="content__body">
								<%--댓글 목록 시작 --%>
								<div
									class="content__body__comment-list e-content__body__comment-list">

									<div class="answer__comment" data-id="116324">
										<div class="comment__card"
											style="border: solid; background: white; border-color: white; border-radius: 10px;">
											<div class="comment__header flex-row">
												<div class="flex-column comment__sub-header">
													<div class="flex-row comment__user-name-container">
														<p class="comment__user-name">${reply.u_id }</p>
													</div>
													<span class="comment__updated-at">${reply.r_date }</span>
													<%-- 시간 형식 2021.06.17 오후 9:09 --%>
												</div>
												<c:if test="${id eq reply.u_id }">
													<button class="deleteButton"
														onclick="confirmModal('${reply.r_id}','${s_id }')">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" fill="currentColor" class="bi bi-x-square"
															viewBox="0 0 16 16">
 													 <path
																d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
													  <path
																d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
													</svg>
													</button>
												</c:if>
											</div>
											<div class="comment__body markdown-body">
												<p>${reply.r_content }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br>
							<%--댓글 목록 끝 --%>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>