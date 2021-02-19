<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<div>
		<fieldset>
			<legend>회원탈퇴</legend>
			<p>*회원탈퇴처리가 완료되었습니다.*<br>
			그 동안 저의 사이트를 이용해 주셔서 감사합니다.</p>
			
			<button type="button" class="firebye" onclick="location.href='${contextPath}/main/main.do'">메인으로</button>
		</fieldset>
	</div>
</body>
</html>