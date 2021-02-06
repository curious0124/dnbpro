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
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	background-color: #f7f7f7;
}

.cust_faq {
	width: 90%;
	margin: 0 auto;
	text-align: center;
}

.cust_faq div {
	border-top-style: solid;
}

.cust_faq_title, .cust_faq_content {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	border-right-style: solid;
	border-left-style: solid;
}
</style>

<body>
	  <c:choose>
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
	</c:choose>	
</body>
</html>