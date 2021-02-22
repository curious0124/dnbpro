<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result==2}">
		<script>
			window.onload = function() {
				alert("정지된 회원입니다. 센터에 문의 바랍니다.");
				location.href = "${contextPath}/main/main.do";
			}
		</script>
	</c:when>
	<c:when test="${result==1 }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
	</c:when>
</c:choose>

<script>
	/* $("#submit").on("click", function(){
	 var userid = $("#user_id").val();
	
	
	
	
	 } */
</script>
</head>

<body>
	<form name="login" method="post"
		action="${contextPath}/member/login.do">
		<table border="1" width="80%" align="center">
			<tr align="center">
				<td>아이디</td>
				<td>비밀번호</td>
			</tr>
			<tr align="center">
				<td><input type="text" name="user_id" value="" size="20">
				</td>
				<td><input type="password" name="user_pwd" value="" size="20">
				</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="로그인"> <input
					type="reset" value="다시입력"></td>
				<td><button type="button" class="find_id_form" onclick="location.href='${contextPath}/member/find_id_form.do'">아이디 찾기</button></td>
				<td><button type="button" class="find_pw_form" onclick="location.href='${contextPath}/member/find_pw_form.do'">비밀번호 찾기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>