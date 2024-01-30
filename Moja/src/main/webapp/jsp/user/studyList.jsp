<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 자격증</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.ac-button.is-text {
	border: unset;
	background-color: unset;
	color: #495057;
	font-weight: 500;
}

.rounded-pill {
	background: #FF8C00;
}

.pageButton {
	background: white;
	font-weight: 400;
	color: black;
}
</style>
<script>
	window.onload = function() {
		history.pushState(null, null, 'studyList.do?pageNum=${pageNum}');
		const urlParams = new URL(location.href).searchParams;
		const pageNum = urlParams.get('pageNum');
		
		$(".sortSelect").on("change", function() {
			var studySort = 'studyList.do?sort=' + this.value;
			location.href = studySort;
		})

		$(".s_stateSelect").on("click", function() {
			var studySort = 'studyList.do?s_state=' + this.value;
			location.href = studySort;
		})
		
		$(".pageNums${pageNum}").css("background","#FF8C00").css("font-weight","700").css("color","white");
		
		for(let i=1; i<=${totalPage}; i++){
			var pageNumsName = ".pageNums"+i;
			var min = 0;
			var max = 5;
			if(pageNum >= 3){
				min = Number(pageNum)-2;
				max = Number(pageNum)+3;
			}
			if(Number(pageNum)+3>${totalPage}){
				min=${totalPage}-5;
			}
			if(  $(pageNumsName).html()<=min || $(pageNumsName).html()>max){
				$(pageNumsName).css("display","none");
			}
		}
		
		
	}
