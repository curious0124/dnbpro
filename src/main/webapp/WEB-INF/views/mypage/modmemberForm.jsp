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
body{background-color: #F4F9FC;}
#company_text {
	font-size: 20px;
	font-weight: bold;
	color: red;
}
.memberMod00{
	text-align: left;
}
#main_reg {
	font-size: 30px;
	font-weight: bold;
	color: black;
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
			<center>
	<form  method="post" action="${contextPath}/mypage/modMember.do">
	<div class="memberMod00">
	<span id="main_reg">회원 정보 수정</span>
	<hr>
	<div>
	<span id="company_text01"></span>
	</div>
	</div>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_pwd">아이디</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_id" value="${member.user_id}" readonly="readonly">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_pwd">패스워드</label>
				</div>
				<div class="col">
					<input class="form-control" type="password" name="user_pwd" value="${member.user_pwd}">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_name">성명</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_name" value="${member.user_name}" readonly="readonly">
				</div>	
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_email">이메일</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_email" value="${member.user_email}">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_identity">주민등록번호</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_identity" value="${member.user_identity}"  readonly="readonly">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_phone">핸드폰</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_phone" value="${member.user_phone}">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label" for="user_addr">주소</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_addr" value="${member.user_addr}">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label">개인 팩스</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_fax" value="${member.user_fax}">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-2">
					<label class="control-label">개인 팩스</label>
				</div>
				<div class="col">
					<input class="form-control" type="text" name="user_fax" value="${member.user_fax}">
				</div>
			</div>
			<br>
			<!-- 버튼 -->
						<div class="col">
							<div class="row" id="bottom_btn">
								<div class="col-3"></div>
								<div class="col">
									<button class="btn btn-success" type="submit" id="submit">수정 하기</button>
								</div>
								<div class="col">
									<button class="cencle btn btn-danger" type="reset">다시 입력</button>
								</div>
								<div class="col-3"></div>
							</div>
						</div>
						<!-- 버튼 -->
			
	</form>
	</center>
	</div>
	</section>
</body>
</html>