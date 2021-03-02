<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{background-color: #F4F9FC;}
.mainbodybody {
	width: 100%;
}

.fireset {
	width: 80%;
	margin: auto;
}


.divset2 {
	width: 50%;
	height: 300px;
	float: left;
	border-top: solid 1px;
	border-right: solid 1px;
}

.divset3 {
	width: 50%;
	height: 300px;
	float: left;
	border-top: solid 1px;
	border-left: solid 0px;
}

.fieldsetall {
	width: 100%;
}
.removeTitle{
	font-size: 30px;
}
.fireP {
	text-align: left;
	font-size: 20px;
	margin: 10px;
}
.firePs {
	text-align: left;
	padding-left: 20px;
}


.firebutton {
	width:100%;
	text-align: center;
	float: left;
	margin-top:20px;
		

}

.text {
	width: 50%;
	height: 100px;
	vertical-align: text-top;
}
.form-control{
	width: 400px;
	text-align:center;
}
.bside{
	padding-left:30px;
}
</style>
<script>
	$(function() {
		$(".fire1").click(function() {
			if ($("#user_pwd").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#user_pwd").focus();
				return false;
			}

			var confirm_val = confirm("탈퇴하시겠습니까?");

			if (confirm_val) {
				var checkArr = new Array();
				var user_pwd = "";

				$("input[class='cb']:checked").each(function() {
					checkArr.push($(this).attr("value"));
				});
				var user_pwd = $("#user_pwd").val();

				$.ajax({
					type : "post",
					data : {
						cb : checkArr,
						pwd : user_pwd
					},
					url : "${contextPath}/mypage/memberRemove.do",
					success : function(data) {
						console.log(data);
						if (data == 0) {
							alert("패스워드가 틀렸습니다.");
						} else {
 							location.href = "${contextPath}/mypage/fireBye.do";
						}
					}
				});

			}
		});

	});
</script>
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
			
	<div class=mainbody>
		<fieldset class=fireset>
			<legend class="removeTitle">회원탈퇴</legend>
			<br>
			<div>
				<form action="${contextPath }/mypage/fireBye" method="post">
					<div class="divset">
					<p class=fireP>
						<strong>회원탈퇴 전 유의사항</strong>
					</p>
					<p class=firePs>※ 회원 탈퇴전에 모든 장비를 반납해야 탈퇴가 가능합니다.</p>
					<p class=firePs>※ 장비를 잃어버리거나, 미 반납시에는 불이익을 받으실 수 있습니다.</p>
					<p class=firePs>※ 회원을 탈퇴하시겠습니까?</p>
					<br>
					</div>
					
						
						<div class=divset2>
							<br>
							<p class=fireP>
								<strong>탈퇴사유입력</strong>
							</p>
								<p class=firePs>▼ 향후 더 나은 서비스를 위해 탈퇴사유를 입력해주세요.</p>
								<div class="fireside">
									<p class=firePs>&nbsp;&nbsp; <input type=checkbox class=cb value="학업/업무 전념">학업/업무 전념</p>
									<p class=firePs>&nbsp;&nbsp; <input type=checkbox class=cb value="군입대영장">군 입대 영장</p>
									<p class=firePs>&nbsp;&nbsp; <input type=checkbox class=cb value="지구온난화">지구 온난화</p>
									<p class=firePs>&nbsp;&nbsp; <input type=checkbox class=cb value="자연주의로의 회귀">자연주의로의 회귀</p>
									<p class=firePs>&nbsp;&nbsp; <input type=checkbox class=cb value="기타">기타</p>
								</div>
							
						</div>
						<div class=divset3>
						<br>
								<p class=fireP>
								<strong>탈퇴추가인증</strong>
								</p>
					
								<p class=firePs>▼ 타인에 의한 탈퇴를 방지하기 위해 추가 인증을 진행합니다.</p>
								<div class="bside">
										<label class="control-label" for="user_id">아이디</label> <input
											class="form-control" type="text" id="user_id" name="user_id"
											value="${member.user_id}" readonly="readonly" />
										<br>
										<label class="control-label" for="user_pwd">패스워드</label> <input
											class="form-control" type="password" id="user_pwd"
											name="user_pwd" />
								</div>
						
						</div>
					
						<div class="firebutton">
							<input type="button" style="width: 100px; height: 30px;"
								class="fire1" value="회원탈퇴"> <input
								type="button" style="width: 100px; height: 30px;"
								class="fire2"
								onclick="location.href='${contextPath}/main/main.do'"
								value="탈퇴취소">
						</div>
					
				</form>
			</div>
		</fieldset>
	</div>
	</div>
	</section>
</body>
</html>