</script>
</head>
<body>

	<br>
	<br>
	<section class="community-header" style="background: #FF8C00">
		<div class="community-header__content">
			<h2 class="community-header__title">함께 성장할 스터디를 모집해보세요</h2>
			<br>
			<p class="community-header__sub-title">강의 수강에서 더 나아가 함께 스터디까지!</p>
		</div>
	</section>


	<!--몸통부분  -->
	<section class="community-body">

		<div class="community-body__content">
			<div>
				<ul class="status">
					<li class="e-status active" data-status="">
						<button class="ac-button is-md is-text tab-button s_stateSelect"
							style="float: left;" value="all">전체</button>
					</li>
					<li class="e-status " data-status="unrecruited">

						<button class="ac-button is-md is-text tab-button s_stateSelect"
							style="float: left;" value="N">모집중</button>
					</li>
					<li class="e-status " data-status="recruited">

						<button class="ac-button is-md is-text tab-button s_stateSelect"
							style="float: left;" value="Y">모집완료</button>
					</li>
				</ul>
			</div>
			<div class="search-filter">

				<form class="search e-search" style="float: none"
					action="studyList.do">
					<div class="search-item" style="float: none">

						<div class="ac-input-with-item search-by-text e-search-input "
							style="width: 90%; float: left">
							<svg width="16" height="16" viewBox="0 0 16 16"
								xmlns="http://www.w3.org/2000/svg">
								<path fill="#212529" fill-rule="evenodd" clip-rule="evenodd"
									d="M11.5 7c0 .59-.116 1.176-.343 1.722-.226.546-.557 1.042-.975 1.46-.418.418-.914.75-1.46.975-.546.226-1.131.343-1.722.343-.59 0-1.176-.117-1.722-.343-.546-.226-1.042-.557-1.46-.975-.418-.418-.75-.914-.975-1.46C2.616 8.176 2.5 7.591 2.5 7c0-1.194.474-2.338 1.318-3.182C4.662 2.974 5.807 2.5 7 2.5c1.193 0 2.338.474 3.182 1.318C11.026 4.662 11.5 5.806 11.5 7zm-.82 4.74c-1.206.936-2.723 1.377-4.242 1.234-1.52-.143-2.928-.86-3.937-2.005C1.49 9.825.956 8.34 1.004 6.813c.047-1.526.675-2.976 1.754-4.055 1.08-1.08 2.53-1.707 4.055-1.755 1.525-.047 3.012.488 4.156 1.498 1.145 1.01 1.862 2.417 2.005 3.937.143 1.52-.298 3.036-1.234 4.242l3.04 3.04c.074.069.133.151.174.243.04.092.063.192.065.292.001.101-.017.201-.055.294-.038.094-.094.179-.165.25-.071.071-.156.127-.25.165-.093.038-.193.056-.293.054-.101-.001-.2-.023-.293-.064-.091-.041-.174-.1-.243-.174l-3.04-3.04z"></path></svg>
							<input value="" data-kv="s" type="text" spellcheck="false"
								placeholder="관심 스터디를 검색해보세요!" enterkeyhint="search"
								name="keyword">

						</div>
						&nbsp;
						<button
							class="ac-button is-md is-solid search-form__search e-search-posts"
							style="min-width: 96px; background: #FF8C00">검색</button>
					</div>
					<br>
				</form>
			</div>
			<div class="question-list-container">
				<div class="posts-container-header" style="overflow: hidden;">
					<!--sort 셀렉터(템플릿 이중 관리)-->
					<div class="ac-dropdown--text order-mb e-sel-order "
						style="float: left;">
						<select class="sortSelect">
							<option selected="">정렬</option>
							<option value="s_id">최신순</option>
							<option value="s_count">조회도순</option>
							<option value="replyCount">댓글많은순</option>
						</select>
					</div>
					<div class="posts-container-header__button-cover"></div>
					<br>
					<c:if test="${id !=null }">
						<button
							class="ac-button is-md is-solid is-gray posts-container-header__button features__new-question e-new-question "
							style="float: right">
							<a href="studyPostWrite.do"> <span class="infd-icon"><svg
										width="16" height="16" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 16 16">
								<path fill="#ffffff" fill-rule="evenodd"
											d="M11.508 1.451c.456-.455 1.195-.455 1.65 0l1.724 1.724c.456.456.456 1.194 0 1.65L13.02 6.687l-.008.008-7.219 6.89c-.132.126-.291.22-.466.273l-3.681 1.12c-.177.054-.369.006-.5-.124-.13-.131-.178-.323-.124-.5l1.115-3.666c.059-.192.166-.365.311-.504L9.651 3.31l1.857-1.858zM9.992 4.366l-6.854 6.542c-.02.02-.036.044-.044.072l-.843 2.769 2.785-.848c.025-.007.048-.02.067-.039l6.848-6.537-1.96-1.96zm2.675 1.26l1.508-1.508c.065-.065.065-.17 0-.236l-1.724-1.724c-.065-.065-.17-.065-.236 0l-1.508 1.509 1.96 1.96z"
											clip-rule="evenodd"></path></svg></span> <span
								class="posts-container-header__button-text">글쓰기</span></a>
						</button>
					</c:if>
				</div>
				<br>
				<c:forEach var="study" items="${studyList }">
					<ul class="question-list">
						<li class="question-container"><a class="e-click-post"
							href="studyPostDetail.do?s_id=${study.s_id }">

								<div class="question">
									<div class="question__info">
										<div class="question__title">
											<div class="title-sub__text">

												<div
													class="bootstrap-components question__status-tag question__status-tag--unrecruited">
													<c:if test="${study.s_state eq '모집중' }">
														<span class="badge rounded-pill"> 모집중 </span>
													</c:if>
													<c:if test="${study.s_state eq '모집완료' }">
														<span class="badge rounded-pill" style="background: gray">
															모집완료 </span>
													</c:if>
												</div>

											</div>
											<h3 class="title__text">
												${study.s_title } <span class="infd-icon title__icon">

												</span>
											</h3>
										</div>
										<p class="question__body">${study.s_content }</p>

										<div class="question__info-footer">
											<div class="question__info-detail">
												<span class="question__info-user-name">${study.u_id }</span>
												<span>&nbsp;·&nbsp;</span> <span>${study.s_date }</span>


											</div>
											<div class="question__info-userData">
												<dl>
													<dt class="visually-hidden">조회수</dt>
													<dd class="view__count">
														<i class="fa-regular fa-eye"></i> <span class="text">${study.s_count }</span>
													</dd>
													<dt class="visually-hidden">댓글</dt>
													<dd class="comment__count">
														<i class="fa-regular fa-comment"></i> <span class="text">${study.replyCount }</span>
													</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
						</a></li>
					</ul>
				</c:forEach>
			</div>
			<br>
			<nav class="pagination is-centered is-small" role="navagation"
				aria-label="pagination">
				<c:if test="${totalPage >= pageNum+1 }">
					<a class="pagination-next"
						href="studyList.do?pageNum=${pageNum+1 }">다음 페이지</a>
				</c:if>
				<ul class="pagination-list ">
					<c:if test="${1 != pageNum }">
						<li><a class="pagination-link "
							href="studyList.do?pageNum=1"
							aria-label="처음">처음</a></li>
					</c:if>
					&nbsp;
					<c:forEach var="i" begin="1" end="${totalPage }">
						<li><a class="pagination-link pageButton pageNums${i }"
							href="studyList.do?pageNum=${i }">${i }</a></li>
					</c:forEach>
					&nbsp;
					<c:if test="${totalPage != pageNum }">
						<li><a class="pagination-link "
							href="studyList.do?pageNum=${totalPage }"
							aria-label="끝">끝</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>
</body>
</html>