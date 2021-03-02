<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FAQ</title>

<style>
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.accordion:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	text-align: justify;
	
	display: grid;
	grid-template-columns:5% 60% 30% 5%;

	
}
.grid0{
	margin: 1px;
	grid-column-start: 2; grid-column-end: 3;
}

.grid1{
	margin: 10px;
	grid-column-start: 3; grid-column-end: 4;
}	

#edu_top{margin-bottom: 20px;}
body{background-color: #F4F9FC;}
#page_bottom{margin-top: 30px;}
#faq_preview{width:100%; height: 100%;}
.accordion span{
			font-size: 20px;
}
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
								<li><a href="${contextPath}/cust/cust_notice.do">FAQ</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>FAQ</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->

	<section class="features-area section-bg">
		<div class="container" id="">
	<c:forEach var="article" items="${articlesList }"
		varStatus="articleNum">
		<button class="accordion">
			<span class="col-3 cust_faq_num">Q </span>
			<span class="col-9 cust_faq_title">${article.board_title }</span>
		</button>
		<div class="panel">
			<div class="grid0 cust_faq_content">
				<span>
					<h3>Answer</h3>
				</span>
				<span >
					${article.board_content}
				</span>
			</div>
			<c:choose>
				<c:when
					test="${not empty article.board_img && article.board_img!='null' }">
					<div class="grid1">
					<input type="hidden" name="originalFileName" value="${article.board_img }" />
					<img src="${contextPath}/download.do?board_num=${article.board_num}&board_img=${article.board_img}" id="faq_preview" />
					<br>
					</div>
				</c:when>
				<c:otherwise>
					<div class="grid1"></div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
	</div>
		<div class="container" id="page_bottom">
			<div class="row">
				<div class="col float-center" id="listPaging">
					<nav aria-label="...">
					  <ul class="pagination pagination-lg justify-content-center">
					  <c:if test="${pageMaker.prev}">
					    <li class="page-item active " aria-current="page"><span class="page-link"><a href="cust_faq.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></span></li>
					   </c:if>
					   <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    <li class="page-item"><a class="page-link" href="cust_faq.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					   </c:forEach>
					   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    <li class="page-item"><a class="page-link" href="cust_faq.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					   </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
	
<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
</script>	
</body>
</html>