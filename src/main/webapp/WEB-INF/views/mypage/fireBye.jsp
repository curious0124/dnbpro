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
<style>
body{background-color: #F4F9FC;}
.fire00{
	text-align: center;
}
.fire01{
	font-size: 35px;
	font-family: "돋음";
}
.fire02{
	font-size: 35px;
	color: #58ACFA;	
	font-family: "돋음";
}
.fire03{
	font-size: 20px;
	font-family: "돋음";
}
.fire04{
	font-family: "돋음";
}
.firebye{
	width: 150px;
	font-family: "돋음";
	border-radius: 5px;
    background-color:#E6E6E6;
    box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.15);
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
							<h2>Withdrawal</h2>
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
	<div class="fire00">
		<fieldset>
		<div><span class="fire01">회원탈퇴가 </span><span class="fire02">&nbsp완료되었습니다.</span></div>
		<div>
		<div>&nbsp</div>
		<p><strong class="fire03">그동안 DNB서비스를 이용해 주셔서 감사합니다.</strong></p>
		<p class="fire04">보다 나은 서비스로 다시 찾아 뵙겠습니다.</p>
		</div>
		
			
			<button type="button" class="firebye" onclick="location.href='${contextPath}/main/main.do'">메인으로</button>
		</fieldset>
	</div>
	</div>

	</section>
</body>
</html>