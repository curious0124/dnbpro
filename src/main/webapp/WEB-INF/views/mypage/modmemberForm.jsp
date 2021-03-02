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
<title>회원 정보 수정창</title>
<style>
   .text_center{
     text-align:center;
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
								<li><a href="${contextPath}/mypage/mypage.do">MyPage</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Member information modification</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-- 상단 배너 -->
	<section class="features-area section-bg">
		<div class="container">
		<center>
				<div class="btn-group" role="group"
					aria-label="Basic mixed styles">
					<button type="button"
						onclick="location.href='${contextPath}/mypage/mypage.do' "
						class="btn btn-outline-danger">예약 내역</button>
					<button type="button"
						onclick="location.href='${contextPath}/mypage/modmemberForm.do?user_id=${user_id}' "
						class="btn btn-outline-dark">내정보 수정</button>
					<button type="button"
						onclick="location.href='${contextPath}/mypage/removeMember.do?user_id=${user_id}' "
						class="btn btn-outline-danger">회원 탈퇴</button>
				</div>
			</center>
			<div>&nbsp</div>
			<div>&nbsp</div>
			<div>&nbsp</div>
	<form method="post" action="${contextPath}/mypage/modMember.do">
	<h1  class="text_center">회원 정보 수정창</h1>
	<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="user_id" value="${member.user_id}" readonly="readonly"></td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" name="user_pwd" value="${member.user_pwd}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="user_name" value="${member.user_name}" readonly="readonly"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">주민번호</td>
	       <td width="400"><p><input type="text" name="user_identity" value="${member.user_identity}"  readonly="readonly"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">주소</td>
	       <td width="400"><p><input type="text" name="user_addr" value="${member.user_addr}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">팩스</td>
	       <td width="400"><p><input type="text" name="user_fax" value="${member.user_fax}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p><input type="text" name="user_email" value="${member.user_email}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화번호</td>
	       <td width="400"><p><input type="text" name="user_phone" value="${member.user_phone}"></td>
	    </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="수정하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
	</div>
	</section>
</body>
</html>