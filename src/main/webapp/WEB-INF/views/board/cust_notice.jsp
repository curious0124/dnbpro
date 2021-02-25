<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

    
    
<title>공지사항</title>
</head>
<style>
#edu_top{margin-bottom: 20px;}
body{background-color: #F4F9FC;}
#page_bottom{margin-top: 30px;}
</style>
<script>
<script>
$(function(){
  $('#searchBtn').click(function() {
    self.location = "cust_notice.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
  });
});   
</script>


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
								<li><a href="${contextPath}/cust/cust_notice.do">Notice</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Notice</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->

	<!-- 수정 한 테이블 -->
	<section class="features-area section-bg">
		<div class="container" id="">
				<div class="col" id="">
				<div class="row">
					<form role="form" method="get">
						<div class="btn-group pull-right"  id="edu_top" >
							<select name="searchType">
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>selected>내용+제목</option>
							      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
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
						<th>제목</th>
						<th class="col-1">작성자</th>
						<th class="col-1">등록날짜</th>
					</tr>
				</thead>
				

				<tbody>
   					<c:forEach var="article" items="${articlesNoticeList }" varStatus="articleNum" >
						<tr align="center">
							<td class="col-1">${articleNum.count}</td>
							<td class="col-1"><a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${article.board_num}">${article.board_title }</a></td>
							<td class="col-1">${article.board_writer }</td>
							<td class="col-1">${article.board_date }</td>
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
					    <li class="page-item active " aria-current="page"><span class="page-link"><a href="cust_notice.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></span></li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    <li class="page-item"><a class="page-link" href="cust_notice.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    <li class="page-item"><a class="page-link" href="cust_notice.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</section>




























<%-- <c:choose>
		<c:when test="${articlesNoticeList ==null }">
			<div class="cust_notice_container">
        <div id='top_buttonbox'>
  		공지사항 게시판
   </div>
   <div class="cust_notice_listrow">
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_top" id="cust_notice_div1">글번호</div>
       <div class="cust_notice_col_top" id="cust_notice_div2">제목</div>
       <div class="cust_notice_col_top" id="cust_notice_div3">작성자</div>
       <div class="cust_notice_col_top" id="cust_notice_div4">작성일자</div>
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       
   </div>
   <div class="cust_notice_listrow">
      <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_list" id="cust_notice_div1"></div>
       <div class="cust_notice_col_list" id="cust_notice_div2">등록된 글이 없습니다.</div>
       <div class="cust_notice_col_list" id="cust_notice_div3"></div>
       <div class="cust_notice_col_list" id="cust_notice_div4"></div>
       <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>    
   </div>
    </div>
		</c:when>
		<c:when test="${articlesNoticeList !=null }">
			 <div class="cust_notice_container">
        <div id='top_buttonbox'>
  		공지사항 게시판
   </div>
   <div class="cust_notice_listrow">
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_top" id="cust_notice_div1">글번호</div>
       <div class="cust_notice_col_top" id="cust_notice_div2">제목</div>
       <div class="cust_notice_col_top" id="cust_notice_div3">작성자</div>
       <div class="cust_notice_col_top" id="cust_notice_div4">작성일자</div>
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       
   </div>
   <c:forEach var="article" items="${articlesNoticeList }" varStatus="articleNum" >
   	 <div class="cust_notice_listrow">
      <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_list" id="cust_notice_div1">${articleNum.count}</div>
       <div class="cust_notice_col_list" id="cust_notice_div2"><a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${article.board_num}">${article.board_title }</a></div>
       <div class="cust_notice_col_list" id="cust_notice_div3">${article.board_writer }</div>
       <div class="cust_notice_col_list" id="cust_notice_div4">${article.board_date }</div>
       <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>    
   </div>
   </c:forEach>
  
    </div>
		</c:when>
	</c:choose> 

				<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="cust_notice.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="cust_notice.do${pageMaker.makeSearch(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="cust_notice.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
<div>
	<form role="form" method="get">
		
  <div class="search">
    <select name="searchType">
       <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>selected>내용+제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>

  </div>
		</form>
</div>
 --%>
	
</body>
</html>