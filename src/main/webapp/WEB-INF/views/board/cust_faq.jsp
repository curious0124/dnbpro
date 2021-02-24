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
}

#listPaging {
	clear: both;
	text-align: center;
}

#listPaging>ul {
	margin: 0 auto;
}

#listPaging>ul>li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

</head>
<body>



	<c:forEach var="article" items="${articlesList }"
		varStatus="articleNum">
		<button class="accordion">
			<div class="cust_faq_title">${article.board_title }</div>
		</button>
		<div class="panel">
			<p>
			<div class="cust_faq_content">${article.board_content}</div>
			</p>

			<c:choose>
				<c:when
					test="${not empty article.board_img && article.board_img!='null' }">
					<input type="hidden" name="originalFileName"
						value="${article.board_img }" />
					<img
						src="${contextPath}/download.do?board_num=${article.board_num}&board_img=${article.board_img}"
						id="preview" />
					<br>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

		</div>
	</c:forEach>
	
		<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="cust_faq.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="cust_faq.do${pageMaker.makeQuery(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="cust_faq.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<form role="form" method="get">
		
  <div class="search">
   <%--  <select name="searchType">
      <option value="no"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
       <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>selected>아이디+이름</option>
      <option value="i"<c:out value="${scri.searchType eq 'i' ? 'selected' : ''}"/>>아이디</option>
      <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button> --%>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "cust_faq.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
		</form>
		
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








	<%-- 	  <c:choose>
	  <c:when test="${articlesList ==null }" >
	  	<div class="cust_faq">
		<div class="cust_faq_title">등록된 글이 없습니다.</div>
		<div class="cust_faq_content"></div>
		<div class="cust_faq_br">
			<br>
		</div>
	</div>
	  </c:when>
	  <c:when test="${articlesList !=null }" >
	   <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
	<div class="cust_faq">
		<div class="cust_faq_title">${article.board_title }</div>
		<div class="cust_faq_content">${article.board_content }</div>
		<div class="cust_faq_br">
			<br>
		</div>
	</div>
	</c:forEach>
	</c:when>
	</c:choose>	 --%>
</body>
</html>