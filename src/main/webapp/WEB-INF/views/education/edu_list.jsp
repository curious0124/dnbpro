<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardList</title>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "edu_list.do" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<style>
#edu_top{margin-bottom: 20px;}
body{background-color: #F4F9FC;}
#page_bottom{margin-top: 30px;}
#edu_title_link{color: black; text-decoration: none;}
#edu_title_link:hover{color: red;}
.fs{ color: black; font-family: 'RIDIBatang'; text-decoration: none;}
</style>
</head>
<body>

	<!-- 상단 배너 -->
	<div class="breadcrumbs overlay"
		style="background-image:url('${contextPath}/resources/image/page_banner.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<!-- Bread Menu -->
						<div class="bread-menu">
							<ul>
								<li><a href="${contextPath}/main/main.do">Home</a></li>
								<li><a href="${contextPath}/education/edu_list.do">Education</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Education</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->

	<!-- 수정 한 테이블 -->
	<section class="features-area section-bg">
		<div class="container" id="edu_table">
				<div class="col" id="edu_search">
				<div class="row">
					<form role="form" method="get">
						<div class="btn-group pull-right"  id="edu_top" >
							<select name="searchType">
								<option value="ctn"
									<c:out value="${scri.searchType eq 'ctn' ? 'selected' : ''}"/>
									selected>카테고리+타이틀+장비이름</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>카테고리</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>타이틀</option>
								<option value="n"
									<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>장비이름</option>
							</select> <input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}" />
							<button id="searchBtn" type="button">검색</button>
						</div>
					</form>
					</div>
				</div>
			<table class="table table-light table-hover align-middle">
				<thead class="table-light text-center">
					<tr>
						<th class="col-1">글 번호</th>
						<th>썸네일</th>
						<th>제목</th>
						<th class="col-1">대분류</th>
						<th class="col-1">소분류</th>
						<th class="col-1">등록날짜</th>
						<th class="col-1">작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${educationList}" var="list"
						varStatus="educationNum">
						<tr class="align-middle" align="center">
							<td class="col-1">${educationNum.count}</td>
							<td><c:choose>
									<c:when
										test="${not empty list.edu_thuming && list.edu_thuming!='null' }">
										<input type="hidden" name="originalFileName"
											value="${list.edu_thuming}" />
										<img
											src="${contextPath}/edu_download.do?edu_num=${list.edu_num}&edu_thuming=${list.edu_thuming}"
											id="preview" />
										<br>
									</c:when>
									<c:otherwise>
										<b>이미지가 없습니다.</b>
									</c:otherwise>
								</c:choose></td>
							<td><a class="fs" id="edu_title_link"
								href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
							<td class="col-1">${list.cate_name}</td>
							<td class="col-1">${list.eq_name}</td>
							<td class="col-1">${list.edu_pub_date}</td>
							<td class="col-1">${list.edu_writer}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container" id="page_bottom">
			<div class="row">
				<div class="col float-center" id="listPaging">
					<nav aria-label="...">
					  <ul class="pagination pagination-lg justify-content-center">
					  <c:if test="${pageMaker.prev}">
					    <li class="page-item active " aria-current="page"><span class="page-link"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></span></li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    <li class="page-item"><a class="page-link" href="edu_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    <li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- 수정 한 테이블 -->
	<%-- 	<section class="features-area section-bg">
		<div class="container">
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid">
						<h1 class="mt-4">장비 교육</h1>
						<div class="card mb-4">
							<div class="card-body">
								<div class="table">
									<table class="table table-bordered" id="" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>썸네일</th>
												<th>제목</th>
												<th>대분류</th>
												<th>소분류</th>
												<th>등록날짜</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${educationList}" var="list" varStatus="educationNum">
												<tr align="center">
													<td>${educationNum.count}</td>
													<td><c:choose>
															<c:when test="${not empty list.edu_thuming && list.edu_thuming!='null' }">
																<input type="hidden" name="originalFileName" value="${list.edu_thuming}" />
																<img src="${contextPath}/edu_download.do?edu_num=${list.edu_num}&edu_thuming=${list.edu_thuming}" id="preview" />
																<br>
															</c:when>
															<c:otherwise>
																<b>이미지가 없습니다.</b>
															</c:otherwise>
														</c:choose></td>
													<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
													<td>${list.cate_name}</td>
													<td>${list.eq_name}</td>
													<td>${list.edu_pub_date}</td>
													<td>${list.edu_writer}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div> --%>


	<%-- 			<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="edu_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<form role="form" method="get">

				<div class="search">
					<select name="searchType">
						<option value="ctn"
							<c:out value="${scri.searchType eq 'ctn' ? 'selected' : ''}"/>
							selected>카테고리+타이틀+장비이름</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>카테고리</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>타이틀</option>
						<option value="n"
							<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>장비이름</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" />

					<button id="searchBtn" type="button">검색</button>

				</div>
			</form> --%>
</body>
</html>
