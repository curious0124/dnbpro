<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="loglist" value="${myRentList.log}" />
<style>
body{background-color: #F4F9FC;}
.table_top{margin-top: 30px; margin-bottom: 30px;}
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
								<li><a href="${contextPath}/mypage/mypage.do">MyPage</a></li>
								<li><a href="${contextPath}/mypage/myLogDetail.do?user_id=younglan&page=1&perPageNum=10">Log</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Log</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->








	<section class="features-area section-bg">
		<div class="bor container" id="">
			<div class="table_top row">
				<div class="col">
					<h4>반납/취소 내역</h4>
				</div>
			</div>
			<table class="table table-light table-hover align-middle">
				<thead class="table-light text-center">
					<tr>
						<td>장비시리얼번호</td>
						<td>모델명</td>
						<td>신청일</td>
						<td>시작일</td>
						<td>반납일</td>
						<td>상태</td>
					</tr>
				</thead>
				<tbody>
							<c:forEach var="log" items="${loglist}" varStatus="logNum">
								<tr>
									<td>${log.eq_serial}</td>
									<td>${log.eq_name}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.log_date}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.res_start}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.res_end}" /></td>
									<td>${log.status}</td>
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
					    <li class="page-item active " aria-current="page"><span class="page-link"><a href="myLogDetail.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></span></li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    <li class="page-item"><a class="page-link" href="myLogDetail.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    <li class="page-item"><a class="page-link" href="myLogDetail.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
			</section>
			
			
	<%-- 		<div class=my_reserv_apply>
			<fieldset>
				<legend>반납/취소 내역</legend>
				<div class=rent_area></div>
				<table class=rent_table border=1px>
					<tr bgcolor=#ccc>
						<td>장비시리얼번호</td>
						<td>모델명</td>
						<td>신청일</td>
						<td>시작일</td>
						<td>반납일</td>
						<td>상태</td>
					</tr>
					<c:choose>
						<c:when test="${loglist !=null }">
							<c:forEach var="log" items="${loglist}" varStatus="logNum">
								<tr>
									<td>${log.eq_serial}</td>
									<td>${log.eq_name}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.log_date}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.res_start}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${log.res_end}" /></td>
									<td>${log.status}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</fieldset>
			<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="myLogDetail.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<!-- <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> -->
						<li><a href="myLogDetail.do${pageMaker.makeQuery(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="myLogDetail.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div> --%>


</body>
</html>